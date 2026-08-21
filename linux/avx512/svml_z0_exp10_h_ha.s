/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_exp10s32_ha           # -- Begin function __svml_exp10s32_ha
	.p2align	4
	.type	__svml_exp10s32_ha,@function
__svml_exp10s32_ha:                  # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hexp10_ha_data_internal_avx512(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp10_ha_data_internal_avx512+64(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm4
	vfmadd213ps	{rn-sae}, %zmm3, %zmm2, %zmm4
	vfmadd213ps	{rn-sae}, %zmm3, %zmm0, %zmm2
	vsubps	{rn-sae}, %zmm3, %zmm4, %zmm4
	vsubps	{rn-sae}, %zmm3, %zmm2, %zmm2
	vmovups	__svml_hexp10_ha_data_internal_avx512+128(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm3, %zmm4, %zmm1
	vfnmadd213ps	{rn-sae}, %zmm0, %zmm2, %zmm3
	vmovups	__svml_hexp10_ha_data_internal_avx512+256(%rip), %zmm0 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp10_ha_data_internal_avx512+320(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp10_ha_data_internal_avx512+384(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp10_ha_data_internal_avx512+448(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp10_ha_data_internal_avx512+512(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm9
	vfmadd213ps	{rn-sae}, %zmm5, %zmm0, %zmm9
	vfmadd213ps	{rn-sae}, %zmm5, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm6, %zmm1, %zmm9
	vfmadd213ps	{rn-sae}, %zmm6, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm7, %zmm1, %zmm9
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm0
	vfmadd213ps	{rn-sae}, %zmm8, %zmm1, %zmm9
	vfmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm0
	vscalefps	{rn-sae}, %zmm4, %zmm9, %zmm1
	vscalefps	{rn-sae}, %zmm2, %zmm0, %zmm0
	vcvtps2phx	%zmm1, %ymm1
	vcvtps2phx	%zmm0, %ymm0
	vinsertf64x4	$1, %ymm0, %zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_exp10s32_ha, .Lfunc_end0-__svml_exp10s32_ha
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hexp10_ha_data_internal_avx512

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hexp10_ha_data_internal_avx512:
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
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
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
	.long	1050288283                      # 0x3e9a209b
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
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1067068325                      # 0x3f9a2ba5
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1074146614                      # 0x40062d36
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1076466220                      # 0x4029922c
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1075005060                      # 0x40134684
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	51200                           # 0xc800
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	17920                           # 0x4600
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	27151                           # 0x6a0f
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.short	17061                           # 0x42a5
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1079286392                      # 0x40549a78
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1008864492                      # 0x3c220cec
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1030373605                      # 0x3d6a40e5
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1047911584                      # 0x3e75dca0
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1060197979                      # 0x3f31565b
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.long	1065353298                      # 0x3f800052
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.short	31744                           # 0x7c00
	.size	__svml_hexp10_ha_data_internal_avx512, 1280



	.section	.note.GNU-stack,"",@progbits
