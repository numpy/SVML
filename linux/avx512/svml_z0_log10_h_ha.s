/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_log10s32_ha           # -- Begin function __svml_log10s32_ha
	.p2align	4
	.type	__svml_log10s32_ha,@function
__svml_log10s32_ha:                  # 
	.cfi_startproc
	endbr64
# %bb.0:
	vgetmantph	$11, {sae}, %zmm0, %zmm1
	vgetexpph	{sae}, %zmm0, %zmm0
	vgetexpph	{sae}, %zmm1, %zmm2
	vmovups	__svml_hlog10_ha_data_internal+384(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vsubph	{rn-sae}, %zmm3, %zmm1, %zmm1
	vcvtph2psx	%ymm1, %zmm3
	vextractf64x4	$1, %zmm1, %ymm1
	vcvtph2psx	%ymm1, %zmm1
	vsubph	{rn-sae}, %zmm2, %zmm0, %zmm0
	vcvtph2psx	%ymm0, %zmm2
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hlog10_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog10_ha_data_internal+128(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog10_ha_data_internal+192(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog10_ha_data_internal+256(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog10_ha_data_internal+320(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm3, %zmm9
	vfmadd213ps	{rn-sae}, %zmm5, %zmm4, %zmm9
	vfmadd213ps	{rn-sae}, %zmm5, %zmm1, %zmm4
	vfmadd213ps	{rn-sae}, %zmm6, %zmm3, %zmm9
	vfmadd213ps	{rn-sae}, %zmm6, %zmm1, %zmm4
	vfmadd213ps	{rn-sae}, %zmm7, %zmm3, %zmm9
	vfmadd213ps	{rn-sae}, %zmm7, %zmm1, %zmm4
	vfmadd213ps	{rn-sae}, %zmm8, %zmm3, %zmm9
	vfmadd213ps	{rn-sae}, %zmm8, %zmm1, %zmm4
	vmulps	{rn-sae}, %zmm3, %zmm9, %zmm3
	vmulps	{rn-sae}, %zmm1, %zmm4, %zmm1
	vmovups	__svml_hlog10_ha_data_internal(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vfmadd231ps	{rn-sae}, %zmm2, %zmm4, %zmm3
	vfmadd231ps	{rn-sae}, %zmm0, %zmm4, %zmm1
	vcvtps2phx	%zmm3, %ymm0
	vcvtps2phx	%zmm1, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_log10s32_ha, .Lfunc_end0-__svml_log10s32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hlog10_ha_data_internal:
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1050288282                      # 0x3e9a209a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	1031121002                      # 0x3d75a86a
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	3185928408                      # 0xbde568d8
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	1041664163                      # 0x3e1688a3
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	3193854377                      # 0xbe5e59a9
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.long	1054759150                      # 0x3ede58ee
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	15360                           # 0x3c00
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.short	31                              # 0x1f
	.zero	64
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
	.long	127                             # 0x7f
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
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	1045509755                      # 0x3e51367b
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	3200242518                      # 0xbebfd356
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	1056565587                      # 0x3ef9e953
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	3208159048                      # 0xbf389f48
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
	.long	1069066212                      # 0x3fb8a7e4
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
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.short	64512                           # 0xfc00
	.size	__svml_hlog10_ha_data_internal, 1216



	.section	.note.gnu.property,"a",@note
	.p2align	3
	.long	4
	.long	16
	.long	5
	.byte	0x47, 0x4e, 0x55, 0
	.long	0xc0000002
	.long	4
	.long	0x00000003
	.long	0
	.section	.note.GNU-stack,"",@progbits
