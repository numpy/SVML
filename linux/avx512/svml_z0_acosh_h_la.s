/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *   Compute acosh(x) as log(x + sqrt(x*x - 1))
 *
 *   Special cases:
 *
 *   acosh(NaN)  = quiet NaN, and raise invalid exception
 *   acosh(-INF) = NaN
 *   acosh(+INF) = +INF
 *   acosh(x)    = NaN if x < 1
 *   acosh(1)    = +0
 *
 */

        .text

        .align    16,0x90
        .globl __svml_acoshs32

__svml_acoshs32:

        .cfi_startproc

/*
 * No callout
 * x in [1,2): acosh(x) ~ poly(x-1)*sqrt(x-1)
 * hY = x-1
 */
        vmovdqu16 __svml_hacosh_data_internal(%rip), %zmm13

/* c0+c1*Y+c2*Y^2 */
        vmovdqu16 128+__svml_hacosh_data_internal(%rip), %zmm8
        vmovdqu16 192+__svml_hacosh_data_internal(%rip), %zmm4
        vmovdqu16 256+__svml_hacosh_data_internal(%rip), %zmm6

/* log(1+sqrt(1-z*z)) ~ cs0+cs1*z+cs2*z^2 */
        vmovdqu16 384+__svml_hacosh_data_internal(%rip), %zmm10
        vmovdqu16 448+__svml_hacosh_data_internal(%rip), %zmm12

/* SelMask=1 for |x|>=2.0 */
        vmovdqu16 64+__svml_hacosh_data_internal(%rip), %zmm1
        vmovaps   %zmm0, %zmm3
        vsubph    {rn-sae}, %zmm13, %zmm3, %zmm5

/*
 * log(x)
 * GetMant(x), normalized to [.75,1.5) for x>=0, NaN for x<0
 */
        vgetmantph $11, {sae}, %zmm3, %zmm14
        vgetexpph {sae}, %zmm3, %zmm15

/*
 * x>=2: acosh(x) = log(x) + log(1+sqrt(1-(1/x)^2))
 * Z ~ 1/x in (0, 0.5]
 */
        vrcpph    %zmm3, %zmm11

/* hRS ~ 1/sqrt(x-1) */
        vrsqrtph  %zmm5, %zmm7
        vcmpph    $21, {sae}, %zmm1, %zmm3, %k1
        vmovdqu16 320+__svml_hacosh_data_internal(%rip), %zmm0
        vfmadd213ph {rn-sae}, %zmm4, %zmm5, %zmm8

/* hS ~ sqrt(x-1) */
        vrcpph    %zmm7, %zmm9

/* log(1+R)/R */
        vmovdqu16 512+__svml_hacosh_data_internal(%rip), %zmm7
        vmovdqu16 640+__svml_hacosh_data_internal(%rip), %zmm4
        vfmadd213ph {rn-sae}, %zmm6, %zmm5, %zmm8

/* mantissa - 1 */
        vsubph    {rn-sae}, %zmm13, %zmm14, %zmm6
        vfmadd213ph {rn-sae}, %zmm10, %zmm11, %zmm0

/* exponent correction */
        vgetexpph {sae}, %zmm14, %zmm14
        vmovdqu16 704+__svml_hacosh_data_internal(%rip), %zmm5

/* poly(x-1)*sqrt(x-1) */
        vmulph    {rn-sae}, %zmm9, %zmm8, %zmm2
        vfmadd213ph {rn-sae}, %zmm12, %zmm11, %zmm0
        vsubph    {rn-sae}, %zmm14, %zmm15, %zmm8
        vmovdqu16 576+__svml_hacosh_data_internal(%rip), %zmm15
        vfmadd213ph {rn-sae}, %zmm15, %zmm6, %zmm7
        vfmadd213ph {rn-sae}, %zmm4, %zmm6, %zmm7
        vfmadd213ph {rn-sae}, %zmm5, %zmm6, %zmm7

/* log(1+R) + log(1+sqrt(1-z*z)) */
        vfmadd213ph {rn-sae}, %zmm0, %zmm6, %zmm7

/* result for x>=2 */
        vmovdqu16 768+__svml_hacosh_data_internal(%rip), %zmm0
        vfmadd213ph {rn-sae}, %zmm7, %zmm0, %zmm8

/* result = SelMask?  hPl : hPa */
        vpblendmw %zmm8, %zmm2, %zmm0{%k1}
        ret

        .cfi_endproc

        .type	__svml_acoshs32,@function
        .size	__svml_acoshs32,.-__svml_acoshs32

        .section .rodata, "a"
        .align 64

__svml_hacosh_data_internal:
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x4000
	.endr
	.rept	32
        .word	0x24a4
	.endr
	.rept	32
        .word	0xaf5e
	.endr
	.rept	32
        .word	0x3da8
	.endr
	.rept	32
        .word	0xb4d2
	.endr
	.rept	32
        .word	0x231d
	.endr
	.rept	32
        .word	0x398b
	.endr
	.rept	32
        .word	0xb22b
	.endr
	.rept	32
        .word	0x358b
	.endr
	.rept	32
        .word	0xb807
	.endr
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x398c
	.endr
        .type	__svml_hacosh_data_internal,@object
        .size	__svml_hacosh_data_internal,832
