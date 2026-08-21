/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_coshs32_ha            # -- Begin function __svml_coshs32_ha
	.p2align	4
	.type	__svml_coshs32_ha,@function
__svml_coshs32_ha:                   # 
	.cfi_startproc
# %bb.0:
	vandps	__svml_hcosh_ha_data_internal(%rip), %zmm0, %zmm0
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hcosh_ha_data_internal+64(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcosh_ha_data_internal+128(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm2, %zmm4
	vfmadd213ps	{rz-sae}, %zmm3, %zmm1, %zmm4
	vfmadd213ps	{rz-sae}, %zmm3, %zmm0, %zmm2
	vsubps	{rn-sae}, %zmm3, %zmm4, %zmm4
	vsubps	{rn-sae}, %zmm3, %zmm2, %zmm2
	vmovups	__svml_hcosh_ha_data_internal+192(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm3, %zmm4, %zmm1
	vfnmadd213ps	{rn-sae}, %zmm0, %zmm2, %zmm3
	vmovups	__svml_hcosh_ha_data_internal+256(%rip), %zmm0 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcosh_ha_data_internal+320(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcosh_ha_data_internal+384(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcosh_ha_data_internal+448(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm0, %zmm8
	vfmadd213ps	{rn-sae}, %zmm5, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm5, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm6, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm6, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm7, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm7, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm0
	vsubps	{rn-sae}, %zmm7, %zmm4, %zmm1
	vscalefps	{rn-sae}, %zmm1, %zmm8, %zmm1
	vsubps	{rn-sae}, %zmm7, %zmm2, %zmm2
	vrcp14ps	%zmm1, %zmm3
	vscalefps	{rn-sae}, %zmm2, %zmm0, %zmm0
	vrcp14ps	%zmm0, %zmm2
	vmovups	__svml_hcosh_ha_data_internal+512(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vfmadd213ps	{rn-sae}, %zmm1, %zmm4, %zmm3
	vfmadd213ps	{rn-sae}, %zmm0, %zmm4, %zmm2
	vcvtps2phx	%zmm3, %ymm0
	vcvtps2phx	%zmm2, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_coshs32_ha, .Lfunc_end0-__svml_coshs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hcosh_ha_data_internal:
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.short	32767                           # 0x7fff
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1262485504                      # 0x4b400000
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1029893932                      # 0x3d62ef2c
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1042559998                      # 0x3e2433fe
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1056979802                      # 0x3f003b5a
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1065352877                      # 0x3f7ffead
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.long	1048576000                      # 0x3e800000
	.size	__svml_hcosh_ha_data_internal, 576



	.section	.note.GNU-stack,"",@progbits
