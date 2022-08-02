/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *   Compute cosh(x) as (exp(x)+exp(-x))/2,
 *   where exp is calculated as
 *   exp(M*ln2 + ln2*(j/2^k) + r) = 2^M * 2^(j/2^k) * exp(r)
 *
 *   Special cases:
 *
 *   cosh(NaN) = quiet NaN, and raise invalid exception
 *   cosh(INF) = that INF
 *   cosh(0)   = 1
 *   cosh(x) overflows for big x and returns MAXLOG+log(2)
 *
 */

        .text

        .align    16,0x90
        .globl __svml_coshs32

__svml_coshs32:

        .cfi_startproc

/* Shifter + x*log2(e) */
        vmovdqu16 64+__svml_hcosh_data_internal(%rip), %zmm1
        vmovdqu16 128+__svml_hcosh_data_internal(%rip), %zmm2

/* Argument reduction:  x - N*log(2) */
        vmovdqu16 192+__svml_hcosh_data_internal(%rip), %zmm3
        vmovdqu16 256+__svml_hcosh_data_internal(%rip), %zmm4
        vmovdqu16 320+__svml_hcosh_data_internal(%rip), %zmm5
        vmovdqu16 384+__svml_hcosh_data_internal(%rip), %zmm10
        vmovdqu16 448+__svml_hcosh_data_internal(%rip), %zmm6
        vmovdqu16 512+__svml_hcosh_data_internal(%rip), %zmm9

/* poly + 0.25*mpoly ~ (exp(x)+exp(-x))*0.5 */
        vmovdqu16 576+__svml_hcosh_data_internal(%rip), %zmm12
        vpandd    __svml_hcosh_data_internal(%rip), %zmm0, %zmm7
        vfmadd213ph {rz-sae}, %zmm2, %zmm7, %zmm1
        vsubph    {rn-sae}, %zmm2, %zmm1, %zmm8
        vfnmadd231ph {rn-sae}, %zmm8, %zmm3, %zmm7

/* hN - 1 */
        vsubph    {rn-sae}, %zmm9, %zmm8, %zmm11
        vfnmadd231ph {rn-sae}, %zmm8, %zmm4, %zmm7

/* exp(R) */
        vfmadd231ph {rn-sae}, %zmm7, %zmm5, %zmm10
        vfmadd213ph {rn-sae}, %zmm6, %zmm7, %zmm10
        vfmadd213ph {rn-sae}, %zmm9, %zmm7, %zmm10

/* poly*R+1 */
        vfmadd213ph {rn-sae}, %zmm9, %zmm7, %zmm10
        vscalefph {rn-sae}, %zmm11, %zmm10, %zmm13
        vrcpph    %zmm13, %zmm0
        vfmadd213ph {rn-sae}, %zmm13, %zmm12, %zmm0
        ret

        .cfi_endproc

        .type	__svml_coshs32,@function
        .size	__svml_coshs32,.-__svml_coshs32

        .section .rodata, "a"
        .align 64

__svml_hcosh_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0x3dc5
	.endr
	.rept	32
        .word	0x6600
	.endr
	.rept	32
        .word	0x398c
	.endr
	.rept	32
        .word	0x8af4
	.endr
	.rept	32
        .word	0x2b17
	.endr
	.rept	32
        .word	0x3122
	.endr
	.rept	32
        .word	0x3802
	.endr
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x3400
	.endr
        .type	__svml_hcosh_data_internal,@object
        .size	__svml_hcosh_data_internal,640
