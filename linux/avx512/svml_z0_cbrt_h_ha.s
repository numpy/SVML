/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function __svml_cbrts32_ha
.LCPI0_0:
	.long	32                              # 0x20
	.text
	.globl	__svml_cbrts32_ha
	.p2align	4
	.type	__svml_cbrts32_ha,@function
__svml_cbrts32_ha:                   # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vfpclassph	$30, %zmm0, %k1         # k1 = isPositiveZero(zmm0) | isNegativeZero(zmm0) | isPositiveInfinity(zmm0) | isNegativeInfinity(zmm0)
	vmovdqu64	__svml_hcbrt_ha_data_internal+320(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vgetmantps	$4, {sae}, %zmm1, %zmm4
	vgetmantps	$4, {sae}, %zmm2, %zmm5
	vgetexpps	{sae}, %zmm1, %zmm6
	vgetexpps	{sae}, %zmm2, %zmm7
	vmovups	__svml_hcbrt_ha_data_internal+256(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vsubps	{rn-sae}, %zmm8, %zmm4, %zmm4
	vsubps	{rn-sae}, %zmm8, %zmm5, %zmm5
	vmovups	__svml_hcbrt_ha_data_internal+384(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vaddps	{rn-sae}, %zmm8, %zmm6, %zmm6
	vaddps	{rn-sae}, %zmm8, %zmm7, %zmm7
	vmovups	__svml_hcbrt_ha_data_internal(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcbrt_ha_data_internal+64(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm8, %zmm10
	vpermt2ps	%zmm9, %zmm6, %zmm10
	vpermt2ps	%zmm9, %zmm7, %zmm8
	vmovups	__svml_hcbrt_ha_data_internal+128(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcbrt_ha_data_internal+192(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm9, %zmm12
	vpermt2ps	%zmm11, %zmm6, %zmm12
	vpermt2ps	%zmm11, %zmm7, %zmm9
	vpbroadcastd	.LCPI0_0(%rip), %zmm11  # zmm11 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vptestnmd	%zmm11, %zmm6, %k2
	vptestnmd	%zmm11, %zmm7, %k3
	vmovaps	%zmm10, %zmm12 {%k2}
	vmovaps	%zmm8, %zmm9 {%k3}
	vpternlogd	$248, %zmm1, %zmm3, %zmm12 # zmm12 = zmm12 | (zmm3 & zmm1)
	vpternlogd	$248, %zmm2, %zmm3, %zmm9 # zmm9 = zmm9 | (zmm3 & zmm2)
	vmovups	__svml_hcbrt_ha_data_internal+448(%rip), %zmm1 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcbrt_ha_data_internal+512(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcbrt_ha_data_internal+576(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hcbrt_ha_data_internal+640(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm7
	vfmadd213ps	{rn-sae}, %zmm2, %zmm1, %zmm7
	vfmadd213ps	{rn-sae}, %zmm2, %zmm5, %zmm1
	vfmadd213ps	{rn-sae}, %zmm3, %zmm4, %zmm7
	vfmadd213ps	{rn-sae}, %zmm3, %zmm5, %zmm1
	vfmadd213ps	{rn-sae}, %zmm6, %zmm4, %zmm7
	vfmadd213ps	{rn-sae}, %zmm6, %zmm5, %zmm1
	vmulps	{rn-sae}, %zmm4, %zmm7, %zmm2
	vmulps	{rn-sae}, %zmm5, %zmm1, %zmm1
	vfmadd132ps	{rn-sae}, %zmm12, %zmm12, %zmm2
	vfmadd132ps	{rn-sae}, %zmm9, %zmm9, %zmm1
	vcvtps2phx	%zmm2, %ymm2
	vcvtps2phx	%zmm1, %ymm1
	vinserti64x4	$1, %ymm1, %zmm2, %zmm1
	vmovdqu16	%zmm0, %zmm1 {%k1}
	vmovdqa64	%zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_cbrts32_ha, .Lfunc_end0-__svml_cbrts32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hcbrt_ha_data_internal:
	.long	1065353216                      # 0x3f800000
	.long	1067533592                      # 0x3fa14518
	.long	1070280693                      # 0x3fcb2ff5
	.long	1073741824                      # 0x40000000
	.long	1075922200                      # 0x40214518
	.long	1078669301                      # 0x404b2ff5
	.long	1082130432                      # 0x40800000
	.long	1084310808                      # 0x40a14518
	.long	1087057909                      # 0x40cb2ff5
	.long	1090519040                      # 0x41000000
	.long	1092699416                      # 0x41214518
	.long	1095446517                      # 0x414b2ff5
	.long	1098907648                      # 0x41800000
	.long	1101088024                      # 0x41a14518
	.long	1103835125                      # 0x41cb2ff5
	.long	1107296256                      # 0x42000000
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
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	998244352                       # 0x3b800000
	.long	1000424728                      # 0x3ba14518
	.long	1003171829                      # 0x3bcb2ff5
	.long	1006632960                      # 0x3c000000
	.long	1008813336                      # 0x3c214518
	.long	1011560437                      # 0x3c4b2ff5
	.long	1015021568                      # 0x3c800000
	.long	1017201944                      # 0x3ca14518
	.long	1019949045                      # 0x3ccb2ff5
	.long	1023410176                      # 0x3d000000
	.long	1025590552                      # 0x3d214518
	.long	1028337653                      # 0x3d4b2ff5
	.long	1031798784                      # 0x3d800000
	.long	1033979160                      # 0x3da14518
	.long	1036726261                      # 0x3dcb2ff5
	.long	1040187392                      # 0x3e000000
	.long	1042367768                      # 0x3e214518
	.long	1045114869                      # 0x3e4b2ff5
	.long	1048576000                      # 0x3e800000
	.long	1050756376                      # 0x3ea14518
	.long	1053503477                      # 0x3ecb2ff5
	.long	1056964608                      # 0x3f000000
	.long	1059144984                      # 0x3f214518
	.long	1061892085                      # 0x3f4b2ff5
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
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
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
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	3160482941                      # 0xbc61247d
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	1028281244                      # 0x3d4a539c
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	3185532729                      # 0xbddf5f39
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.long	1051370365                      # 0x3eaaa37d
	.size	__svml_hcbrt_ha_data_internal, 704



	.section	.note.GNU-stack,"",@progbits
