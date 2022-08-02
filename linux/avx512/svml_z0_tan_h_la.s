/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *   Implementation reduces argument as:
 *   sX + N*(sNPi1+sNPi2), where sNPi1+sNPi2 ~ -pi/2
 *   RShifter + x*(2/pi) will round to RShifter+N, where N=(int)(x/pi)
 *   To get sign bit we treat sY as integer value to look at last bit
 *   Compute polynomial ~ tan(R)/R
 *   Result = 1/tan(R) when sN = (int)(x/(Pi/2)) is odd
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_tans32

__svml_tans32:

        .cfi_startproc

        vmovups   64+__svml_htan_data_internal(%rip), %zmm4

/* RShifter + x*(2/pi) will round to RShifter+N, where N=(int)(x/pi) */
        vmovups   128+__svml_htan_data_internal(%rip), %zmm3

/* Argument reduction:  sX + N*(sNPi1+sNPi2), where sNPi1+sNPi2 ~ -pi/2 */
        vmovups   192+__svml_htan_data_internal(%rip), %zmm5
        vmovups   256+__svml_htan_data_internal(%rip), %zmm7
        vmovaps   %zmm4, %zmm9

/*
 * No callout
 * Copy argument
 * Needed to set sin(-0)=-0
 */
        vpandd    __svml_htan_data_internal(%rip), %zmm0, %zmm1
        vpxord    %zmm1, %zmm0, %zmm0

/* convert to FP32 */
        vextractf32x8 $1, %zmm1, %ymm2
        vcvtph2psx %ymm1, %zmm6
        vcvtph2psx %ymm2, %zmm8
        vfmadd231ps {rn-sae}, %zmm6, %zmm3, %zmm9
        vfmadd213ps {rn-sae}, %zmm4, %zmm8, %zmm3

/* sN = (int)(x/pi) = sY - Rshifter */
        vsubps    {rn-sae}, %zmm4, %zmm9, %zmm10
        vsubps    {rn-sae}, %zmm4, %zmm3, %zmm12

/* sign bit, will treat sY as integer value to look at last bit */
        vpslld    $31, %zmm9, %zmm14
        vpslld    $31, %zmm3, %zmm1
        vfmadd231ps {rn-sae}, %zmm10, %zmm5, %zmm6
        vfmadd231ps {rn-sae}, %zmm12, %zmm5, %zmm8

/* polynomial ~ tan(R)/R */
        vmovdqu16 320+__svml_htan_data_internal(%rip), %zmm3
        vmovdqu16 384+__svml_htan_data_internal(%rip), %zmm9
        vmovdqu16 448+__svml_htan_data_internal(%rip), %zmm4
        vfmadd213ps {rn-sae}, %zmm6, %zmm7, %zmm10
        vfmadd213ps {rn-sae}, %zmm8, %zmm7, %zmm12
        vmovdqu16 512+__svml_htan_data_internal(%rip), %zmm6
        vcvtps2phx %zmm10, %ymm11
        vcvtps2phx %zmm12, %ymm13
        vcvtps2phx %zmm14, %ymm15
        vcvtps2phx %zmm1, %ymm14
        vinsertf32x8 $1, %ymm13, %zmm11, %zmm2

/* hR*hR */
        vmulph    {rn-sae}, %zmm2, %zmm2, %zmm5
        vfmadd231ph {rn-sae}, %zmm5, %zmm3, %zmm9
        vfmadd213ph {rn-sae}, %zmm4, %zmm5, %zmm9
        vfmadd213ph {rn-sae}, %zmm6, %zmm5, %zmm9
        vinsertf32x8 $1, %ymm14, %zmm15, %zmm8

/* result = 1/tan(R) when hN = (int)(x/(Pi/2)) is odd */
        vpmovw2m  %zmm8, %k1

/* add sign to hR */
        vpxord    %zmm8, %zmm2, %zmm7
        vfmadd213ph {rn-sae}, %zmm7, %zmm7, %zmm9
        vrcpph    %zmm9, %zmm9{%k1}

/* needed to set sin(-0)=-0 */
        vpxord    %zmm0, %zmm9, %zmm0
        ret

        .cfi_endproc

        .type	__svml_tans32,@function
        .size	__svml_tans32,.-__svml_tans32

        .section .rodata, "a"
        .align 64

__svml_htan_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	16
        .long	0x4b000000
	.endr
	.rept	16
        .long	0x3f22f983
	.endr
	.rept	16
        .long	0xbfc90fdb
	.endr
	.rept	16
        .long	0x333bbd2e
	.endr
	.rept	32
        .word	0x2e06
	.endr
	.rept	32
        .word	0x2f6c
	.endr
	.rept	32
        .word	0x355f
	.endr
	.rept	32
        .word	0x82e5
	.endr
        .type	__svml_htan_data_internal,@object
        .size	__svml_htan_data_internal,576
