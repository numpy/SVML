/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_acoshs32_ha           # -- Begin function __svml_acoshs32_ha
	.p2align	4
	.type	__svml_acoshs32_ha,@function
__svml_acoshs32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hacosh_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vsubps	{rn-sae}, %zmm2, %zmm1, %zmm3
	vsubps	{rn-sae}, %zmm2, %zmm0, %zmm4
	vrsqrt14ps	%zmm3, %zmm5
	vrsqrt14ps	%zmm4, %zmm6
	vmovups	__svml_hacosh_ha_data_internal+128(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+192(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm3, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm7, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm4, %zmm7
	vfmadd213ps	{rn-sae}, %zmm9, %zmm3, %zmm10
	vrcp14ps	%zmm5, %zmm3
	vfmadd213ps	{rn-sae}, %zmm9, %zmm4, %zmm7
	vmulps	{rn-sae}, %zmm3, %zmm10, %zmm3
	vrcp14ps	%zmm6, %zmm4
	vmulps	{rn-sae}, %zmm4, %zmm7, %zmm4
	vmovups	__svml_hacosh_ha_data_internal+64(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vcmpnltps	%zmm5, %zmm1, %k2
	vcmpnltps	%zmm5, %zmm0, %k1
	vrcp14ps	%zmm1, %zmm5
	vrcp14ps	%zmm0, %zmm6
	vmovups	__svml_hacosh_ha_data_internal+320(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+384(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+448(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm5, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm7, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm6, %zmm7
	vfmadd213ps	{rn-sae}, %zmm9, %zmm5, %zmm10
	vfmadd213ps	{rn-sae}, %zmm9, %zmm6, %zmm7
	vgetmantps	$11, {sae}, %zmm1, %zmm5
	vgetmantps	$11, {sae}, %zmm0, %zmm6
	vgetexpps	{sae}, %zmm1, %zmm1
	vgetexpps	{sae}, %zmm0, %zmm0
	vsubps	{rn-sae}, %zmm2, %zmm5, %zmm8
	vsubps	{rn-sae}, %zmm2, %zmm6, %zmm2
	vgetexpps	{sae}, %zmm5, %zmm5
	vsubps	{rn-sae}, %zmm5, %zmm1, %zmm1
	vgetexpps	{sae}, %zmm6, %zmm5
	vsubps	{rn-sae}, %zmm5, %zmm0, %zmm0
	vmovups	__svml_hacosh_ha_data_internal+512(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+576(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+640(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacosh_ha_data_internal+704(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm8, %zmm12
	vfmadd213ps	{rn-sae}, %zmm6, %zmm5, %zmm12
	vfmadd213ps	{rn-sae}, %zmm6, %zmm2, %zmm5
	vfmadd213ps	{rn-sae}, %zmm9, %zmm8, %zmm12
	vfmadd213ps	{rn-sae}, %zmm9, %zmm2, %zmm5
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm2, %zmm5
	vfmadd213ps	{rn-sae}, %zmm10, %zmm8, %zmm12
	vfmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm5
	vmovups	__svml_hacosh_ha_data_internal+768(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vfmadd231ps	{rn-sae}, %zmm1, %zmm2, %zmm12
	vfmadd231ps	{rn-sae}, %zmm0, %zmm2, %zmm5
	vmovaps	%zmm12, %zmm3 {%k2}
	vmovaps	%zmm5, %zmm4 {%k1}
	vcvtps2phx	%zmm3, %ymm0
	vcvtps2phx	%zmm4, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_acoshs32_ha, .Lfunc_end0-__svml_acoshs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hacosh_ha_data_internal:
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1073741824                      # 0x40000000
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	1016365800                      # 0x3c9482e8
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	3186343387                      # 0xbdebbddb
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	1068826732                      # 0x3fb5006c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	3197777948                      # 0xbe9a381c
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1013159958                      # 0x3c639816
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	1060196992                      # 0x3f315280
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	3192213607                      # 0xbe455067
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	1051810593                      # 0x3eb15b21
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	3204507554                      # 0xbf00e7a2
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
	.long	1065353216                      # 0x3f800000
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
	.size	__svml_hacosh_ha_data_internal, 832


