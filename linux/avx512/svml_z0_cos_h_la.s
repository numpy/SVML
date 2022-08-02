/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *  1) Range reduction to [-Pi/2; +Pi/2] interval
 *     a) We remove sign using AND operation
 *     b) Add Pi/2 value to argument X for Cos to Sin transformation
 *     c) Getting octant Y by 1/Pi multiplication
 *     d) Add "Right Shifter" value
 *     e) Treat obtained value as integer for destination sign setting.
 *        Shift first bit of this value to the last (sign) position
 *     f) Subtract "Right Shifter"  value
 *     g) Subtract 0.5 from result for octant correction
 *     h) Subtract Y*PI from X argument, where PI divided to 4 parts:
 *        X = X - Y*PI1 - Y*PI2 - Y*PI3 - Y*PI4;
 *  2) Polynomial (minimax for sin within [-Pi/2; +Pi/2] interval)
 *     a) Calculate X^2 = X * X
 *     b) Calculate polynomial:
 *        R = X + X * X^2 * (A3 + x^2 * (A5 +
 *  3) Destination sign setting
 *     a) Set shifted destination sign using XOR operation:
 *        R = XOR( R, S );
 *
 */

        .text

        .align    16,0x90
        .globl __svml_coss32

__svml_coss32:

        .cfi_startproc

/* cos(a) = sin(|a|+pi/2) */
        vmovdqu16 128+__svml_hcos_data_internal(%rip), %zmm2
        vmovdqu16 192+__svml_hcos_data_internal(%rip), %zmm4
        vmovdqu16 256+__svml_hcos_data_internal(%rip), %zmm3
        vmovdqu16 320+__svml_hcos_data_internal(%rip), %zmm6

/* Argument reduction:  sX + N*(sNPi1+sNPi2), where sNPi1+sNPi2 ~ -pi */
        vmovdqu16 384+__svml_hcos_data_internal(%rip), %zmm8
        vmovdqu16 448+__svml_hcos_data_internal(%rip), %zmm7

/* (hR2*c4 + c3)*hR2 + c2 */
        vmovdqu16 576+__svml_hcos_data_internal(%rip), %zmm12
        vmovdqu16 640+__svml_hcos_data_internal(%rip), %zmm15
        vmovdqu16 704+__svml_hcos_data_internal(%rip), %zmm13

/*
 * Variables:
 * H
 * S
 * HM
 * No callout
 * Copy argument
 */
        vpandd    __svml_hcos_data_internal(%rip), %zmm0, %zmm1
        vaddph    {rn-sae}, %zmm2, %zmm1, %zmm9

/* |sX| > threshold? */
        vpcmpgtw  64+__svml_hcos_data_internal(%rip), %zmm1, %k1
        vfmadd213ph {rn-sae}, %zmm4, %zmm3, %zmm9

/* fN0 = (int)(sX/pi)*(2^(-5)) */
        vsubph    {rn-sae}, %zmm4, %zmm9, %zmm5

/*
 * sign bit, will treat hY as integer value to look at last bit
 * shift to FP16 sign position
 */
        vpsllw    $15, %zmm9, %zmm11

/* hN = ((int)(sX/pi)-0.5)*(2^(-5)) */
        vsubph    {rn-sae}, %zmm6, %zmm5, %zmm10
        vfmadd213ph {rn-sae}, %zmm1, %zmm10, %zmm8
        vfmadd213ph {rn-sae}, %zmm8, %zmm7, %zmm10

/* hR*hR */
        vmulph    {rn-sae}, %zmm10, %zmm10, %zmm14
        vfmadd231ph {rn-sae}, %zmm14, %zmm12, %zmm15
        vfmadd213ph {rn-sae}, %zmm13, %zmm14, %zmm15

/* short path */
        kortestd  %k1, %k1

/* set sign of R */
        vpxord    %zmm11, %zmm10, %zmm2

/* hR2*hR */
        vmulph    {rn-sae}, %zmm2, %zmm14, %zmm0

/* hR + hR3*fPoly */
        vfmadd213ph {rn-sae}, %zmm2, %zmm15, %zmm0

/* Go to exit */
        jne       .LBL_EXIT
                                # LOE rbx rbp r12 r13 r14 r15 zmm0 zmm1 k1

        ret

/* Restore registers
 * and exit the function
 */

.LBL_EXIT:
        vmovups   768+__svml_hcos_data_internal(%rip), %zmm4

/* sRShifter + sX*(1/pi) will round to sRShifter+N, where N=(int)(sX/pi) */
        vmovups   896+__svml_hcos_data_internal(%rip), %zmm5

/* sN + 0.5 = (int)(sX/pi) = sY - (Rshifter-0.5) */
        vmovups   832+__svml_hcos_data_internal(%rip), %zmm6

/* Argument reduction:  sX + N*(sNPi1+sNPi2), where sNPi1+sNPi2 ~ -pi */
        vmovups   960+__svml_hcos_data_internal(%rip), %zmm7
        vmovups   1024+__svml_hcos_data_internal(%rip), %zmm9
        vmovups   1152+__svml_hcos_data_internal(%rip), %zmm12
        vmovaps   %zmm4, %zmm11

/* convert to FP32 */
        vextractf32x8 $1, %zmm1, %ymm3
        vcvtph2psx %ymm1, %zmm8
        vcvtph2psx %ymm3, %zmm10
        vfmadd231ps {rz-sae}, %zmm8, %zmm5, %zmm11
        vfmadd231ps {rz-sae}, %zmm10, %zmm5, %zmm4
        vsubps    {rn-sae}, %zmm6, %zmm11, %zmm2
        vsubps    {rn-sae}, %zmm6, %zmm4, %zmm1

/* sign bit, will treat sY as integer value to look at last bit */
        vpslld    $31, %zmm4, %zmm5
        vpslld    $31, %zmm11, %zmm3
        vfmsub231ps {rn-sae}, %zmm2, %zmm7, %zmm8
        vfmsub231ps {rn-sae}, %zmm1, %zmm7, %zmm10

/* c2*sR2 + c1 */
        vmovups   1088+__svml_hcos_data_internal(%rip), %zmm4
        vfmadd213ps {rn-sae}, %zmm8, %zmm9, %zmm2
        vfmadd213ps {rn-sae}, %zmm10, %zmm9, %zmm1

/* sR*sR */
        vmulps    {rn-sae}, %zmm2, %zmm2, %zmm13
        vmulps    {rn-sae}, %zmm1, %zmm1, %zmm14
        vmovaps   %zmm4, %zmm15
        vfmadd231ps {rn-sae}, %zmm13, %zmm12, %zmm15
        vfmadd231ps {rn-sae}, %zmm14, %zmm12, %zmm4

/* sR2*sR */
        vmulps    {rn-sae}, %zmm2, %zmm13, %zmm12
        vmulps    {rn-sae}, %zmm1, %zmm14, %zmm13

/* sR + sR3*sPoly */
        vfmadd213ps {rn-sae}, %zmm2, %zmm15, %zmm12
        vfmadd213ps {rn-sae}, %zmm1, %zmm4, %zmm13

/* add sign bit to result (logical XOR between sPoly and i32_sgn bits) */
        vxorps    %zmm3, %zmm12, %zmm1
        vxorps    %zmm5, %zmm13, %zmm6
        vcvtps2phx %zmm1, %ymm2
        vcvtps2phx %zmm6, %ymm7
        vinsertf32x8 $1, %ymm7, %zmm2, %zmm8

/*
 * ensure results are always exactly the same for common arguments
 * (return fast path result for common args)
 */
        vpblendmw %zmm8, %zmm0, %zmm0{%k1}
        ret
                                # LOE rbx rbp r12 r13 r14 r15 zmm0
        .cfi_endproc

        .type	__svml_coss32,@function
        .size	__svml_coss32,.-__svml_coss32

        .section .rodata, "a"
        .align 64

__svml_hcos_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0x4bd9
	.endr
	.rept	32
        .word	0x3e48
	.endr
	.rept	32
        .word	0x5200
	.endr
	.rept	32
        .word	0x2118
	.endr
	.rept	32
        .word	0x2400
	.endr
	.rept	32
        .word	0xd648
	.endr
	.rept	32
        .word	0xa7ed
	.endr
	.rept	32
        .word	0x0001
	.endr
	.rept	32
        .word	0x8a2d
	.endr
	.rept	32
        .word	0x2042
	.endr
	.rept	32
        .word	0xb155
	.endr
	.rept	16
        .long	0x4b000000
	.endr
	.rept	16
        .long	0x4affffff
	.endr
	.rept	16
        .long	0x3ea2f983
	.endr
	.rept	16
        .long	0x40490fdb
	.endr
	.rept	16
        .long	0xb3bbbd2e
	.endr
	.rept	16
        .long	0xbe2a026e
	.endr
	.rept	16
        .long	0x3bf9f9b6
	.endr
	.rept	16
        .long	0x3f000000
	.endr
	.rept	16
        .long	0x3fc90fdb
	.endr
        .type	__svml_hcos_data_internal,@object
        .size	__svml_hcos_data_internal,1344
