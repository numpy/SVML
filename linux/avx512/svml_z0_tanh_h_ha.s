/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_tanhs32_ha            # -- Begin function __svml_tanhs32_ha
	.p2align	4
	.type	__svml_tanhs32_ha,@function
__svml_tanhs32_ha:                   # 
	.cfi_startproc
# %bb.0:
	vandps	__svml_htanh_ha_data_internal(%rip), %zmm0, %zmm1
	vmovups	__svml_htanh_ha_data_internal+64(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vminph	{sae}, %zmm1, %zmm2, %zmm2
	vcvtph2psx	%ymm2, %zmm3
	vextractf64x4	$1, %zmm2, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vmulps	{rn-sae}, %zmm3, %zmm3, %zmm4
	vmulps	{rn-sae}, %zmm2, %zmm2, %zmm5
	vmovups	__svml_htanh_ha_data_internal+128(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htanh_ha_data_internal+192(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htanh_ha_data_internal+256(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htanh_ha_data_internal+320(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htanh_ha_data_internal+384(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htanh_ha_data_internal+448(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm12
	vfmadd213ps	{rn-sae}, %zmm10, %zmm9, %zmm12
	vfmadd213ps	{rn-sae}, %zmm10, %zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm11, %zmm4, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm5, %zmm9
	vmovaps	%zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm6, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm5, %zmm6
	vfmadd213ps	{rn-sae}, %zmm8, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm5, %zmm6
	vrcp14ps	%zmm12, %zmm4
	vmulps	{rn-sae}, %zmm4, %zmm10, %zmm4
	vrcp14ps	%zmm9, %zmm5
	vmulps	{rn-sae}, %zmm5, %zmm6, %zmm5
	vfmadd213ps	{rn-sae}, %zmm3, %zmm3, %zmm4
	vfmadd213ps	{rn-sae}, %zmm2, %zmm2, %zmm5
	vcvtps2phx	%zmm4, %ymm2
	vcvtps2phx	%zmm5, %ymm3
	vinserti64x4	$1, %ymm3, %zmm2, %zmm2
	vpternlogq	$150, %zmm2, %zmm1, %zmm0 # zmm0 = zmm0 ^ zmm1 ^ zmm2
	retq
.Lfunc_end0:
	.size	__svml_tanhs32_ha, .Lfunc_end0-__svml_tanhs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_htanh_ha_data_internal:
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
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.short	17536                           # 0x4480
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3159470903                      # 0xbc51b337
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3198852470                      # 0xbeaa9d76
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	3073989605                      # 0xb7395be5
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1012789613                      # 0x3c5df16d
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
	.long	1054883781                      # 0x3ee03fc5
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
	.size	__svml_htanh_ha_data_internal, 512


