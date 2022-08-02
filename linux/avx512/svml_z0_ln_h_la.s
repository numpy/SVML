/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *    log(x) = VGETEXP(x)*log(2) + log(VGETMANT(x))
 *    VGETEXP, VGETMANT will correctly treat special cases too (including denormals)
 *    mx = VGETMANT(x) is in [1,2) for all x>=0
 *    log(mx) = -log(RCP(mx)) + log(1 +(mx*RCP(mx)-1))
 *    and the table lookup for log(RCP(mx))
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_logs32

__svml_logs32:

        .cfi_startproc

/*
 * Variables:
 * H
 * No callout
 * Copy argument
 * GetMant(x), normalized to [.75,1.5) for x>=0, NaN for x<0
 */
        vgetmantph $11, {sae}, %zmm0, %zmm2

/* Get exponent */
        vgetexpph {sae}, %zmm0, %zmm4

/* exponent corrrection */
        vgetexpph {sae}, %zmm2, %zmm5

/* reduced argument */
        vmovdqu16 __svml_hlog_data_internal(%rip), %zmm1

/* expon*log(2) */
        vmovdqu16 64+__svml_hlog_data_internal(%rip), %zmm8

/* table index */
        vpsrlw    $5, %zmm2, %zmm3

/* exponent corrrection */
        vsubph    {rn-sae}, %zmm5, %zmm4, %zmm7
        vsubph    {rn-sae}, %zmm1, %zmm2, %zmm0

/* polynomial coefficients */
        vpermw    128+__svml_hlog_data_internal(%rip), %zmm3, %zmm9
        vpermw    192+__svml_hlog_data_internal(%rip), %zmm3, %zmm6
        vmulph    {rn-sae}, %zmm8, %zmm7, %zmm10

/* hC0+hC1*R */
        vfmadd213ph {rn-sae}, %zmm6, %zmm0, %zmm9

/* result res = R*P + Expon */
        vfmadd213ph {rn-sae}, %zmm10, %zmm9, %zmm0
        ret

        .cfi_endproc

        .type	__svml_logs32,@function
        .size	__svml_logs32,.-__svml_logs32

        .section .rodata, "a"
        .align 64

__svml_hlog_data_internal:
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0x398c
	.endr
        .word	0xb7d6
        .word	0xb787
        .word	0xb73c
        .word	0xb6f6
        .word	0xb6b5
        .word	0xb677
        .word	0xb63e
        .word	0xb607
        .word	0xb5d3
        .word	0xb5a3
        .word	0xb575
        .word	0xb549
        .word	0xb520
        .word	0xb4f8
        .word	0xb4d3
        .word	0xb4af
        .word	0xb9c4
        .word	0xb99d
        .word	0xb978
        .word	0xb955
        .word	0xb933
        .word	0xb912
        .word	0xb8f3
        .word	0xb8d5
        .word	0xb8b8
        .word	0xb89c
        .word	0xb882
        .word	0xb868
        .word	0xb850
        .word	0xb838
        .word	0xb821
        .word	0xb80b
        .word	0x3c00
        .word	0x3bff
        .word	0x3bfc
        .word	0x3bf9
        .word	0x3bf5
        .word	0x3bf0
        .word	0x3beb
        .word	0x3be5
        .word	0x3bde
        .word	0x3bd8
        .word	0x3bd0
        .word	0x3bc9
        .word	0x3bc1
        .word	0x3bb9
        .word	0x3bb1
        .word	0x3ba9
        .word	0x3bc4
        .word	0x3bcd
        .word	0x3bd5
        .word	0x3bdc
        .word	0x3be2
        .word	0x3be8
        .word	0x3bed
        .word	0x3bf1
        .word	0x3bf5
        .word	0x3bf8
        .word	0x3bfa
        .word	0x3bfc
        .word	0x3bfe
        .word	0x3bff
	.rept	2
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
        .long	0x3f317218
	.endr
	.rept	32
        .word	0xfc00
	.endr
        .type	__svml_hlog_data_internal,@object
        .size	__svml_hlog_data_internal,1024
