/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_sinhs32_ha            # -- Begin function __svml_sinhs32_ha
	.p2align	4
	.type	__svml_sinhs32_ha,@function
__svml_sinhs32_ha:                   # 
	.cfi_startproc
# %bb.0:
	vpandq	__svml_hsinh_ha_data_internal(%rip), %zmm0, %zmm1
	vcvtph2psx	%ymm1, %zmm2
	vextracti64x4	$1, %zmm1, %ymm3
	vcvtph2psx	%ymm3, %zmm3
	vmovups	__svml_hsinh_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsinh_ha_data_internal+128(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm6
	vfmadd213ps	{rz-sae}, %zmm5, %zmm2, %zmm6
	vfmadd213ps	{rz-sae}, %zmm5, %zmm3, %zmm4
	vsubps	{rn-sae}, %zmm5, %zmm6, %zmm6
	vsubps	{rn-sae}, %zmm5, %zmm4, %zmm4
	vmovups	__svml_hsinh_ha_data_internal+192(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm5, %zmm6, %zmm2
	vfnmadd213ps	{rn-sae}, %zmm3, %zmm4, %zmm5
	vmovups	__svml_hsinh_ha_data_internal+256(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm2, %zmm3, %zmm2
	vandps	%zmm5, %zmm3, %zmm3
	vmovups	__svml_hsinh_ha_data_internal+320(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsinh_ha_data_internal+384(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsinh_ha_data_internal+448(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsinh_ha_data_internal+512(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm5, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm10
	vmovaps	%zmm5, %zmm11
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm11
	vfmadd213ps	{rn-sae}, %zmm8, %zmm2, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm11
	vfmadd213ps	{rn-sae}, %zmm9, %zmm2, %zmm10
	vfmadd213ps	{rn-sae}, %zmm9, %zmm3, %zmm11
	vmovaps	%zmm5, %zmm12
	vfnmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm12
	vfnmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm5
	vfnmadd213ps	{rn-sae}, %zmm8, %zmm2, %zmm12
	vfnmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm5
	vfnmadd213ps	{rn-sae}, %zmm9, %zmm2, %zmm12
	vfnmadd213ps	{rn-sae}, %zmm9, %zmm3, %zmm5
	vsubps	{rn-sae}, %zmm9, %zmm6, %zmm6
	vmovups	__svml_hsinh_ha_data_internal+576(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vscalefps	{rn-sae}, %zmm6, %zmm7, %zmm6
	vrcp14ps	%zmm6, %zmm8
	vsubps	{rn-sae}, %zmm9, %zmm4, %zmm4
	vscalefps	{rn-sae}, %zmm4, %zmm7, %zmm4
	vrcp14ps	%zmm4, %zmm7
	vmulps	{rn-sae}, %zmm2, %zmm6, %zmm9
	vmulps	{rn-sae}, %zmm3, %zmm4, %zmm13
	vmulps	{rn-sae}, %zmm2, %zmm8, %zmm2
	vmulps	{rn-sae}, %zmm2, %zmm12, %zmm2
	vmulps	{rn-sae}, %zmm3, %zmm7, %zmm3
	vmulps	{rn-sae}, %zmm3, %zmm5, %zmm3
	vmovups	__svml_hsinh_ha_data_internal+640(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vfnmadd213ps	{rn-sae}, %zmm6, %zmm5, %zmm8
	vfnmadd213ps	{rn-sae}, %zmm4, %zmm5, %zmm7
	vmulps	{rn-sae}, %zmm5, %zmm2, %zmm2
	vfmadd231ps	{rn-sae}, %zmm9, %zmm10, %zmm2
	vaddps	{rn-sae}, %zmm8, %zmm2, %zmm2
	vmulps	{rn-sae}, %zmm5, %zmm3, %zmm3
	vfmadd231ps	{rn-sae}, %zmm13, %zmm11, %zmm3
	vaddps	{rn-sae}, %zmm7, %zmm3, %zmm3
	vfpclassps	$8, %zmm6, %k1          # k1 = isPositiveInfinity(zmm6)
	vfpclassps	$8, %zmm4, %k2          # k2 = isPositiveInfinity(zmm4)
	vmovaps	%zmm6, %zmm2 {%k1}
	vmovaps	%zmm4, %zmm3 {%k2}
	vcvtps2phx	%zmm2, %ymm2
	vcvtps2phx	%zmm3, %ymm3
	vinserti64x4	$1, %ymm3, %zmm2, %zmm2
	vpternlogq	$150, %zmm2, %zmm1, %zmm0 # zmm0 = zmm0 ^ zmm1 ^ zmm2
	retq
.Lfunc_end0:
	.size	__svml_sinhs32_ha, .Lfunc_end0-__svml_sinhs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hsinh_ha_data_internal:
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
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1026477880                      # 0x3d2ecf38
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1043255151                      # 0x3e2ecf6f
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1056959153                      # 0x3effeab1
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
	.long	1065349126                      # 0x3f7ff006
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
	.size	__svml_hsinh_ha_data_internal, 704



	.section	.note.GNU-stack,"",@progbits
