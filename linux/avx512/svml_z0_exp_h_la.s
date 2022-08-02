/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *   Typical exp() implementation, except that:
 *    - tables are small, allowing for fast gathers
 *    - all arguments processed in the main path
 *        - final VSCALEF assists branch-free design (correct overflow/underflow and special case responses)
 *        - a VAND is used to ensure the reduced argument |R|<2, even for large inputs
 *        - RZ mode used to avoid oveflow to +/-Inf for x*log2(e); helps with special case handling
 *        - SAE used to avoid spurious flag settings
 *
 */

        .text

        .align    16,0x90
        .globl __svml_exps32

__svml_exps32:

        .cfi_startproc

/* Adjust shifter */
        vmovdqu16 64+__svml_hexp_data_internal(%rip), %zmm2

/* Shifter + x*log2(e) */
        vmovdqu16 128+__svml_hexp_data_internal(%rip), %zmm5

/* Argument reduction:  x - N*log(2) */
        vmovdqu16 192+__svml_hexp_data_internal(%rip), %zmm3
        vmovdqu16 256+__svml_hexp_data_internal(%rip), %zmm4

/*
 * Variables:
 * W
 * H
 * HM
 * No callout
 * Copy argument
 * Check sign of input (to adjust shifter)
 */
        vpxord    %zmm1, %zmm1, %zmm1
        vpcmpgtw  %zmm1, %zmm0, %k1
        vpsubw    __svml_hexp_data_internal(%rip), %zmm2, %zmm2{%k1}
        vfmadd213ph {rz-sae}, %zmm2, %zmm0, %zmm5
        vsubph    {rn-sae}, %zmm2, %zmm5, %zmm8

/*
 * 2^(k/32) (k in 0..31)
 * table value: index in last 5 bits of S
 */
        vpermw    320+__svml_hexp_data_internal(%rip), %zmm5, %zmm6
        vfmadd231ph {rn-sae}, %zmm8, %zmm3, %zmm0
        vfmadd231ph {rn-sae}, %zmm8, %zmm4, %zmm0

/* T+T*R */
        vfmadd213ph {rn-sae}, %zmm6, %zmm0, %zmm6

/* Fixup for sign of underflow result */
        vpandd    448+__svml_hexp_data_internal(%rip), %zmm6, %zmm7

/* (T+T*R)*2^floor(N) */
        vscalefph {rn-sae}, %zmm8, %zmm7, %zmm0
        ret

        .cfi_endproc

        .type	__svml_exps32,@function
        .size	__svml_exps32,.-__svml_exps32

        .section .rodata, "a"
        .align 64

__svml_hexp_data_internal:
	.rept	32
        .word	0x0100
	.endr
	.rept	32
        .word	0x5300
	.endr
	.rept	32
        .word	0x3dc5
	.endr
	.rept	32
        .word	0xb98c
	.endr
	.rept	32
        .word	0x0af4
	.endr
        .word	0x3c00
        .word	0x3c16
        .word	0x3c2d
        .word	0x3c45
        .word	0x3c5d
        .word	0x3c75
        .word	0x3c8e
        .word	0x3ca8
        .word	0x3cc2
        .word	0x3cdc
        .word	0x3cf8
        .word	0x3d14
        .word	0x3d30
        .word	0x3d4d
        .word	0x3d6b
        .word	0x3d89
        .word	0x3da8
        .word	0x3dc8
        .word	0x3de8
        .word	0x3e09
        .word	0x3e2b
        .word	0x3e4e
        .word	0x3e71
        .word	0x3e95
        .word	0x3eba
        .word	0x3ee0
        .word	0x3f06
        .word	0x3f2e
        .word	0x3f56
        .word	0x3f7f
        .word	0x3fa9
        .word	0x3fd4
	.rept	32
        .word	0xbfff
	.endr
	.rept	32
        .word	0x7fff
	.endr
	.rept	32
        .word	0xcc80
	.endr
	.rept	32
        .word	0x4a00
	.endr
	.rept	32
        .word	0x6a0f
	.endr
	.rept	32
        .word	0x3dc5
	.endr
	.rept	32
        .word	0x0d1e
	.endr
	.rept	32
        .word	0x2110
	.endr
	.rept	32
        .word	0x2b52
	.endr
	.rept	32
        .word	0x33af
	.endr
	.rept	32
        .word	0x398b
	.endr
	.rept	32
        .word	0x7c00
	.endr
        .type	__svml_hexp_data_internal,@object
        .size	__svml_hexp_data_internal,1152
