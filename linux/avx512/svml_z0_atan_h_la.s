/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *   Absolute argument and sign: xa = |x|, sign(x)
 *   Selection mask: SelMask=1 for |x|>1.0
 *   Reciprocal:  y=RCP(xa)
 *   xa=y for |x|>1
 *   High = Pi/2 for |x|>1, 0 otherwise
 *   Result: High + xa*Poly
 *
 */

        .text

        .align    16,0x90
        .globl __svml_atans32

__svml_atans32:

        .cfi_startproc

        vmovdqu16 64+__svml_hatan_data_internal(%rip), %zmm5

/* polynomial */
        vmovdqu16 320+__svml_hatan_data_internal(%rip), %zmm9
        vmovdqu16 384+__svml_hatan_data_internal(%rip), %zmm2
        vmovdqu16 448+__svml_hatan_data_internal(%rip), %zmm3
        vmovdqu16 512+__svml_hatan_data_internal(%rip), %zmm4

/* y=RCP(xa) */
        vmovdqu16 192+__svml_hatan_data_internal(%rip), %zmm1

/*
 * No callout
 * xa = |x|
 */
        vpandd    __svml_hatan_data_internal(%rip), %zmm0, %zmm7

/* SelMask=1 for |x|>1.0 */
        vcmpph    $22, {sae}, %zmm5, %zmm7, %k1

/* High = Pi/2 for |x|>1, 0 otherwise */
        vpblendmw 128+__svml_hatan_data_internal(%rip), %zmm1, %zmm8{%k1}

/* sign(x) */
        vpxord    %zmm0, %zmm7, %zmm10

/* xa=y for |x|>1 */
        vrcpph    %zmm7, %zmm7{%k1}

/* polynomial */
        vfmadd213ph {rn-sae}, %zmm2, %zmm7, %zmm9
        vfmadd213ph {rn-sae}, %zmm3, %zmm7, %zmm9
        vfmadd213ph {rn-sae}, %zmm4, %zmm7, %zmm9
        vfmadd213ph {rn-sae}, %zmm5, %zmm7, %zmm9

/* change sign of xa, for |x|>1 */
        vpxord    256+__svml_hatan_data_internal(%rip), %zmm7, %zmm6
        vmovdqu16 %zmm6, %zmm7{%k1}

/* High + xa*Poly */
        vfmadd213ph {rn-sae}, %zmm8, %zmm7, %zmm9

/* set sign */
        vpxord    %zmm10, %zmm9, %zmm0
        ret

        .cfi_endproc

        .type	__svml_atans32,@function
        .size	__svml_atans32,.-__svml_atans32

        .section .rodata, "a"
        .align 64

__svml_hatan_data_internal:
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x3e48
	.endr
	.rept	32
        .word	0x0000
	.endr
	.rept	32
        .word	0x8000
	.endr
	.rept	32
        .word	0xa528
	.endr
	.rept	32
        .word	0x3248
	.endr
	.rept	32
        .word	0xb65d
	.endr
	.rept	32
        .word	0x1f7a
	.endr
        .type	__svml_hatan_data_internal,@object
        .size	__svml_hatan_data_internal,576
