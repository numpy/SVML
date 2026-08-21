/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_log1ps32_ha           # -- Begin function __svml_log1ps32_ha
	.p2align	4
	.type	__svml_log1ps32_ha,@function
__svml_log1ps32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vmovups	__svml_hlog1p_ha_data_internal(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vaddps	{rn-sae}, %zmm3, %zmm1, %zmm4
	vaddps	{rn-sae}, %zmm3, %zmm2, %zmm5
	vmaxps	{sae}, %zmm3, %zmm1, %zmm6
	vmaxps	{sae}, %zmm3, %zmm2, %zmm7
	vminps	{sae}, %zmm3, %zmm1, %zmm1
	vminps	{sae}, %zmm3, %zmm2, %zmm2
	vgetmantps	$11, {sae}, %zmm4, %zmm8
	vgetmantps	$11, {sae}, %zmm5, %zmm9
	vgetexpps	{sae}, %zmm4, %zmm10
	vgetexpps	{sae}, %zmm5, %zmm11
	vsubps	{rn-sae}, %zmm6, %zmm4, %zmm4
	vsubps	{rn-sae}, %zmm4, %zmm1, %zmm1
	vsubps	{rn-sae}, %zmm7, %zmm5, %zmm4
	vsubps	{rn-sae}, %zmm4, %zmm2, %zmm2
	vgetexpps	{sae}, %zmm8, %zmm4
	vsubps	{rn-sae}, %zmm10, %zmm4, %zmm4
	vgetexpps	{sae}, %zmm9, %zmm5
	vsubps	{rn-sae}, %zmm11, %zmm5, %zmm5
	vsubps	{rn-sae}, %zmm3, %zmm8, %zmm6
	vsubps	{rn-sae}, %zmm3, %zmm9, %zmm3
	vscalefps	{rn-sae}, %zmm4, %zmm1, %zmm1
	vscalefps	{rn-sae}, %zmm5, %zmm2, %zmm2
	vmovups	__svml_hlog1p_ha_data_internal+64(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm7, %zmm1
	vandps	%zmm2, %zmm7, %zmm2
	vmovups	__svml_hlog1p_ha_data_internal+128(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog1p_ha_data_internal+192(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog1p_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog1p_ha_data_internal+320(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog1p_ha_data_internal+384(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vaddps	{rn-sae}, %zmm1, %zmm6, %zmm1
	vfmadd213ps	{rn-sae}, %zmm8, %zmm7, %zmm6
	vfmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm7
	vaddps	{rn-sae}, %zmm2, %zmm3, %zmm2
	vfpclassph	$14, %zmm0, %k1         # k1 = isPositiveZero(zmm0) | isNegativeZero(zmm0) | isPositiveInfinity(zmm0)
	vfmadd213ps	{rn-sae}, %zmm9, %zmm1, %zmm6
	vfmadd213ps	{rn-sae}, %zmm9, %zmm2, %zmm7
	vfmadd213ps	{rn-sae}, %zmm10, %zmm1, %zmm6
	vfmadd213ps	{rn-sae}, %zmm10, %zmm2, %zmm7
	vfmadd213ps	{rn-sae}, %zmm11, %zmm1, %zmm6
	vfmadd213ps	{rn-sae}, %zmm11, %zmm2, %zmm7
	vfmadd213ps	{rn-sae}, %zmm1, %zmm1, %zmm6
	vfmadd213ps	{rn-sae}, %zmm2, %zmm2, %zmm7
	vmovups	__svml_hlog1p_ha_data_internal+448(%rip), %zmm1 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm4, %zmm1, %zmm6
	vfnmadd231ps	{rn-sae}, %zmm1, %zmm5, %zmm7
	vcvtps2phx	%zmm6, %ymm1
	vcvtps2phx	%zmm7, %ymm2
	vinserti64x4	$1, %ymm2, %zmm1, %zmm1
	vmovdqu16	%zmm0, %zmm1 {%k1}
	vmovdqa64	%zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_log1ps32_ha, .Lfunc_end0-__svml_log1ps32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hlog1p_ha_data_internal:
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
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	3221225471                      # 0xbfffffff
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	1041302505                      # 0x3e1103e9
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	3196384924                      # 0xbe84f69c
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	1051539891                      # 0x3ead39b3
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3204444370                      # 0xbefff0d2
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
	.long	3092229209                      # 0xb84fac59
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
	.size	__svml_hlog1p_ha_data_internal, 512



	.section	.note.GNU-stack,"",@progbits
