/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_log2s32_ha            # -- Begin function __svml_log2s32_ha
	.p2align	4
	.type	__svml_log2s32_ha,@function
__svml_log2s32_ha:                   # 
	.cfi_startproc
	endbr64
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hlog2_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vgetmantps	$11, {sae}, %zmm1, %zmm3
	vgetmantps	$11, {sae}, %zmm0, %zmm4
	vgetexpps	{sae}, %zmm1, %zmm1
	vgetexpps	{sae}, %zmm0, %zmm0
	vsubps	{rn-sae}, %zmm2, %zmm3, %zmm5
	vsubps	{rn-sae}, %zmm2, %zmm4, %zmm2
	vgetexpps	{sae}, %zmm3, %zmm3
	vsubps	{rn-sae}, %zmm3, %zmm1, %zmm1
	vgetexpps	{sae}, %zmm4, %zmm3
	vsubps	{rn-sae}, %zmm3, %zmm0, %zmm0
	vmovups	__svml_hlog2_ha_data_internal+64(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog2_ha_data_internal+128(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog2_ha_data_internal+192(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog2_ha_data_internal+256(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hlog2_ha_data_internal+320(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm4, %zmm3, %zmm9
	vfmadd213ps	{rn-sae}, %zmm4, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm6, %zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm6, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm7, %zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm8, %zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm8, %zmm2, %zmm3
	vfmadd213ps	{rn-sae}, %zmm1, %zmm5, %zmm9
	vfmadd213ps	{rn-sae}, %zmm0, %zmm2, %zmm3
	vcvtps2phx	%zmm9, %ymm0
	vcvtps2phx	%zmm3, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_log2s32_ha, .Lfunc_end0-__svml_log2s32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hlog2_ha_data_internal:
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
	.size	__svml_hlog2_ha_data_internal, 1088



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
