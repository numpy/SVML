/*
 * ALGORITHM DESCRIPTION:
 *
 *     (high accuracy implementation: < 1 ulp)
 *
 *     Argument representation:
 *     arg = N*Pi/2^k + r = B + (z+e)
 *             B = N*Pi/2^k
 *             z+e = r
 *
 *     Result calculation:
 *     sin(arg) = sin(B+z+e) =
 *     = [ (SHi+Sigma*z)+CHL*z ] + [ (CHL+Sigma)*PS + PC*SHi + e*(CHL+Sigma-SHi*z) + SLo ]
 *             Sigma = 2^round(log[2](cosB))
 *             CHL = cosB - Sigma
 *             SHi+SLo = sinB
 *             PS = sin(z) - z
 *             PC = cos(z)- 1
 *     Sigma, CHL, SHi, SLo are stored in table
 *     PS, PC are approximated by polynomials
 *
 */
inline __m512d __svml_sin8_ha(__m512d arg)
{
    const __m512d round_magic = _mm512_set1_pd(6755399441055744.0); // 2^51
    // round twords 16/PI
    const __m512d c16_pi = _mm512_set1_pd(5.092958178940651);
    const __m512d pi_16 = _mm512_set1_pd(0.19634954084936207);

    const __m512d round_correction = _mm512_set1_pd(7.654042492615175e-18);
    const __m512d round_adjustment = _mm512_set1_pd(2.0557821170405322e-27);

    __m512d long_arg_threshold = _mm512_set1_pd(16777216.0);
    __m512d pre_rounded = _mm512_fmadd_pd(c16_pi, arg, round_magic);
    /*
     * mask will be used to decide whether long arg. reduction is needed
     * dN
    */
    __m512d arg_abs = _mm512_and_pd(arg, _mm512_castsi512_pd(_mm512_set1_epi64(0x7fffffffffffffff)));
    __mmask8 is_long_arg = _mm512_cmp_pd_mask(arg_abs, long_arg_threshold, _CMP_NLE_UQ);
    /* will branch if long arg. reduction needed */
    // kortestw  %k1, %k1

    /* Table lookup: Th, Tl/Th */
    // cosB_lookup_table = cos(k*pi/16), with k in {0, 1, ..., 15}
    double lut0[16] = {
        1.0, 0.9807852804032304, 0.9238795325112867, 0.8314696123025452,
        0.7071067811865476, 0.5555702330196022, 0.3826834323650898, 0.19509032201612828,
        0.0, -0.19509032201612828, -0.3826834323650898, -0.5555702330196022,
        -0.7071067811865476, -0.8314696123025452, -0.9238795325112867, -0.9807852804032304
    };
    __mmask8 true_mask = 0xFF;
    __m512d cos_high = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut0), true_mask,
        _mm512_castpd_si512(pre_rounded),
        _mm512_loadu_pd(lut0 + 8)
    );

    // sinB_lookup_table = sin(k*pi/16), with k in {0, 1, ..., 15}
    double lut1[16] = {
        0.0, 0.19509032201612828, 0.3826834323650898, 0.5555702330196022,
        0.7071067811865476, 0.8314696123025452, 0.9238795325112867, 0.9807852804032304,
        1.0, 0.9807852804032304, 0.9238795325112867, 0.8314696123025452,
        0.7071067811865476, 0.5555702330196022, 0.3826834323650898, 0.19509032201612828
    };
    __m512d sin_high = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut1), true_mask,
        _mm512_castpd_si512(pre_rounded),
        _mm512_loadu_pd(lut1 + 8)
    );

    double lut2[16] = {
        0.0, 1.8546947554794783e-17, 1.7645055990275085e-17, 1.407385142159172e-18,
        -4.833648402589373e-17, 4.7094111652318166e-17, -1.0050768783377745e-17, -7.991075823335899e-18,
        0x0, 7.991075823335899e-18, 1.0050768783377745e-17, -4.7094111652318166e-17,
        4.833648402589373e-17, -1.407385142159172e-18, -1.7645055990275085e-17, -1.8546947554794783e-17
    };
    __m512d cos_low = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut2), true_mask,
        _mm512_castpd_si512(pre_rounded),
        _mm512_loadu_pd(lut2 + 8)
    );

    /* set sign of zero */
    __mmask8 szero_mask = _mm512_cmpeq_epi64_mask(_mm512_castpd_si512(arg), _mm512_set1_epi64(0x8000000000000000LL));
    __m512d sign = _mm512_mask_xor_pd(pre_rounded, szero_mask, pre_rounded, _mm512_castsi512_pd(_mm512_set1_epi64(0x10)));
    sign = _mm512_castsi512_pd(_mm512_srli_epi64(_mm512_castpd_si512(sign), 4));
    sign = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(sign), 63));

    __m512d rounded = _mm512_sub_pd(pre_rounded, round_magic);
    __m512d angle_difference = _mm512_fnmadd_pd(pi_16, rounded, arg);
    __m512d angle_reduction_high = _mm512_fnmadd_pd(round_correction, rounded, angle_difference);

    /* -(dN*dPI3)_h */
    __m512d reduced = _mm512_fnmadd_pd(round_adjustment, rounded, angle_reduction_high);
    /* Sh + R*Ch */
    __m512d sin_p0 = _mm512_fmadd_pd(cos_high, reduced, sin_high);

    /* (dN*dPI2)_h */
    __m512d zmm12 = _mm512_sub_pd(angle_difference, angle_reduction_high);
    /* -(dN*dPI2)_l */
    zmm12 =_mm512_fnmadd_pd(round_correction, rounded, zmm12);

    /* (dN*dPI3)_l */
    __m512d r_low = _mm512_sub_pd(reduced, angle_reduction_high);
    r_low = _mm512_fmadd_pd(rounded, round_adjustment, r_low);
    r_low = _mm512_sub_pd(zmm12, r_low);
    /* Sl */
    __m512d Sl = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(cos_low), 32));

    /* dR^2 */
    __m512d reduced2 = _mm512_mul_pd(reduced, reduced);

    __m512d sin_poly = _mm512_fmadd_pd(_mm512_set1_pd(2.755128336430562e-06), reduced2, _mm512_set1_pd(-0.00019841269332253932));
    sin_poly = _mm512_fmadd_pd(sin_poly, reduced2, _mm512_set1_pd(0.008333333333315813));
    sin_poly = _mm512_fmadd_pd(sin_poly, reduced2, _mm512_set1_pd(-0.16666666666666666));

    __m512d cos_poly = _mm512_fmadd_pd(_mm512_set1_pd(2.4794947980863574e-05), reduced2, _mm512_set1_pd(-0.0013888888328985587));
    cos_poly = _mm512_fmadd_pd(cos_poly, reduced2, _mm512_set1_pd(0.04166666666647394));
    cos_poly = _mm512_fmadd_pd(cos_poly, reduced2, _mm512_set1_pd(-0.4999999999999998));

    /* dLow = Sl + R_low*(Ch-Sh*R) + (R*Ch_low) + R*Cl */
    __m512d dLow = _mm512_add_pd(
        /* (R*Ch_low) + R*Cl */
        _mm512_fmadd_pd(cos_low, reduced,
            /* (R*Ch_low) */
            _mm512_fmsub_pd(reduced, cos_high, _mm512_sub_pd(sin_p0, sin_high) /* Ch - Sh*R */)
        ),
        /* Sl + R_low*(Ch-Sh*R) */
        _mm512_fmadd_pd(
            // (Ch-Sh*R)
            _mm512_fnmadd_pd(sin_high, reduced, cos_high),
            r_low, Sl
        )
    );
    /* R^2*(Sh*dCPoly + R*Ch*dSPoly) + dLow */
    __m512d result = _mm512_fmadd_pd(
        /* Sh*dCPoly + R*Ch*dSPoly */
        _mm512_fmadd_pd(
            sin_poly,
            /*R*CH*/
            _mm512_mul_pd(cos_high, reduced),
            /* Sh*dCPoly */
            _mm512_mul_pd(sin_high, cos_poly)
        ),
        reduced2,
        dLow
    );

    result = _mm512_add_pd(sin_p0, result);
    result = _mm512_xor_pd(result, sign);

    if (is_long_arg) {
        printf("TODO: long reduction");
    }
    return result;
}

