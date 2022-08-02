/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *    log2(x) = VGETEXP(x) + log2(VGETMANT(x))
 *    VGETEXP, VGETMANT will correctly treat special cases too (including denormals)
 *    mx = VGETMANT(x) is in [1,2) for all x>=0
 *    log2(mx) = -log2(RCP(mx)) + log2(1 +(mx*RCP(mx)-1))
 *    and the table lookup for log2(RCP(mx))
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_log2s32

__svml_log2s32:

        .cfi_startproc

/* No callout */
        vmovdqu16 __svml_hlog2_data_internal(%rip), %zmm1
        vmovdqu16 128+__svml_hlog2_data_internal(%rip), %zmm3
        vmovdqu16 192+__svml_hlog2_data_internal(%rip), %zmm6
        vmovdqu16 256+__svml_hlog2_data_internal(%rip), %zmm7
        vmovdqu16 320+__svml_hlog2_data_internal(%rip), %zmm8

/* exponent */
        vgetexpph {sae}, %zmm0, %zmm4

/* reduce mantissa to [.75, 1.5) */
        vgetmantph $11, {sae}, %zmm0, %zmm2
        vmovdqu16 64+__svml_hlog2_data_internal(%rip), %zmm0

/* reduced argument */
        vsubph    {rn-sae}, %zmm1, %zmm2, %zmm9

/* exponent correction */
        vgetexpph {sae}, %zmm2, %zmm5

/* start polynomial */
        vfmadd213ph {rn-sae}, %zmm3, %zmm9, %zmm0

/* exponent */
        vsubph    {rn-sae}, %zmm5, %zmm4, %zmm10

/* polynomial */
        vfmadd213ph {rn-sae}, %zmm6, %zmm9, %zmm0
        vfmadd213ph {rn-sae}, %zmm7, %zmm9, %zmm0
        vfmadd213ph {rn-sae}, %zmm8, %zmm9, %zmm0

/* Poly*R+expon */
        vfmadd213ph {rn-sae}, %zmm10, %zmm9, %zmm0
        ret

        .cfi_endproc

        .type	__svml_log2s32,@function
        .size	__svml_log2s32,.-__svml_log2s32

        .section .rodata, "a"
        .align 64

__svml_hlog2_data_internal:
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x328a
	.endr
	.rept	32
        .word	0xb5ff
	.endr
	.rept	32
        .word	0x37cf
	.endr
	.rept	32
        .word	0xb9c5
	.endr
	.rept	32
        .word	0x3dc5
	.endr
	.rept	32
        .word	0x001f
	.endr
	.rept	32
        .word	0x0000
	.endr
	.rept	16
        .long	0x00000001
	.endr
	.rept	16
        .long	0x0000007f
	.endr
	.rept	16
        .long	0x3f800000
	.endr
	.rept	16
        .long	0x3e51367b
	.endr
	.rept	16
        .long	0xbebfd356
	.endr
	.rept	16
        .long	0x3ef9e953
	.endr
	.rept	16
        .long	0xbf389f48
	.endr
	.rept	16
        .long	0x3fb8a7e4
	.endr
	.rept	32
        .word	0xfc00
	.endr
        .type	__svml_hlog2_data_internal,@object
        .size	__svml_hlog2_data_internal,1088
