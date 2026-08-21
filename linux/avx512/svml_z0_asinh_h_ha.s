/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_asinhs32_ha           # -- Begin function __svml_asinhs32_ha
	.p2align	4
	.type	__svml_asinhs32_ha,@function
__svml_asinhs32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vmovups	%zmm16, -120(%rsp)              # 64-byte Spill
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hasinh_ha_data_internal+64(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm2, %zmm4
	vandps	%zmm0, %zmm2, %zmm3
	vmovups	__svml_hasinh_ha_data_internal+128(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+192(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+256(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+320(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm5
	vfmadd213ps	{rn-sae}, %zmm6, %zmm2, %zmm5
	vfmadd213ps	{rn-sae}, %zmm6, %zmm3, %zmm2
	vfmadd213ps	{rn-sae}, %zmm7, %zmm4, %zmm5
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm2
	vfmadd213ps	{rn-sae}, %zmm8, %zmm4, %zmm5
	vfmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm2
	vfmadd213ps	{rn-sae}, %zmm4, %zmm4, %zmm5
	vfmadd213ps	{rn-sae}, %zmm3, %zmm3, %zmm2
	vmovups	__svml_hasinh_ha_data_internal(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vcmpnltps	%zmm6, %zmm4, %k1
	vrcp14ps	%zmm4, %zmm7
	vcmpnltps	%zmm6, %zmm3, %k2
	vrcp14ps	%zmm3, %zmm8
	vmovups	__svml_hasinh_ha_data_internal+384(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+448(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+512(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+576(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm7, %zmm13
	vfmadd213ps	{rn-sae}, %zmm10, %zmm9, %zmm13
	vfmadd213ps	{rn-sae}, %zmm10, %zmm8, %zmm9
	vfmadd213ps	{rn-sae}, %zmm11, %zmm7, %zmm13
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm9
	vfmadd213ps	{rn-sae}, %zmm12, %zmm7, %zmm13
	vfmadd213ps	{rn-sae}, %zmm12, %zmm8, %zmm9
	vgetmantps	$11, {sae}, %zmm4, %zmm7
	vgetmantps	$11, {sae}, %zmm3, %zmm8
	vgetexpps	{sae}, %zmm4, %zmm10
	vgetexpps	{sae}, %zmm3, %zmm11
	vsubps	{rn-sae}, %zmm6, %zmm7, %zmm12
	vsubps	{rn-sae}, %zmm6, %zmm8, %zmm6
	vgetexpps	{sae}, %zmm7, %zmm7
	vsubps	{rn-sae}, %zmm7, %zmm10, %zmm7
	vgetexpps	{sae}, %zmm8, %zmm8
	vsubps	{rn-sae}, %zmm8, %zmm11, %zmm8
	vmovups	__svml_hasinh_ha_data_internal+640(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+704(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+768(%rip), %zmm14 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasinh_ha_data_internal+832(%rip), %zmm15 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm12, %zmm16
	vfmadd213ps	{rn-sae}, %zmm11, %zmm10, %zmm16
	vfmadd213ps	{rn-sae}, %zmm11, %zmm6, %zmm10
	vfmadd213ps	{rn-sae}, %zmm14, %zmm12, %zmm16
	vfmadd213ps	{rn-sae}, %zmm14, %zmm6, %zmm10
	vfmadd213ps	{rn-sae}, %zmm15, %zmm12, %zmm16
	vfmadd213ps	{rn-sae}, %zmm15, %zmm6, %zmm10
	vfmadd213ps	{rn-sae}, %zmm13, %zmm12, %zmm16
	vfmadd213ps	{rn-sae}, %zmm9, %zmm6, %zmm10
	vmovups	__svml_hasinh_ha_data_internal+896(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vfmadd231ps	{rn-sae}, %zmm7, %zmm6, %zmm16
	vfmadd231ps	{rn-sae}, %zmm8, %zmm6, %zmm10
	vmovaps	%zmm16, %zmm5 {%k1}
	vmovaps	%zmm10, %zmm2 {%k2}
	vpternlogd	$150, %zmm4, %zmm1, %zmm5 # zmm5 = zmm5 ^ zmm1 ^ zmm4
	vpternlogd	$150, %zmm3, %zmm0, %zmm2 # zmm2 = zmm2 ^ zmm0 ^ zmm3
	vcvtps2phx	%zmm5, %ymm0
	vcvtps2phx	%zmm2, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	vmovups	-120(%rsp), %zmm16              # 64-byte Reload
	retq
.Lfunc_end0:
	.size	__svml_asinhs32_ha, .Lfunc_end0-__svml_asinhs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hasinh_ha_data_internal:
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
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	1032473325                      # 0x3d8a4aed
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	3191913475                      # 0xbe40bc03
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	990615122                       # 0x3b0b9652
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3064836234                      # 0xb6adb08a
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	3182867575                      # 0xbdb6b477
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	1049618843                      # 0x3e8fe99b
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	3144927109                      # 0xbb73c785
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
	.long	1060206271                      # 0x3f3176bf
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
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
	.long	1065350434                      # 0x3f7ff522
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
	.size	__svml_hasinh_ha_data_internal, 960


