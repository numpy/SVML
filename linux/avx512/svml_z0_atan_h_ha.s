/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_atans32_ha            # -- Begin function __svml_atans32_ha
	.p2align	4
	.type	__svml_atans32_ha,@function
__svml_atans32_ha:                   # 
	.cfi_startproc
	endbr64
# %bb.0:
	vpandq	__svml_hatan_ha_data_internal(%rip), %zmm0, %zmm1
	vcvtph2psx	%ymm1, %zmm2
	vextracti64x4	$1, %zmm1, %ymm3
	vcvtph2psx	%ymm3, %zmm3
	vmovups	__svml_hatan_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vcmpnleps	%zmm4, %zmm2, %k2
	vcmpnleps	%zmm4, %zmm3, %k1
	vmovups	__svml_hatan_ha_data_internal+128(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm2, %zmm5
	vrcp14ps	%zmm2, %zmm5 {%k2}
	vmovups	__svml_hatan_ha_data_internal+192(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm3, %zmm7
	vrcp14ps	%zmm3, %zmm7 {%k1}
	vblendmps	%zmm4, %zmm6, %zmm8 {%k2}
	vmovaps	%zmm4, %zmm6 {%k1}
	vmovups	__svml_hatan_ha_data_internal+320(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan_ha_data_internal+384(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan_ha_data_internal+448(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan_ha_data_internal+512(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan_ha_data_internal+576(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm5, %zmm13
	vfmadd213ps	{rn-sae}, %zmm9, %zmm4, %zmm13
	vfmadd213ps	{rn-sae}, %zmm9, %zmm7, %zmm4
	vfmadd213ps	{rn-sae}, %zmm10, %zmm5, %zmm13
	vfmadd213ps	{rn-sae}, %zmm10, %zmm7, %zmm4
	vfmadd213ps	{rn-sae}, %zmm11, %zmm5, %zmm13
	vfmadd213ps	{rn-sae}, %zmm11, %zmm7, %zmm4
	vfmadd213ps	{rn-sae}, %zmm12, %zmm5, %zmm13
	vfmadd213ps	{rn-sae}, %zmm12, %zmm7, %zmm4
	vmovups	__svml_hatan_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vxorps	%zmm5, %zmm9, %zmm2 {%k2}
	vfmadd213ps	{rn-sae}, %zmm8, %zmm13, %zmm2
	vxorps	%zmm7, %zmm9, %zmm3 {%k1}
	vfmadd213ps	{rn-sae}, %zmm6, %zmm4, %zmm3
	vcvtps2phx	%zmm2, %ymm2
	vcvtps2phx	%zmm3, %ymm3
	vinserti64x4	$1, %ymm3, %zmm2, %zmm2
	vpternlogq	$150, %zmm2, %zmm1, %zmm0 # zmm0 = zmm0 ^ zmm1 ^ zmm2
	retq
.Lfunc_end0:
	.size	__svml_atans32_ha, .Lfunc_end0-__svml_atans32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hatan_ha_data_internal:
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
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.long	1070141403                      # 0x3fc90fdb
	.zero	64
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
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	3164931407                      # 0xbca5054f
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	1044973981                      # 0x3e49099d
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	3201019747                      # 0xbecbaf63
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1005538898                      # 0x3bef4e52
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.long	1065351001                      # 0x3f7ff759
	.size	__svml_hatan_ha_data_internal, 640



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
