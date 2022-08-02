/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *    log10(x) = VGETEXP(x)*log10(2) + log10(VGETMANT(x))
 *    VGETEXP, VGETMANT will correctly treat special cases too (including denormals)
 *    mx = VGETMANT(x) is in [1,2) for all x>=0
 *    log10(mx) = -log10(RCP(mx)) + log10(1 +(mx*RCP(mx)-1))
 *    and the table lookup for log(RCP(mx))
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_log10s32

__svml_log10s32:

        .cfi_startproc

/* reduced argument */
        vmovdqu16 384+__svml_hlog10_data_internal(%rip), %zmm4
        vmovdqu16 64+__svml_hlog10_data_internal(%rip), %zmm9
        vmovdqu16 128+__svml_hlog10_data_internal(%rip), %zmm5
        vmovdqu16 192+__svml_hlog10_data_internal(%rip), %zmm6
        vmovdqu16 256+__svml_hlog10_data_internal(%rip), %zmm7
        vmovdqu16 320+__svml_hlog10_data_internal(%rip), %zmm8
        vmovdqu16 __svml_hlog10_data_internal(%rip), %zmm11

/* Get exponent */
        vgetexpph {sae}, %zmm0, %zmm1

/* GetMant(x), normalized to [.75,1.5) for x>=0, NaN for x<0 */
        vgetmantph $11, {sae}, %zmm0, %zmm3
        vsubph    {rn-sae}, %zmm4, %zmm3, %zmm10

/* exponent corrrection */
        vgetexpph {sae}, %zmm3, %zmm2
        vfmadd213ph {rn-sae}, %zmm5, %zmm10, %zmm9
        vsubph    {rn-sae}, %zmm2, %zmm1, %zmm0
        vfmadd213ph {rn-sae}, %zmm6, %zmm10, %zmm9
        vfmadd213ph {rn-sae}, %zmm7, %zmm10, %zmm9
        vfmadd213ph {rn-sae}, %zmm8, %zmm10, %zmm9
        vmulph    {rn-sae}, %zmm10, %zmm9, %zmm12
        vfmadd213ph {rn-sae}, %zmm12, %zmm11, %zmm0
        ret

        .cfi_endproc

        .type	__svml_log10s32,@function
        .size	__svml_log10s32,.-__svml_log10s32

        .section .rodata, "a"
        .align 64

__svml_hlog10_data_internal:
	.rept	32
        .word	0x34d1
	.endr
	.rept	32
        .word	0x2bad
	.endr
	.rept	32
        .word	0xaf2b
	.endr
	.rept	32
        .word	0x30b4
	.endr
	.rept	32
        .word	0xb2f3
	.endr
	.rept	32
        .word	0x36f3
	.endr
	.rept	32
        .word	0x3c00
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
	.rept	16
        .long	0x3e9a209b
	.endr
	.rept	32
        .word	0xfc00
	.endr
        .type	__svml_hlog10_data_internal,@object
        .size	__svml_hlog10_data_internal,1216
