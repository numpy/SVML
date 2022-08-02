/*******************************************
* Copyright (C) 2022 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

/*
 * ALGORITHM DESCRIPTION:
 *
 *     2^X = 2^Xo  x  2^{X-Xo}
 *     2^X = 2^K  x  2^fo  x  2^{X-Xo}
 *     2^X = 2^K  x  2^fo  x  2^r
 *
 *     2^K  --> Manual scaling
 *     2^fo --> Table lookup
 *     r    --> 1 + poly    (r = X - Xo)
 *
 *     Xo = K  +  fo
 *     Xo = K  +  0.x1x2x3x4
 *
 *     r = X - Xo
 *       = Vreduce(X, imm)
 *       = X - VRndScale(X, imm),    where Xo = VRndScale(X, imm)
 *
 *     Rnd(S + X) = S + Xo,    where S is selected as S = 2^19 x 1.5
 *         S + X = S + floor(X) + 0.x1x2x3x4
 *     Rnd(S + X) = Rnd(2^19 x 1.5 + X)
 *     (Note: 2^exp x 1.b1b2b3 ... b23,  2^{exp-23} = 2^-4 for exp=19)
 *
 *     exp2(x) =  2^K  x  2^fo  x (1 + poly(r)),   where 2^r = 1 + poly(r)
 *
 *     Scale back:
 *     dest = src1 x 2^floor(src2)
 *
 *
 */

        .text

        .align    16,0x90
        .globl __svml_exp2s32

__svml_exp2s32:

        .cfi_startproc

/*
 * No callout
 * reduce argument to [0, 1), i.e. x-floor(x)
 */
        vreduceph $9, {sae}, %zmm0, %zmm3
        vmovdqu16 __svml_hexp2_data_internal(%rip), %zmm5
        vmovdqu16 64+__svml_hexp2_data_internal(%rip), %zmm1
        vmovdqu16 128+__svml_hexp2_data_internal(%rip), %zmm2
        vmovdqu16 192+__svml_hexp2_data_internal(%rip), %zmm4

/* start polynomial */
        vfmadd213ph {rn-sae}, %zmm1, %zmm3, %zmm5
        vfmadd213ph {rn-sae}, %zmm2, %zmm3, %zmm5
        vfmadd213ph {rn-sae}, %zmm4, %zmm3, %zmm5

/* poly*2^floor(x) */
        vscalefph {rn-sae}, %zmm0, %zmm5, %zmm0
        ret

        .cfi_endproc

        .type	__svml_exp2s32,@function
        .size	__svml_exp2s32,.-__svml_exp2s32

        .section .rodata, "a"
        .align 64

__svml_hexp2_data_internal:
	.rept	32
        .word	0x2d12
	.endr
	.rept	32
        .word	0x332e
	.endr
	.rept	32
        .word	0x3992
	.endr
	.rept	32
        .word	0x3c00
	.endr
	.rept	32
        .word	0xce80
	.endr
	.rept	32
        .word	0x4c00
	.endr
	.rept	32
        .word	0x6a0f
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
        .type	__svml_hexp2_data_internal,@object
        .size	__svml_hexp2_data_internal,768
