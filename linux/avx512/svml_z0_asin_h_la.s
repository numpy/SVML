/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *      SelMask = (|x| >= 0.5) ? 1 : 0;
 *      R = SelMask ? sqrt(0.5 - 0.5*|x|) : |x|
 *      asin(x) = (SelMask ? (Pi/2 - 2*Poly(R)) : Poly(R))*(-1)^sign(x)
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_asins32

__svml_asins32:

        .cfi_startproc

        vmovdqu16 64+__svml_hasin_data_internal(%rip), %zmm1

/* High = SelMask? Pi2 : 0 */
        vmovdqu16 192+__svml_hasin_data_internal(%rip), %zmm3

/* polynomial */
        vmovdqu16 256+__svml_hasin_data_internal(%rip), %zmm12
        vmovdqu16 320+__svml_hasin_data_internal(%rip), %zmm5
        vmovdqu16 384+__svml_hasin_data_internal(%rip), %zmm7

/* set xa = -2*y if SelMask=1 */
        vmovdqu16 448+__svml_hasin_data_internal(%rip), %zmm9

/* x^2 */
        vmulph    {rn-sae}, %zmm0, %zmm0, %zmm2

/* y = 0.5 -0.5*|x| */
        vmovaps   %zmm1, %zmm8

/*
 * No callout
 * xa = |x|
 */
        vpandd    __svml_hasin_data_internal(%rip), %zmm0, %zmm10
        vfnmadd231ph {rn-sae}, %zmm10, %zmm1, %zmm8

/* SelMask=1 for |x|>=0.5 */
        vcmpph    $21, {sae}, %zmm1, %zmm10, %k2

/* set y = y*rsqrt(y) ~ sqrt(y) */
        vrsqrtph  %zmm8, %zmm4

/* SqrtMask=0 if y==+/-0 */
        vcmpph    $4, {sae}, %zmm3, %zmm8, %k1

/* set x2=y for |x|>=0.5 */
        vminph    {sae}, %zmm8, %zmm2, %zmm6
        vpblendmw 128+__svml_hasin_data_internal(%rip), %zmm3, %zmm11{%k2}
        vmulph    {rn-sae}, %zmm4, %zmm8, %zmm8{%k1}

/* polynomial */
        vfmadd213ph {rn-sae}, %zmm5, %zmm6, %zmm12
        vfmadd213ph {rn-sae}, %zmm7, %zmm6, %zmm12

/* sign(x) */
        vpxord    %zmm0, %zmm10, %zmm13
        vmulph    {rn-sae}, %zmm9, %zmm8, %zmm10{%k2}

/* result */
        vfmadd213ph {rn-sae}, %zmm11, %zmm10, %zmm12
        vpxord    %zmm13, %zmm12, %zmm0
        ret

        .cfi_endproc

        .type	__svml_asins32,@function
        .size	__svml_asins32,.-__svml_asins32

        .section .rodata, "a"
        .align 64

__svml_hasin_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0x3800
	.endr
	.rept	32
        .word	0x3e48
	.endr
	.rept	32
        .word	0x0000
	.endr
	.rept	32
        .word	0x2e26
	.endr
	.rept	32
        .word	0x3144
	.endr
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0xc000
	.endr
        .type	__svml_hasin_data_internal,@object
        .size	__svml_hasin_data_internal,512
