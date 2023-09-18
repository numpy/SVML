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
inline __m512d __svml_sin8_ha(__m512d zmm0)
{
    // vmovups   192+__svml_dsin_ha_data_internal(%rip), %zmm9
    // round_magic
    __m512d zmm9 = _mm512_set1_pd(6755399441055744.0); // 2^51
    // vmovups   128+__svml_dsin_ha_data_internal(%rip), %zmm7
    // round twords 16/PI
    __m512d zmm7 = _mm512_set1_pd(5.092958178940651);
    // vmovups   256+__svml_dsin_ha_data_internal(%rip), %zmm10
    __m512d zmm10 = _mm512_set1_pd(0.19634954084936207);
    // vmovups   320+__svml_dsin_ha_data_internal(%rip), %zmm1
    __m512d zmm1 = _mm512_set1_pd(7.654042492615175e-18);
    // vmovups   384+__svml_dsin_ha_data_internal(%rip), %zmm15
    __m512d zmm15 = _mm512_set1_pd(2.0557821170405322e-27);
    // vmovups   64+__svml_dsin_ha_data_internal(%rip), %zmm5
    __m512d zmm5 = _mm512_set1_pd(16777216.0);
    // vmovaps   %zmm0, %zmm8
    __m512d zmm8 = zmm0;
    // vfmadd213pd {rn-sae}, %zmm9, %zmm8, %zmm7
    zmm7 = _mm512_fmadd_pd(zmm7, zmm8, zmm9);
    /* start polynomial evaluation */
    // vmovups   1024+__svml_dsin_ha_data_internal(%rip), %zmm0
    zmm0 = _mm512_set1_pd(2.4794947980863574e-05);
    // vpcmpeqq  896+__svml_dsin_ha_data_internal(%rip), %zmm8, %k2
    __mmask8 k2 = _mm512_cmpeq_epi64_mask(_mm512_castpd_si512(zmm8), _mm512_set1_epi64(0x8000000000000000LL));
    /*
     * mask will be used to decide whether long arg. reduction is needed
     * dN
    */
    // vsubpd    {rn-sae}, %zmm9, %zmm7, %zmm14
    __m512d zmm14 = _mm512_sub_pd(zmm7, zmm9);
    // vandpd    __svml_dsin_ha_data_internal(%rip), %zmm8, %zmm11
    __m512d zmm11 = _mm512_and_pd(zmm8, _mm512_castsi512_pd(_mm512_set1_epi64(0x7fffffffffffffff)));

    /* Table lookup: Th, Tl/Th */
    // vpermt2pd 704+__svml_dsin_ha_data_internal(%rip), %zmm7, %zmm2
    double lut0[16] = {
        1.0, 0.9807852804032304, 0.9238795325112867, 0.8314696123025452,
        0.7071067811865476, 0.5555702330196022, 0.3826834323650898, 0.19509032201612828,
        0.0, -0.19509032201612828, -0.3826834323650898, -0.5555702330196022,
        -0.7071067811865476, -0.8314696123025452, -0.9238795325112867, -0.9807852804032304
    };
    __mmask8 true_mask = 0xFF;
    __m512d zmm2 = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut0), true_mask,
        _mm512_castpd_si512(zmm7),
        _mm512_loadu_pd(lut0 + 8)
    );

    // vmovups   512+__svml_dsin_ha_data_internal(%rip), %zmm3
    double lut1[16] = {
        0.0, 0.19509032201612828, 0.3826834323650898, 0.5555702330196022,
        0.7071067811865476, 0.8314696123025452, 0.9238795325112867, 0.9807852804032304,
        1.0, 0.9807852804032304, 0.9238795325112867, 0.8314696123025452,
        0.7071067811865476, 0.5555702330196022, 0.3826834323650898, 0.19509032201612828
    };
    __m512d zmm3 = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut1), true_mask,
        _mm512_castpd_si512(zmm7),
        _mm512_loadu_pd(lut1 + 8)
    );

    // vpermt2pd 832+__svml_dsin_ha_data_internal(%rip), %zmm7, %zmm6
    double lut2[16] = {
        0.0, 1.8546947554794783e-17, 1.7645055990275085e-17, 1.407385142159172e-18,
        -4.833648402589373e-17, 4.7094111652318166e-17, -1.0050768783377745e-17, -7.991075823335899e-18,
        0x0, 7.991075823335899e-18, 1.0050768783377745e-17, -4.7094111652318166e-17,
        4.833648402589373e-17, -1.407385142159172e-18, -1.7645055990275085e-17, -1.8546947554794783e-17
    };
    __m512d zmm6 = _mm512_mask_permutex2var_pd(
        _mm512_loadu_pd(lut2), true_mask,
        _mm512_castpd_si512(zmm7),
        _mm512_loadu_pd(lut2 + 8)
    );
    /* set sign of zero */
    // vxorpd    960+__svml_dsin_ha_data_internal(%rip), %zmm7, %zmm7{%k2}
    zmm7 = _mm512_maskz_xor_pd(k2, zmm7, _mm512_castsi512_pd(_mm512_set1_epi64(0x10)));
    // vfnmadd213pd {rn-sae}, %zmm8, %zmm14, %zmm10
    zmm10 = _mm512_fnmadd_pd(zmm10, zmm14, zmm8);
    // vcmppd    $22, {sae}, %zmm5, %zmm11, %k1
    __mmask8 k1 = _mm512_cmp_pd_mask(zmm11, zmm5, _CMP_NLE_UQ);
    // vpsrlq    $4, %zmm7, %zmm7
    zmm7 = _mm512_castsi512_pd(_mm512_srli_epi64(_mm512_castpd_si512(zmm7), 4));
    /* will branch if long arg. reduction needed */
    // kortestw  %k1, %k1

    /* continue argument reduction */
    // vmovaps   %zmm1, %zmm13
    __m512d zmm13 = zmm1;
    // vfnmadd213pd {rn-sae}, %zmm10, %zmm14, %zmm13
    zmm13 = _mm512_fnmadd_pd(zmm13, zmm14, zmm10);
    // vmovaps   %zmm15, %zmm4
    __m512d zmm4 = zmm15;
    // vfnmadd213pd {rn-sae}, %zmm13, %zmm14, %zmm4
    zmm4 = _mm512_fnmadd_pd(zmm4, zmm14, zmm13);
    /* (dN*dPI2)_h */
    // vsubpd    {rn-sae}, %zmm13, %zmm10, %zmm12
    __m512d zmm12 = _mm512_sub_pd(zmm10, zmm13);
    // vmovups   1088+__svml_dsin_ha_data_internal(%rip), %zmm10
    zmm10 = _mm512_set1_pd(-0.0013888888328985587);
    /* dR^2 */
    // vmulpd    {rn-sae}, %zmm4, %zmm4, %zmm5
    zmm5 = _mm512_mul_pd(zmm4, zmm4);
    /* -(dN*dPI2)_l */
    // vfnmadd231pd {rn-sae}, %zmm14, %zmm1, %zmm12
    zmm12 =_mm512_fnmadd_pd(zmm1, zmm14, zmm12);
    /* -(dN*dPI3)_h */
    // vsubpd    {rn-sae}, %zmm13, %zmm4, %zmm13
    zmm13 = _mm512_sub_pd(zmm4, zmm13);
    // vfmadd231pd {rn-sae}, %zmm5, %zmm0, %zmm10
    zmm10 = _mm512_fmadd_pd(zmm0, zmm5, zmm10);
    // vmovups   1216+__svml_dsin_ha_data_internal(%rip), %zmm0
    zmm0 = _mm512_set1_pd(-0.00019841269332253932);
    /* (dN*dPI3)_l */
    // vfmadd213pd {rn-sae}, %zmm13, %zmm15, %zmm14
    zmm14 = _mm512_fmadd_pd(zmm14, zmm15, zmm13);
    // vmovups   1152+__svml_dsin_ha_data_internal(%rip), %zmm15
    zmm15 = _mm512_set1_pd(2.755128336430562e-06);
    // vmovups   1280+__svml_dsin_ha_data_internal(%rip), %zmm13
    zmm13 = _mm512_set1_pd(0.04166666666647394);
    /* R_low */
    // vsubpd    {rn-sae}, %zmm14, %zmm12, %zmm14
    zmm14 = _mm512_sub_pd(zmm12, zmm14);
    // vfmadd231pd {rn-sae}, %zmm5, %zmm15, %zmm0
    zmm0 = _mm512_fmadd_pd(zmm15, zmm5, zmm0);
    // vfmadd213pd {rn-sae}, %zmm13, %zmm5, %zmm10
    zmm10 = _mm512_fmadd_pd(zmm10, zmm5, zmm13);
    // vmovups   1408+__svml_dsin_ha_data_internal(%rip), %zmm15
    zmm15 = _mm512_set1_pd(-0.4999999999999998);
    // vmovups   1344+__svml_dsin_ha_data_internal(%rip), %zmm12
    zmm12 = _mm512_set1_pd(0.008333333333315813);
    /* Sl */
    // vpsllq    $32, %zmm6, %zmm13
    zmm13 = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(zmm6), 32));
    // vfmadd213pd {rn-sae}, %zmm15, %zmm5, %zmm10
    zmm10 = _mm512_fmadd_pd(zmm10, zmm5, zmm15);
    // vfmadd213pd {rn-sae}, %zmm12, %zmm5, %zmm0
    zmm0 = _mm512_fmadd_pd(zmm0, zmm5, zmm12);
    // vmovups   1472+__svml_dsin_ha_data_internal(%rip), %zmm15
    zmm15 = _mm512_set1_pd(-0.16666666666666666);
    /* Sh + R*Ch */
    // vmovaps   %zmm2, %zmm9
    zmm9 = zmm2;
    // vfmadd213pd {rn-sae}, %zmm3, %zmm4, %zmm9
    zmm9 = _mm512_fmadd_pd(zmm9, zmm4, zmm3);
    // vfmadd213pd {rn-sae}, %zmm15, %zmm5, %zmm0
    zmm0 = _mm512_fmadd_pd(zmm0, zmm5, zmm15);
    /* (R*Ch)_high */
    // vsubpd    {rn-sae}, %zmm3, %zmm9, %zmm1
    zmm1 = _mm512_sub_pd(zmm9, zmm3);
    /* Ch - Sh*R */
    // vmovaps   %zmm3, %zmm12
    zmm12 = zmm3;
    /* (R*Ch_low) */
    // vfmsub231pd {rn-sae}, %zmm2, %zmm4, %zmm1
    zmm1 = _mm512_fmsub_pd(zmm4, zmm2, zmm1);
    // vfnmadd213pd {rn-sae}, %zmm2, %zmm4, %zmm12
    zmm12 = _mm512_fnmadd_pd(zmm12, zmm4, zmm2);
    /* R*Ch */
    // vmulpd    {rn-sae}, %zmm4, %zmm2, %zmm2
    zmm2 = _mm512_mul_pd(zmm2, zmm4);
    /* Sh*dCPoly */
    // vmulpd    {rn-sae}, %zmm10, %zmm3, %zmm3
    zmm3 = _mm512_mul_pd(zmm3, zmm10);
    /* (R*Ch_low) + R*Cl */
    // vfmadd213pd {rn-sae}, %zmm1, %zmm4, %zmm6
    zmm6 = _mm512_fmadd_pd(zmm6, zmm4, zmm1);
    /* Sl + R_low*(Ch-Sh*R) */
    // vfmadd213pd {rn-sae}, %zmm13, %zmm14, %zmm12
    zmm12 = _mm512_fmadd_pd(zmm12, zmm14, zmm13);
    // vpsllq    $63, %zmm7, %zmm1
    zmm1 = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(zmm7), 63));
    /* Sh*dCPoly + R*Ch*dSPoly */
    // vfmadd213pd {rn-sae}, %zmm3, %zmm2, %zmm0
    zmm0 = _mm512_fmadd_pd(zmm0, zmm2, zmm3);
    /* dLow = Sl + R_low*(Ch-Sh*R) + (R*Ch_low) + R*Cl */
    // vaddpd    {rn-sae}, %zmm12, %zmm6, %zmm4
    zmm4 = _mm512_add_pd(zmm6, zmm12);
    /* R^2*(Sh*dCPoly + R*Ch*dSPoly) + dLow */
    // vfmadd213pd {rn-sae}, %zmm4, %zmm5, %zmm0
    zmm0 = _mm512_fmadd_pd(zmm0, zmm5, zmm4);
    // vaddpd    {rn-sae}, %zmm0, %zmm9, %zmm6
    zmm6 = _mm512_add_pd(zmm9, zmm0);
    // vxorpd    %zmm1, %zmm6, %zmm0
    zmm0 = _mm512_xor_pd(zmm6, zmm1);

    if (k1) {
        printf("TODO: long reduction");
    }
    return zmm0;
}

