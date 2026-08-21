/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_exp2s32_ha            # -- Begin function __svml_exp2s32_ha
	.p2align	4
	.type	__svml_exp2s32_ha,@function
__svml_exp2s32_ha:                   # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vreduceps	$9, {sae}, %zmm1, %zmm1
	vreduceps	$9, {sae}, %zmm2, %zmm2
	vmovups	__svml_hexp2_ha_data_internal(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp2_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp2_ha_data_internal+128(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp2_ha_data_internal+192(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm7
	vfmadd213ps	{rn-sae}, %zmm4, %zmm3, %zmm7
	vfmadd213ps	{rn-sae}, %zmm4, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm5, %zmm1, %zmm7
	vfmadd213ps	{rn-sae}, %zmm5, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm6, %zmm1, %zmm7
	vcvtps2phx	%zmm7, %ymm1
	vfmadd213ps	{rn-sae}, %zmm6, %zmm2, %zmm3
	vcvtps2phx	%zmm3, %ymm2
	vinsertf64x4	$1, %ymm2, %zmm1, %zmm1
	vscalefph	{rn-sae}, %zmm0, %zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_exp2s32_ha, .Lfunc_end0-__svml_exp2s32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hexp2_ha_data_internal:
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1034040789                      # 0x3da235d5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1046853877                      # 0x3e65b8f5
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1060260616                      # 0x3f324b08
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.long	1065351420                      # 0x3f7ff8fc
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	52864                           # 0xce80
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
	.short	19456                           # 0x4c00
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
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	5526                            # 0x1596
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	8459                            # 0x210b
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	11034                           # 0x2b1a
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	13231                           # 0x33af
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	35548                           # 0x8adc
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
	.short	14732                           # 0x398c
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
	.size	__svml_hexp2_ha_data_internal, 896


