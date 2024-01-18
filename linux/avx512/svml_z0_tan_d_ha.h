
inline __m512d __svml_tan8_ha(__m512d x)
{
/*
 * ALGORITHM DESCRIPTION:
 *
 *      ( optimized for throughput, with small table lookup, works when HW FMA is available )
 *
 *      Implementation reduces argument x to |R|<pi/32
 *      16-entry tables used to store high and low parts of tan(x0)
 *      Argument x = N*pi + x0 + (R);   x0 = k*pi/16, with k in {0, 1, ..., 15}
 *      (very large arguments reduction resolved in _vdreduction_core.i)
 *      Compute result as (tan(x0) + tan(R))/(1-tan(x0)*tan(R))
 *      High accuracy ( < 1 ulp ) version keeps extra precision for numerator, denominator, and during
 *      final NR-iteration computing quotient.
 *
 *
 */
    __m512d zmm4, zmm7, zmm8,
            zmm12, zmm13, zmm14, zmm15;
    /*
     * ----------------------------------------------------------
     * Main path
     * ----------------------------------------------------------
     * start arg. reduction
     */
    const __m512d round_magic = _mm512_set1_pd(6755399441055744.0); // 2^51
    const __m512d round_twords = _mm512_set1_pd(5.092958178940651); // 16/PI
    /* Large values check */
    const __m512d large_val = _mm512_set1_pd(65536.00349206588);
    const __m512d tan_idx = _mm512_fmadd_pd(round_twords, x, round_magic); // zmm0
    const __m512d x_rounded = _mm512_sub_pd(tan_idx, round_magic);
    const __m512d x_abs = _mm512_and_pd(_mm512_castsi512_pd(_mm512_set1_epi64(0x7fffffffffffffffLL)), x);

    __mmask8 k1 = _mm512_cmp_pd_mask(x_abs, large_val, _CMP_NLE_UQ);

    // -(pi_16 * x_rounded) + x
    __m512d x_reduced = _mm512_fnmadd_pd(_mm512_set1_pd(0.19634954084936207), x_rounded, x);

    // vfnmadd213pd {rn-sae}, %zmm2, %zmm9, %zmm4
    __m512d zmm5 = _mm512_set1_pd(7.654042492615175e-18);
    zmm4 = _mm512_fnmadd_pd(zmm5, x_rounded, x_reduced);

    // vfnmadd213pd {rn-sae}, %zmm4, %zmm9, %zmm3
    __m512d zmm6 = _mm512_set1_pd(2.0557821170405322e-27);
    __m512d zmm3 = _mm512_fnmadd_pd(zmm6, x_rounded, zmm4);

    /* Calculate the lower part dRl */
    // vsubpd    {rn-sae}, %zmm4, %zmm2, %zmm8
    zmm8 = _mm512_sub_pd(x_reduced, zmm4);
    // vsubpd    {rn-sae}, %zmm4, %zmm3, %zmm7
    zmm7 = _mm512_sub_pd(zmm3, zmm4);

    // vfnmadd231pd {rn-sae}, %zmm9, %zmm5, %zmm8
    zmm8 = _mm512_fnmadd_pd(zmm5, x_rounded, zmm8);
    // vfmadd213pd {rn-sae}, %zmm7, %zmm6, %zmm9
    __m512d zmm9 = _mm512_fmadd_pd(zmm9, zmm6, zmm7);
    // vsubpd    {rn-sae}, %zmm9, %zmm8, %zmm12
    zmm12 = _mm512_sub_pd(zmm8, zmm9);

    // kortestw  %k1, %k1
    if (k1) {
        // large arguments reduction not implmented yet
        return _mm512_set1_pd(0);
    #if 0
        // large arguments
        // vmovups   1088+__svml_dtan_ha_data_internal(%rip), %zmm14
        zmm14 = _mm512_castsi512_pd(_mm512_set1_epi64(0x7ff0000000000000LL)); // inf
        // /*
        //  * Get the (2^a / 2pi) mod 1 values from the table.
        //  * Because VLANG doesn't have L-type gather, we need a trivial cast
        //  */
        // lea       __svml_dtan_ha_reduction_data_internal(%rip), %rax
        // vmovups   %zmm0, (%rsp)
        // vmovups   %zmm3, 64(%rsp)
        // vmovups   %zmm12, 128(%rsp)
        double rsp_zmm0[8], rsp_zmm3[8], rsp_zmm12[8];
        _mm512_storeu_pd(rsp_zmm0, tan_idx);
        _mm512_storeu_pd(rsp_zmm3, zmm3);
        _mm512_storeu_pd(rsp_zmm12, zmm12);
        // vandpd    %zmm10, %zmm14, %zmm0
        __m512d zmm0 = _mm512_and_pd(zmm14, x_abs);
        // vpbroadcastq .L_2il0floatpacket.18(%rip), %zmm10
        __m512d zmm10 = _mm512_castsi512_pd(_mm512_set1_epi64(0xffffffffffffffffLL));
        // vcmppd    $4, {sae}, %zmm14, %zmm0, %k2
        __mmask8 k2 = _mm512_cmp_pd_mask(zmm0, zmm14, _CMP_NEQ_UQ);
        // vmovaps   %zmm10, %zmm3
        zmm3 = zmm10;
        // vpandq    .L_2il0floatpacket.19(%rip){1to8}, %zmm11, %zmm7
        zmm7 = _mm512_and_pd(x, _mm512_castsi512_pd(_mm512_set1_epi64(0x7ff0000000000000LL)));
        // vpsrlq    $52, %zmm7, %zmm8
        zmm8 = _mm512_castsi512_pd(_mm512_srli_epi64(_mm512_castpd_si512(zmm7), 52));
        // vpsllq    $1, %zmm8, %zmm6
        zmm6 = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(zmm8), 1));
        // vpaddq    %zmm8, %zmm6, %zmm5
        zmm5 = _mm512_castsi512_pd(_mm512_add_epi64(_mm512_castpd_si512(zmm6), _mm512_castpd_si512(zmm8)));
        // /*
        //  * Break the P_xxx and m into 32-bit chunks ready for
        //  * the long multiplication via 32x32->64 multiplications
        //  */
        // vpbroadcastq .L_2il0floatpacket.22(%rip), %zmm6
        zmm6 = _mm512_castsi512_pd(_mm512_set1_epi64(0xffffffff));
        // vpsllq    $3, %zmm5, %zmm4
        zmm4 = _mm512_castsi512_pd(_mm512_slli_epi64(_mm512_castpd_si512(zmm5), 3));
        // vpmovqd   %zmm4, %ymm9
        __m256d ymm9 = _mm512_castpd512_pd256(zmm4);
        // vpandnq   %zmm0, %zmm0, %zmm3{%k2}
        zmm3 = _mm512_castsi512_pd(_mm512_maskz_andnot_epi64(k2, _mm512_castpd_si512(zmm0), _mm512_castpd_si512(zmm0)));
        // vcmppd    $3, {sae}, %zmm3, %zmm3, %k0
        __mmask8 k0 = _mm512_cmp_pd_mask(zmm3, zmm3, _CMP_UNORD_Q);
        // kxnorw    %k0, %k0, %k3
        __mmask8 k3 = _mm512_kxnor(k0, k0);
        // kxnorw    %k0, %k0, %k2
        k2 = _mm512_kxnor(k0, k0);
        // kmovw     %k0, %edx
        unsigned edx = k2;
        // vpxord    %zmm2, %zmm2, %zmm2
        // vgatherdpd (%rax,%ymm9), %zmm2{%k3}
        // kxnorw    %k0, %k0, %k3
        // vpsrlq    $32, %zmm2, %zmm0
        // vpxord    %zmm1, %zmm1, %zmm1
        // vpxord    %zmm3, %zmm3, %zmm3
        // vgatherdpd 8(%rax,%ymm9), %zmm1{%k2}
        // vgatherdpd 16(%rax,%ymm9), %zmm3{%k3}
        // vpsrlq    $32, %zmm1, %zmm9
        // vpsrlq    $32, %zmm3, %zmm13
        // /*
        //  * Also get the significand as an integer
        //  * NB: adding in the integer bit is wrong for denorms!
        //  * To make this work for denorms we should do something slightly different
        //  */
        // vpandq    .L_2il0floatpacket.20(%rip){1to8}, %zmm11, %zmm15
        // vpaddq    .L_2il0floatpacket.21(%rip){1to8}, %zmm15, %zmm14
        // vpsrlq    $32, %zmm14, %zmm7
        // vpandq    %zmm6, %zmm2, %zmm5
        // vpandq    %zmm6, %zmm1, %zmm12
        // vpandq    %zmm6, %zmm3, %zmm8
        // vpandq    %zmm6, %zmm14, %zmm14
        // /* Now do the big multiplication and carry propagation */
        // vpmullq   %zmm5, %zmm7, %zmm4
        // vpmullq   %zmm9, %zmm7, %zmm3
        // vpmullq   %zmm12, %zmm7, %zmm2
        // vpmullq   %zmm13, %zmm7, %zmm1
        // vpmullq   %zmm8, %zmm7, %zmm8
        // vpmullq   %zmm0, %zmm14, %zmm7
        // vpmullq   %zmm5, %zmm14, %zmm5
        // vpmullq   %zmm9, %zmm14, %zmm9
        // vpmullq   %zmm12, %zmm14, %zmm0
        // vpmullq   %zmm13, %zmm14, %zmm12
        // vpsrlq    $32, %zmm9, %zmm15
        // vpsrlq    $32, %zmm0, %zmm13
        // vpsrlq    $32, %zmm12, %zmm14
        // vpsrlq    $32, %zmm5, %zmm12
        // vpaddq    %zmm15, %zmm3, %zmm15
        // vpaddq    %zmm14, %zmm1, %zmm1
        // vpaddq    %zmm12, %zmm4, %zmm3
        // vpaddq    %zmm13, %zmm2, %zmm2
        // vpandq    %zmm6, %zmm0, %zmm13
        // vpandq    %zmm6, %zmm7, %zmm7
        // vpaddq    %zmm1, %zmm13, %zmm4
        // vpaddq    %zmm3, %zmm7, %zmm13
        // vpsrlq    $32, %zmm8, %zmm3
        // vpaddq    %zmm4, %zmm3, %zmm14
        // vpsrlq    $32, %zmm14, %zmm8
        // vpandq    %zmm6, %zmm9, %zmm0
        // vpaddq    %zmm2, %zmm0, %zmm9
        // vpaddq    %zmm9, %zmm8, %zmm3
        // vpsrlq    $32, %zmm3, %zmm1
        // vpandq    %zmm6, %zmm5, %zmm5
        // vpaddq    %zmm15, %zmm5, %zmm2
        // vpaddq    %zmm2, %zmm1, %zmm15
       /// *
        // * Now round at the 2^-9 bit position for reduction mod pi/2^8
        // * instead of the original 2pi (but still with the same 2pi scaling).
        // * Use a shifter of 2^43 + 2^42.
        // * The N we get is our final version; it has an offset of
        // * 2^9 because of the implicit integer bit, and anyway for negative
        // * starting value it's a 2s complement thing. But we need to mask
        // * off the exponent part anyway so it's fine.
        // */
        // vpbroadcastq .L_2il0floatpacket.25(%rip), %zmm1
        // vpsrlq    $32, %zmm15, %zmm12
        // vpaddq    %zmm13, %zmm12, %zmm0
        // /* Assemble reduced argument from the pieces */
        // vpandq    %zmm6, %zmm14, %zmm8
        // vpandq    %zmm6, %zmm15, %zmm7
        // vpsllq    $32, %zmm0, %zmm6
        // vpsllq    $32, %zmm3, %zmm0
        // vpaddq    %zmm7, %zmm6, %zmm4
        // vpaddq    %zmm8, %zmm0, %zmm5
        // vpsrlq    $12, %zmm4, %zmm3
        // /*
        //  * We want to incorporate the original sign now too.
        //  * Do it here for convenience in getting the right N value,
        //  * though we could wait right to the end if we were prepared
        //  * to modify the sign of N later too.
        //  * So get the appropriate sign mask now (or sooner).
        //  */
        // vpandq    .L_2il0floatpacket.23(%rip){1to8}, %zmm11, %zmm9
        // /*
        //  * Create floating-point high part, implicitly adding integer bit 1
        //  * Incorporate overall sign at this stage too.
        //  */
        // vpxorq    .L_2il0floatpacket.24(%rip){1to8}, %zmm9, %zmm6
        // vporq     %zmm6, %zmm3, %zmm2
        // vaddpd    {rn-sae}, %zmm2, %zmm1, %zmm13
        // vsubpd    {rn-sae}, %zmm1, %zmm13, %zmm12
        // vsubpd    {rn-sae}, %zmm12, %zmm2, %zmm8
        // vpandq    .L_2il0floatpacket.28(%rip){1to8}, %zmm5, %zmm14
        // vpsllq    $28, %zmm14, %zmm15
        // vpsrlq    $24, %zmm5, %zmm5
        // vandpd    .L_2il0floatpacket.33(%rip){1to8}, %zmm11, %zmm14
        // vpandq    .L_2il0floatpacket.30(%rip){1to8}, %zmm4, %zmm4
        // /*
        //  * Create floating-point low and medium parts, respectively
        //  * lo_23, ... lo_0, 0, ..., 0
        //  * hi_11, ... hi_0, lo_63, ..., lo_24
        //  * then subtract off the implicitly added integer bits,
        //  * 2^-104 and 2^-52, respectively.
        //  * Put the original sign into all of them at this stage.
        //  */
        // vpxorq    .L_2il0floatpacket.27(%rip){1to8}, %zmm9, %zmm3
        // vpxorq    .L_2il0floatpacket.29(%rip){1to8}, %zmm9, %zmm1
        // vpsllq    $40, %zmm4, %zmm9
        // vporq     %zmm3, %zmm15, %zmm0
        // vsubpd    {rn-sae}, %zmm3, %zmm0, %zmm6
        // vporq     %zmm5, %zmm9, %zmm0
        // vporq     %zmm1, %zmm0, %zmm3
        // vsubpd    {rn-sae}, %zmm1, %zmm3, %zmm2
        // /*
        //  * Now multiply those numbers all by 2 pi, reasonably accurately.
        //  * (RHi + RLo) * (pi_lead + pi_trail) ~=
        //  * RHi * pi_lead + (RHi * pi_trail + RLo * pi_lead)
        //  */
        // vpbroadcastq .L_2il0floatpacket.31(%rip), %zmm5
        // /* Now add them up into 2 reasonably aligned pieces */
        // vaddpd    {rn-sae}, %zmm2, %zmm8, %zmm12
        // vmulpd    {rn-sae}, %zmm5, %zmm12, %zmm15
        // vsubpd    {rn-sae}, %zmm12, %zmm8, %zmm8
        // vaddpd    {rn-sae}, %zmm8, %zmm2, %zmm4
        // vmovaps   %zmm5, %zmm9
        // vfmsub213pd {rn-sae}, %zmm15, %zmm12, %zmm9
        // vaddpd    {rn-sae}, %zmm6, %zmm4, %zmm1
        // vpbroadcastq .L_2il0floatpacket.32(%rip), %zmm6
        // vmovaps   %zmm10, %zmm3
        // vfmadd213pd {rn-sae}, %zmm9, %zmm6, %zmm12
        // vpbroadcastq .L_2il0floatpacket.36(%rip), %zmm9
        // vfmadd213pd {rn-sae}, %zmm12, %zmm5, %zmm1
        // vpbroadcastq .L_2il0floatpacket.37(%rip), %zmm12
        // /* Grab our final N value as an integer, appropriately masked mod 2^9 */
        // vpandq    .L_2il0floatpacket.26(%rip){1to8}, %zmm13, %zmm7
        // /*
        //  * If the magnitude of the input is <= 2^-20, then
        //  * just pass through the input, since no reduction will be needed and
        //  * the main path will only work accurately if the reduced argument is
        //  * about >= 2^-70 (which it is for all large pi multiples)
        //  */
        // vpbroadcastq .L_2il0floatpacket.34(%rip), %zmm13
        // /* The output is _VRES_Z (high) + _VRES_E (low), and the integer part is _VRES_IND */
        // vpmovqd   %zmm7, %ymm5
        // vcmppd    $26, {sae}, %zmm13, %zmm14, %k2
        // vcmppd    $22, {sae}, %zmm13, %zmm14, %k3
        // vpandnq   %zmm14, %zmm14, %zmm3{%k2}
        // vpandnq   %zmm14, %zmm14, %zmm10{%k3}
        // vandpd    %zmm11, %zmm10, %zmm10
        // vandpd    %zmm15, %zmm3, %zmm0
        // vorpd     %zmm0, %zmm10, %zmm0
        // vandpd    %zmm1, %zmm3, %zmm10
        // vpsrlq    $32, %zmm0, %zmm7
        // vpmovqd   %zmm7, %ymm3
        // vmovdqu   .L_2il0floatpacket.35(%rip), %ymm7
        // vpsrld    $31, %ymm3, %ymm1
        // vmovups   64(%rsp), %zmm3
        // vpsubd    %ymm1, %ymm7, %ymm2
        // vpaddd    %ymm2, %ymm5, %ymm4
        // vpsrld    $4, %ymm4, %ymm13
        // vpslld    $4, %ymm13, %ymm6
        // vpsubd    %ymm6, %ymm5, %ymm8
        // vmovaps   %zmm0, %zmm14
        // vcvtdq2pd %ymm8, %zmm15
        // vfmadd231pd {rn-sae}, %zmm15, %zmm9, %zmm14
        // vfnmadd213pd {rn-sae}, %zmm14, %zmm15, %zmm9
        // vblendmpd %zmm14, %zmm3, %zmm3{%k1}
        // vsubpd    {rn-sae}, %zmm9, %zmm0, %zmm0
        // vfmadd213pd {rn-sae}, %zmm0, %zmm12, %zmm15
        // /*
        //  * ----------------------------------------------------------
        //  * End of large arguments path
        //  * ----------------------------------------------------------
        //  * Merge results from main and large paths:
        //  */
        // vmovups   (%rsp), %zmm0
        // vmovups   128(%rsp), %zmm12
        // vpmovzxdq %ymm13, %zmm0{%k1}
        // vaddpd    {rn-sae}, %zmm10, %zmm15, %zmm12{%k1}
        // jmp       .LBL_1_2
        #endif
    }
    // .LBL_1_2:
    // vmulpd    {rn-sae}, %zmm3, %zmm3, %zmm8
    zmm8 = _mm512_mul_pd(zmm3, zmm3);
    // vmovups   384+__svml_dtan_ha_data_internal(%rip), %zmm1
    // vpermt2pd 448+__svml_dtan_ha_data_internal(%rip), %zmm0, %zmm1
    long long lut_low[] = {
        0x8000000000000000,  // 384 - -0.0
        0x3fc975f5e0553158,  // 392 - 0.198912367379658
        0x3fda827999fcef32,  // 400 - 0.41421356237309503
        0x3fe561b82ab7f990,  // 408 - 0.6681786379192989
        0x3ff0000000000000,  // 416 - 1.0
        0x3ff7f218e25a7461,  // 424 - 1.496605762665489
        0x4003504f333f9de6,  // 432 - 2.414213562373095
        0x40141bfee2424771,  // 440 - 5.027339492125848
        0xffefffffffffffff,  // 448 - -1.7976931348623157e+308
        0xc0141bfee2424771,  // 456 - -5.027339492125848
        0xc003504f333f9de6,  // 464 - -2.414213562373095
        0xbff7f218e25a7461,  // 472 - -1.496605762665489
        0xbff0000000000000,  // 480 - -1.0
        0xbfe561b82ab7f990,  // 488 - -0.6681786379192989
        0xbfda827999fcef32,  // 496 - -0.41421356237309503
        0xbfc975f5e0553158   // 504 - -0.198912367379658
    };
    __m512d low0 = _mm512_castsi512_pd(_mm512_loadu_si512(lut_low));
    __m512d low1 = _mm512_castsi512_pd(_mm512_loadu_si512(lut_low + 8));
    __mmask8 true_mask = 0xFF;
    __m512d zmm1 = _mm512_mask_permutex2var_pd(low0, true_mask, _mm512_castpd_si512(tan_idx), low1);
    // vmovups   512+__svml_dtan_ha_data_internal(%rip), %zmm2
    // vpermt2pd 576+__svml_dtan_ha_data_internal(%rip), %zmm0, %zmm2
    long long lut_high[] = {
        0x8000000000000000,  // 512 - -0.0
        0x3c2ef5d367441946,  // 520 - 8.391794477636538e-19
        0x3c708b2fb1366ea9,  // 528 - 1.4349369327986523e-17
        0x3c87a8c52172b675,  // 536 - 4.1042270233610004e-17
        0x0,                 // 544 - 0.0
        0x3c9419fa6954928f,  // 552 - 6.974100888958305e-17
        0x3ca21165f626cdd5,  // 560 - 1.2537167179050217e-16
        0x3c810706fed37f0e,  // 568 - 2.95379181037367e-17
        0xfca0000000000000,  // 576 - -1.99584030953472e+292
        0xbc810706fed37f0e,  // 584 - -2.95379181037367e-17
        0xbca21165f626cdd5,  // 592 - -1.2537167179050217e-16
        0xbc9419fa6954928f,  // 600 - -6.974100888958305e-17
        0x0,                 // 608 - 0.0
        0xbc87a8c52172b675,  // 616 - -4.1042270233610004e-17
        0xbc708b2fb1366ea9,  // 624 - -1.4349369327986523e-17
        0xbc2ef5d367441946   // 632 - -8.391794477636538e-19
    };
    __m512d high0 = _mm512_castsi512_pd(_mm512_loadu_si512(lut_high));
    __m512d high1 = _mm512_castsi512_pd(_mm512_loadu_si512(lut_high + 8));
    __m512d zmm2 = _mm512_mask_permutex2var_pd(high0, true_mask, _mm512_castpd_si512(tan_idx), high1);
    // vmovups   832+__svml_dtan_ha_data_internal(%rip), %zmm7
    zmm7 = _mm512_set1_pd(0.021868398780266727);
    // vmovups   768+__svml_dtan_ha_data_internal(%rip), %zmm4
    zmm4 = _mm512_set1_pd(0.053968259204860994);
    // vmovups   704+__svml_dtan_ha_data_internal(%rip), %zmm5
    zmm5 = _mm512_set1_pd(0.13333333332235503);
    // vmovups   640+__svml_dtan_ha_data_internal(%rip), %zmm6
    zmm6 = _mm512_set1_pd(0.3333333333333408);
    // vmovups   896+__svml_dtan_ha_data_internal(%rip), %zmm0
    __m512d zmm0 = _mm512_set1_pd(0.008966064307285021);
    // vfmadd231pd {rn-sae}, %zmm8, %zmm0, %zmm7
    zmm7 = _mm512_fmadd_pd(zmm0, zmm8, zmm7);
    // vfmadd213pd {rn-sae}, %zmm4, %zmm8, %zmm7
    zmm7 = _mm512_fmadd_pd(zmm7, zmm8, zmm4);
    // vfmadd213pd {rn-sae}, %zmm5, %zmm8, %zmm7
    zmm7 = _mm512_fmadd_pd(zmm7, zmm8, zmm5);
    // vfmadd213pd {rn-sae}, %zmm6, %zmm8, %zmm7
    zmm7 = _mm512_fmadd_pd(zmm7, zmm8, zmm6);
    // vmulpd    {rn-sae}, %zmm3, %zmm7, %zmm9
    zmm9 = _mm512_mul_pd(zmm7, zmm3);
    // vfnmsub213pd {rn-sae}, %zmm12, %zmm8, %zmm9
    zmm9 = _mm512_fnmsub_pd(zmm9, zmm8, zmm12);
    // vsubpd    {rn-sae}, %zmm9, %zmm3, %zmm0
    zmm0 = _mm512_sub_pd(zmm3, zmm9);
    // vsubpd    {rn-sae}, %zmm0, %zmm3, %zmm3
    zmm3 = _mm512_sub_pd(zmm3, zmm0);
    // vsubpd    {rn-sae}, %zmm9, %zmm3, %zmm14
    zmm14 = _mm512_sub_pd(zmm3, zmm9);
    /*
     * Compute Numerator:
     * dNumerator + dNlow ~= dTh+dTl+dP+dPlow
     */
    // vaddpd    {rn-sae}, %zmm1, %zmm0, %zmm3
    zmm3 = _mm512_add_pd(zmm0, zmm1);
    // vsubpd    {rn-sae}, %zmm1, %zmm3, %zmm10
    __m512d zmm10 = _mm512_sub_pd(zmm3, zmm1);
    // vsubpd    {rn-sae}, %zmm10, %zmm0, %zmm12
    zmm12 = _mm512_sub_pd(zmm0, zmm10);
    /*
     * Computer Denominator:
     * dDenominator - dDlow ~= 1-(dTh+dTl)*(dP+dPlow)
     */
    // vmovups   960+__svml_dtan_ha_data_internal(%rip), %zmm10
    zmm10 = _mm512_set1_pd(1.0);
    // vaddpd    {rn-sae}, %zmm2, %zmm12, %zmm13
    zmm13 = _mm512_add_pd(zmm12, zmm2);
    // vfnmadd231pd {rn-sae}, %zmm1, %zmm0, %zmm4
    zmm4 = _mm512_fnmadd_pd(zmm0, zmm1, zmm10);
    // vaddpd    {rn-sae}, %zmm14, %zmm13, %zmm5
    zmm5 = _mm512_add_pd(zmm13, zmm14);
    // vsubpd    {rn-sae}, %zmm10, %zmm4, %zmm15
    zmm15 = _mm512_sub_pd(zmm4, zmm10);
    // vfmadd231pd {rn-sae}, %zmm1, %zmm0, %zmm15
    zmm15 = _mm512_fmadd_pd(zmm0, zmm1, zmm15);
    // vfmadd213pd {rn-sae}, %zmm15, %zmm14, %zmm1
    zmm1 = _mm512_fmadd_pd(zmm1, zmm14, zmm15);
    // vfmadd213pd {rn-sae}, %zmm1, %zmm0, %zmm2
    zmm2 = _mm512_fmadd_pd(zmm2, zmm0, zmm1);
    // /*
    //  * Now computes (dNumerator + dNlow)/(dDenominator - dDlow)
    //  * Choose NR iteration instead of hardware division
    //  */
    // vrcp14pd  %zmm4, %zmm1
    zmm1 = _mm512_rcp14_pd(zmm4);
    // /* One NR iteration to refine dRcp */
    // vfnmadd231pd {rn-sae}, %zmm1, %zmm4, %zmm10
    zmm10 = _mm512_fnmadd_pd(zmm4, zmm1, zmm10);
    // vfmadd231pd {rn-sae}, %zmm1, %zmm2, %zmm10
    zmm10 = _mm512_fnmadd_pd(zmm2, zmm1, zmm10);
    // vfmadd213pd {rn-sae}, %zmm1, %zmm10, %zmm1
    zmm1 = _mm512_fmadd_pd(zmm1, zmm10, zmm1);
    // vmulpd    {rn-sae}, %zmm3, %zmm1, %zmm6
    zmm6 = _mm512_mul_pd(zmm1, zmm3);
    // /* One NR iteration to refine dQuotient */
    // vfmsub213pd {rn-sae}, %zmm3, %zmm6, %zmm4
    zmm4 = _mm512_fmsub_pd(zmm4, zmm6, zmm3);
    // vfnmadd213pd {rn-sae}, %zmm4, %zmm6, %zmm2
    zmm2 = _mm512_fnmadd_pd(zmm2, zmm6, zmm4);
    // vsubpd    {rn-sae}, %zmm5, %zmm2, %zmm0
    zmm0 = _mm512_sub_pd(zmm2, zmm5);
    // vfnmadd213pd {rn-sae}, %zmm6, %zmm1, %zmm0
    zmm0 = _mm512_fnmadd_pd(zmm0, zmm1, zmm6);
    return zmm0;
}

