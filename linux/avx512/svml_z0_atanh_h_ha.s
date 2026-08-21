/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0                          # -- Begin function __svml_atanhs32_ha
.LCPI0_0:
	.short	0x8000                          #  -0
	.text
	.globl	__svml_atanhs32_ha
	.p2align	4
	.type	__svml_atanhs32_ha,@function
__svml_atanhs32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vmovdqu64	__svml_hatanh_ha_data_internal+384(%rip), %zmm1 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatanh_ha_data_internal+448(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vpbroadcastw	.LCPI0_0(%rip), %zmm3   # zmm3 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vpternlogq	$120, %zmm0, %zmm1, %zmm3 # zmm3 = zmm3 ^ (zmm1 & zmm0)
	vfmadd132ph	{rn-sae}, %zmm2, %zmm2, %zmm3
	vcvtph2psx	%ymm3, %zmm2
	vextractf64x4	$1, %zmm3, %ymm4
	vcvtph2psx	%ymm4, %zmm4
	vcvtph2psx	%ymm0, %zmm5
	vextracti64x4	$1, %zmm0, %ymm6
	vcvtph2psx	%ymm6, %zmm6
	vpsrld	$22, %zmm2, %zmm7
	vpsrld	$22, %zmm4, %zmm8
	vmovups	__svml_hatanh_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatanh_ha_data_internal+320(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm9, %zmm11
	vpermt2ps	%zmm10, %zmm7, %zmm11
	vpermt2ps	%zmm10, %zmm8, %zmm9
	vmovups	__svml_hatanh_ha_data_internal+128(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatanh_ha_data_internal+192(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm10, %zmm13
	vpermt2ps	%zmm12, %zmm7, %zmm13
	vpermt2ps	%zmm12, %zmm8, %zmm10
	vmovups	__svml_hatanh_ha_data_internal(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatanh_ha_data_internal+64(%rip), %zmm14 # AlignMOV convert to UnAlignMOV 
	vpermi2ps	%zmm14, %zmm12, %zmm7
	vpermt2ps	%zmm14, %zmm8, %zmm12
	vfmadd231ps	{rn-sae}, %zmm11, %zmm2, %zmm13
	vfmadd231ps	{rn-sae}, %zmm9, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm13
	vfmadd213ps	{rn-sae}, %zmm12, %zmm4, %zmm10
	vcmpleph	__svml_hatanh_ha_data_internal+512(%rip), %zmm3, %k1
	vrsqrtph	%zmm3, %zmm2
	vpternlogq	$242, %zmm0, %zmm1, %zmm2 # zmm2 = zmm2 | (zmm0 & ~zmm1)
	vfmadd213ps	{rn-sae}, %zmm5, %zmm5, %zmm13
	vfmadd213ps	{rn-sae}, %zmm6, %zmm6, %zmm10
	vcvtps2phx	%zmm13, %ymm0
	vcvtps2phx	%zmm10, %ymm1
	vinserti64x4	$1, %ymm1, %zmm0, %zmm0
	vmovdqu16	%zmm2, %zmm0 {%k1}
	retq
.Lfunc_end0:
	.size	__svml_atanhs32_ha, .Lfunc_end0-__svml_atanhs32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hatanh_ha_data_internal:
	.long	1055785335                      # 0x3eee0177
	.long	1052071782                      # 0x3eb55766
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	1081329115                      # 0x4073c5db
	.long	1080599880                      # 0x4068a548
	.long	1079876107                      # 0x405d9a0b
	.long	1079147131                      # 0x40527a7b
	.long	1078423724                      # 0x404770ac
	.long	1077695262                      # 0x403c531e
	.long	1076972584                      # 0x40314c28
	.long	1076245143                      # 0x40263297
	.long	1075523907                      # 0x401b3143
	.long	1074798477                      # 0x40101f8d
	.long	1074080064                      # 0x40052940
	.long	1072975273                      # 0x3ff44da9
	.long	1071549328                      # 0x3fde8b90
	.long	1070121201                      # 0x3fc8c0f1
	.long	1068715662                      # 0x3fb34e8e
	.long	1067315011                      # 0x3f9def43
	.long	1065946313                      # 0x3f890cc9
	.long	1063835479                      # 0x3f68d757
	.long	1061227504                      # 0x3f410bf0
	.long	1058700178                      # 0x3f1a7b92
	.long	3196209665                      # 0xbe824a01
	.long	3191217757                      # 0xbe361e5d
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	3285189064                      # 0xc3d001c8
	.long	3281201117                      # 0xc39327dd
	.long	3276774956                      # 0xc34f9e2c
	.long	3272788409                      # 0xc312c9b9
	.long	3268340999                      # 0xc2ceed07
	.long	3264357239                      # 0xc2922377
	.long	3259872935                      # 0xc24db6a7
	.long	3255894708                      # 0xc21102b4
	.long	3251347691                      # 0xc1cba0eb
	.long	3247380365                      # 0xc18f178d
	.long	3242729579                      # 0xc148206b
	.long	3238783464                      # 0xc10be9e8
	.long	3233966719                      # 0xc0c26a7f
	.long	3230061015                      # 0xc086d1d7
	.long	3224989857                      # 0xc03970a1
	.long	3221091896                      # 0xbffdf638
	.long	3215717278                      # 0xbfabf39e
	.long	3211199599                      # 0xbf67046f
	.long	3206076977                      # 0xbf18da31
	.long	3200785997                      # 0xbec81e4d
	.long	1024579546                      # 0x3d11d7da
	.long	1018621026                      # 0x3cb6ec62
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	1193801136                      # 0x4727f5b0
	.long	1185494231                      # 0x46a934d7
	.long	1177017433                      # 0x4627dc59
	.long	1168707840                      # 0x45a91100
	.long	1160227421                      # 0x4527aa5d
	.long	1151912602                      # 0x44a8ca9a
	.long	1143425204                      # 0x442748b4
	.long	1135100405                      # 0x43a841f5
	.long	1126599876                      # 0x43268cc4
	.long	1118256568                      # 0x42a73db8
	.long	1109732235                      # 0x42252b8b
	.long	1101356115                      # 0x41a55c53
	.long	1092791086                      # 0x4122ab2e
	.long	1084360835                      # 0x40a20883
	.long	1075732680                      # 0x401e60c8
	.long	1067223849                      # 0x3f9c8b29
	.long	1058515961                      # 0x3f17abf9
	.long	1049926975                      # 0x3e949d3f
	.long	1041191230                      # 0x3e0f513e
	.long	1032704109                      # 0x3d8dd06d
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
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.short	17408                           # 0x4400
	.zero	64
	.size	__svml_hatanh_ha_data_internal, 576



	.section	.note.GNU-stack,"",@progbits
