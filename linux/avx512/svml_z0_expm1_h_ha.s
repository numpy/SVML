/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_expm1s32_ha           # -- Begin function __svml_expm1s32_ha
	.p2align	4
	.type	__svml_expm1s32_ha,@function
__svml_expm1s32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hexpm1_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vmulps	{rn-sae}, %zmm2, %zmm1, %zmm3
	vmulps	{rn-sae}, %zmm2, %zmm0, %zmm2
	vrndscaleps	$8, {sae}, %zmm3, %zmm3
	vrndscaleps	$8, {sae}, %zmm2, %zmm2
	vmovups	__svml_hexpm1_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vfmadd231ps	{rn-sae}, %zmm4, %zmm3, %zmm1
	vfmadd213ps	{rn-sae}, %zmm0, %zmm2, %zmm4
	vmovups	__svml_hexpm1_ha_data_internal+128(%rip), %zmm0 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexpm1_ha_data_internal+192(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexpm1_ha_data_internal+256(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexpm1_ha_data_internal+320(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm5, %zmm0, %zmm8
	vfmadd213ps	{rn-sae}, %zmm5, %zmm4, %zmm0
	vfmadd213ps	{rn-sae}, %zmm6, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm6, %zmm4, %zmm0
	vfmadd213ps	{rn-sae}, %zmm7, %zmm1, %zmm8
	vfmadd213ps	{rn-sae}, %zmm7, %zmm4, %zmm0
	vmulps	{rn-sae}, %zmm1, %zmm8, %zmm1
	vmulps	{rn-sae}, %zmm4, %zmm0, %zmm0
	vmovups	__svml_hexpm1_ha_data_internal+384(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vscalefps	{rn-sae}, %zmm3, %zmm4, %zmm3
	vscalefps	{rn-sae}, %zmm2, %zmm4, %zmm2
	vsubps	{rn-sae}, %zmm4, %zmm3, %zmm5
	vsubps	{rn-sae}, %zmm4, %zmm2, %zmm4
	vfpclassps	$14, %zmm3, %k1         # k1 = isPositiveZero(zmm3) | isNegativeZero(zmm3) | isPositiveInfinity(zmm3)
	vfpclassps	$14, %zmm2, %k2         # k2 = isPositiveZero(zmm2) | isNegativeZero(zmm2) | isPositiveInfinity(zmm2)
	vfmadd213ps	{rn-sae}, %zmm5, %zmm3, %zmm1
	vmovaps	%zmm5, %zmm1 {%k1}
	vfmadd213ps	{rn-sae}, %zmm4, %zmm2, %zmm0
	vmovaps	%zmm4, %zmm0 {%k2}
	vcvtps2phx	%zmm1, %ymm1
	vcvtps2phx	%zmm0, %ymm0
	vinsertf64x4	$1, %ymm0, %zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_expm1s32_ha, .Lfunc_end0-__svml_expm1s32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hexpm1_ha_data_internal:
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
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	3207688728                      # 0xbf317218
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1026273726                      # 0x3d2bb1be
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1043050945                      # 0x3e2bb1c1
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1056964271                      # 0x3efffeaf
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
	.long	1065352963                      # 0x3f7fff03
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
	.size	__svml_hexpm1_ha_data_internal, 448



	.section	.note.GNU-stack,"",@progbits
