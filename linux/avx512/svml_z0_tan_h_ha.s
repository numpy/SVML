/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_tans32_ha             # -- Begin function __svml_tans32_ha
	.p2align	4
	.type	__svml_tans32_ha,@function
__svml_tans32_ha:                    # 
	.cfi_startproc
	endbr64
# %bb.0:
	vpandq	__svml_htan_ha_data_internal(%rip), %zmm0, %zmm1
	vcvtph2psx	%ymm1, %zmm2
	vextracti64x4	$1, %zmm1, %ymm3
	vcvtph2psx	%ymm3, %zmm3
	vmovups	__svml_htan_ha_data_internal+128(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htan_ha_data_internal+64(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm6
	vfmadd213ps	{rn-sae}, %zmm5, %zmm2, %zmm6
	vfmadd213ps	{rn-sae}, %zmm5, %zmm3, %zmm4
	vsubps	{rn-sae}, %zmm5, %zmm6, %zmm7
	vsubps	{rn-sae}, %zmm5, %zmm4, %zmm5
	vmovups	__svml_htan_ha_data_internal+192(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htan_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vfmadd231ps	{rn-sae}, %zmm8, %zmm7, %zmm2
	vfmadd213ps	{rn-sae}, %zmm3, %zmm5, %zmm8
	vfmadd231ps	{rn-sae}, %zmm7, %zmm9, %zmm2
	vfmadd231ps	{rn-sae}, %zmm9, %zmm5, %zmm8
	vpslld	$31, %zmm6, %zmm3
	vpslld	$31, %zmm4, %zmm4
	vmulps	{rn-sae}, %zmm2, %zmm2, %zmm5
	vmulps	{rn-sae}, %zmm8, %zmm8, %zmm6
	vpxord	%zmm2, %zmm3, %zmm2
	vpxord	%zmm8, %zmm4, %zmm7
	vmovups	__svml_htan_ha_data_internal+320(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htan_ha_data_internal+384(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htan_ha_data_internal+448(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_htan_ha_data_internal+512(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm8, %zmm12
	vfmadd213ps	{rn-sae}, %zmm9, %zmm5, %zmm12
	vfmadd213ps	{rn-sae}, %zmm9, %zmm6, %zmm8
	vfmadd213ps	{rn-sae}, %zmm10, %zmm5, %zmm12
	vfmadd213ps	{rn-sae}, %zmm10, %zmm6, %zmm8
	vfmadd213ps	{rn-sae}, %zmm11, %zmm5, %zmm12
	vmulps	{rn-sae}, %zmm2, %zmm12, %zmm2
	vfmadd213ps	{rn-sae}, %zmm11, %zmm6, %zmm8
	vmulps	{rn-sae}, %zmm7, %zmm8, %zmm5
	vptestmd	%zmm3, %zmm3, %k1
	vptestmd	%zmm4, %zmm4, %k2
	vrcp14ps	%zmm2, %zmm2 {%k1}
	vrcp14ps	%zmm5, %zmm5 {%k2}
	vcvtps2phx	%zmm2, %ymm2
	vcvtps2phx	%zmm5, %ymm3
	vinserti64x4	$1, %ymm3, %zmm2, %zmm2
	vpternlogq	$150, %zmm2, %zmm1, %zmm0 # zmm0 = zmm0 ^ zmm1 ^ zmm2
	retq
.Lfunc_end0:
	.size	__svml_tans32_ha, .Lfunc_end0-__svml_tans32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_htan_ha_data_internal:
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
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1258291200                      # 0x4b000000
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	1059256707                      # 0x3f22f983
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	3217625051                      # 0xbfc90fdb
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	859553070                       # 0x333bbd2e
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1036044169                      # 0x3dc0c789
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1038976194                      # 0x3ded84c2
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1051447685                      # 0x3eabd185
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.long	1065352475                      # 0x3f7ffd1b
	.size	__svml_htan_ha_data_internal, 576



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
