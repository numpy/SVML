/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *  Computing 2^(-5)*(RShifter0 + x*(1/pi));
 *  The scaling needed to get around limited exponent range for long Pi representation.
 *  fN0 = (int)(sX/pi)*(2^(-5))
 *  Argument reduction:  x + N*(nPi1+nPi2), where nPi1+nPi2 ~ -pi
 *  The sign bit, will treat hY as integer value to look at last bit
 *  Then compute polynomial: hR + hR3*fPoly
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_sins32

__svml_sins32:

        .cfi_startproc

/*
 * We actually compute 2^(-5)*(RShifter0 + x*(1/pi));
 * scaling needed to get around limited exponent range for long Pi representation
 */
        vmovdqu16 192+__svml_hsin_data_internal(%rip), %zmm5
        vmovdqu16 128+__svml_hsin_data_internal(%rip), %zmm1

/* Argument reduction:  x + N*(nPi1+nPi2), where nPi1+nPi2 ~ -pi */
        vmovdqu16 256+__svml_hsin_data_internal(%rip), %zmm4
        vmovdqu16 320+__svml_hsin_data_internal(%rip), %zmm2

/* (hR2*c3 + c2) */
        vmovdqu16 384+__svml_hsin_data_internal(%rip), %zmm7
        vmovdqu16 448+__svml_hsin_data_internal(%rip), %zmm9

/*
 * Variables:
 * H
 * S
 * HM
 * No callout
 * Copy argument
 * Needed to set sin(-0)=-0
 */
        vpandd    __svml_hsin_data_internal(%rip), %zmm0, %zmm13
        vfmadd213ph {rn-sae}, %zmm1, %zmm13, %zmm5

/* |sX| > threshold? */
        vpcmpgtw  64+__svml_hsin_data_internal(%rip), %zmm13, %k1

/* fN0 = (int)(sX/pi)*(2^(-5)) */
        vsubph    {rn-sae}, %zmm1, %zmm5, %zmm10

/*
 * sign bit, will treat hY as integer value to look at last bit
 * shift to FP16 sign position
 */
        vpsllw    $15, %zmm5, %zmm6
        vfmadd213ph {rn-sae}, %zmm13, %zmm10, %zmm4
        vfmadd213ph {rn-sae}, %zmm4, %zmm2, %zmm10

/* hR*hR */
        vmulph    {rn-sae}, %zmm10, %zmm10, %zmm8
        vfmadd231ph {rn-sae}, %zmm8, %zmm7, %zmm9
        vmulph    {rn-sae}, %zmm10, %zmm8, %zmm11

/* hR + hR3*fPoly */
        vfmadd213ph {rn-sae}, %zmm10, %zmm9, %zmm11

/* short path */
        kortestd  %k1, %k1
        vpxord    %zmm13, %zmm0, %zmm3

/* add in input sign */
        vpxord    %zmm3, %zmm6, %zmm12

/* add sign bit to result (logical XOR between fPoly and isgn bits) */
        vpxord    %zmm12, %zmm11, %zmm0

/* Go to exit */
        jne       .LBL_EXIT
                                # LOE rbx rbp r12 r13 r14 r15 zmm0 zmm3 zmm13 k1

        ret

/* Restore registers
 * and exit the function
 */

.LBL_EXIT:
        vmovups   512+__svml_hsin_data_internal(%rip), %zmm6

/* RShifter + x*(1/pi) will round to RShifter+N, where N=(int)(x/pi) */
        vmovups   576+__svml_hsin_data_internal(%rip), %zmm5

/* Argument reduction:  sX + N*(sNPi1+sNPi2), where sNPi1+sNPi2 ~ -pi */
        vmovups   640+__svml_hsin_data_internal(%rip), %zmm7
        vmovups   704+__svml_hsin_data_internal(%rip), %zmm9
        vmovups   832+__svml_hsin_data_internal(%rip), %zmm12
        vmovaps   %zmm6, %zmm11

/* convert to FP32 */
        vextractf32x8 $1, %zmm13, %ymm4
        vcvtph2psx %ymm13, %zmm8
        vcvtph2psx %ymm4, %zmm10
        vfmadd231ps {rn-sae}, %zmm8, %zmm5, %zmm11
        vfmadd213ps {rn-sae}, %zmm6, %zmm10, %zmm5

/* c2*sR2 + c1 */
        vmovups   768+__svml_hsin_data_internal(%rip), %zmm4

/* sN = (int)(x/pi) = sY - Rshifter */
        vsubps    {rn-sae}, %zmm6, %zmm11, %zmm2
        vsubps    {rn-sae}, %zmm6, %zmm5, %zmm1

/* sign bit, will treat sY as integer value to look at last bit */
        vpslld    $31, %zmm11, %zmm6
        vfmadd231ps {rn-sae}, %zmm2, %zmm7, %zmm8
        vfmadd231ps {rn-sae}, %zmm1, %zmm7, %zmm10
        vpslld    $31, %zmm5, %zmm7
        vfmadd213ps {rn-sae}, %zmm8, %zmm9, %zmm2
        vfmadd213ps {rn-sae}, %zmm10, %zmm9, %zmm1

/* sR*sR */
        vmulps    {rn-sae}, %zmm2, %zmm2, %zmm14
        vmulps    {rn-sae}, %zmm1, %zmm1, %zmm15
        vmovaps   %zmm4, %zmm5
        vfmadd231ps {rn-sae}, %zmm14, %zmm12, %zmm5
        vfmadd231ps {rn-sae}, %zmm15, %zmm12, %zmm4

/* sR2*sR */
        vmulps    {rn-sae}, %zmm2, %zmm14, %zmm12
        vmulps    {rn-sae}, %zmm1, %zmm15, %zmm14

/* sR + sR3*sPoly */
        vfmadd213ps {rn-sae}, %zmm2, %zmm5, %zmm12
        vfmadd213ps {rn-sae}, %zmm1, %zmm4, %zmm14

/* add sign bit to result (logical XOR between sPoly and i32_sgn bits) */
        vxorps    %zmm6, %zmm12, %zmm1
        vxorps    %zmm7, %zmm14, %zmm8
        vcvtps2phx %zmm1, %ymm2
        vcvtps2phx %zmm8, %ymm9
        vinsertf32x8 $1, %ymm9, %zmm2, %zmm10

/* needed to set sin(-0)=-0 */
        vpxord    %zmm3, %zmm10, %zmm3

/*
 * ensure results are always exactly the same for common arguments
 * (return fast path result for common args)
 */
        vpblendmw %zmm3, %zmm0, %zmm0{%k1}
        ret
                                # LOE rbx rbp r12 r13 r14 r15 zmm0
        .cfi_endproc

        .type	__svml_sins32,@function
        .size	__svml_sins32,.-__svml_sins32

        .section .rodata, "a"
        .align 64

__svml_hsin_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0x52ac
	.endr
	.rept	32
        .word	0x5200
	.endr
	.rept	32
        .word	0x2118
	.endr
	.rept	32
        .word	0xd648
	.endr
	.rept	32
        .word	0xa7ed
	.endr
	.rept	32
        .word	0x2007
	.endr
	.rept	32
        .word	0xb155
	.endr
	.rept	16
        .long	0x4b400000
	.endr
	.rept	16
        .long	0x3ea2f983
	.endr
	.rept	16
        .long	0xc0490fdb
	.endr
	.rept	16
        .long	0x33bbbd2e
	.endr
	.rept	16
        .long	0xbe2a026e
	.endr
	.rept	16
        .long	0x3bf9f9b6
	.endr
        .type	__svml_hsin_data_internal,@object
        .size	__svml_hsin_data_internal,896
