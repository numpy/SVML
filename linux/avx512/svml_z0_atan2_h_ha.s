/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_atan2s32_ha           # -- Begin function __svml_atan2s32_ha
	.p2align	4
	.type	__svml_atan2s32_ha,@function
__svml_atan2s32_ha:                  # 
	.cfi_startproc
	endbr64
# %bb.0:
	vmovups	__svml_hatan2_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm2, %zmm4
	vandps	%zmm0, %zmm2, %zmm3
	vxorps	%zmm1, %zmm4, %zmm2
	vcmpltph	%zmm3, %zmm4, %k1
	vmaxph	{sae}, %zmm3, %zmm4, %zmm5
	vcvtph2psx	%ymm2, %zmm6
	vextractf64x4	$1, %zmm2, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vminph	{sae}, %zmm4, %zmm3, %zmm4
	vcvtph2psx	%ymm5, %zmm7
	vextractf64x4	$1, %zmm5, %ymm8
	vcvtph2psx	%ymm8, %zmm8
	vfpclassph	$159, %zmm5, %k0        # k0 = isQuietNaN(zmm5) | isPositiveZero(zmm5) | isNegativeZero(zmm5) | isPositiveInfinity(zmm5) | isNegativeInfinity(zmm5) | isSignalingNaN(zmm5)
	vcvtph2psx	%ymm4, %zmm5
	vdivps	{rn-sae}, %zmm7, %zmm5, %zmm5
	vextractf64x4	$1, %zmm4, %ymm4
	vcvtph2psx	%ymm4, %zmm4
	vdivps	{rn-sae}, %zmm8, %zmm4, %zmm4
	kshiftrd	$16, %k1, %k2
	vmovdqu64	__svml_hatan2_ha_data_internal+64(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vpsrad	$31, %zmm6, %zmm8
	vpandd	%zmm7, %zmm8, %zmm8
	vpsrad	$31, %zmm2, %zmm9
	vpandd	%zmm7, %zmm9, %zmm7
	vmovups	__svml_hatan2_ha_data_internal+128(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm9, %zmm8 {%k1}
	vmovaps	%zmm9, %zmm7 {%k2}
	vmovups	__svml_hatan2_ha_data_internal+192(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan2_ha_data_internal+256(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan2_ha_data_internal+320(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan2_ha_data_internal+384(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan2_ha_data_internal+448(%rip), %zmm13 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hatan2_ha_data_internal+512(%rip), %zmm14 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm5, %zmm15
	vfmadd213ps	{rn-sae}, %zmm11, %zmm10, %zmm15
	vfmadd213ps	{rn-sae}, %zmm11, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm12, %zmm5, %zmm15
	vfmadd213ps	{rn-sae}, %zmm12, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm13, %zmm5, %zmm15
	vfmadd213ps	{rn-sae}, %zmm13, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm14, %zmm5, %zmm15
	vfmadd213ps	{rn-sae}, %zmm14, %zmm4, %zmm10
	vxorps	%zmm9, %zmm15, %zmm15 {%k1}
	vxorps	%zmm6, %zmm15, %zmm6
	vxorps	%zmm9, %zmm10, %zmm10 {%k2}
	vxorps	%zmm2, %zmm10, %zmm2
	vfmadd213ps	{rn-sae}, %zmm8, %zmm5, %zmm6
	vcvtps2phx	%zmm6, %ymm5
	vfmadd213ps	{rn-sae}, %zmm7, %zmm4, %zmm2
	vcvtps2phx	%zmm2, %ymm2
	vinserti64x4	$1, %ymm2, %zmm5, %zmm2
	vpternlogq	$150, %zmm3, %zmm0, %zmm2 # zmm2 = zmm2 ^ zmm0 ^ zmm3
	kortestd	%k0, %k0
	jne	.LBB0_1
# %bb.2:
	vmovdqa64	%zmm2, %zmm0
	retq
.LBB0_1:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	andq	$-64, %rsp
	subq	$1280, %rsp                     # imm = 0x500
	kmovq	%k7, -24(%rbp)                  # 8-byte Spill
	kmovq	%k6, -32(%rbp)                  # 8-byte Spill
	kmovq	%k5, -40(%rbp)                  # 8-byte Spill
	kmovq	%k4, -48(%rbp)                  # 8-byte Spill
	vmovups	%zmm31, -112(%rbp)              # 64-byte Spill
	vmovups	%zmm30, -176(%rbp)              # 64-byte Spill
	vmovups	%zmm29, -240(%rbp)              # 64-byte Spill
	vmovups	%zmm28, -304(%rbp)              # 64-byte Spill
	vmovups	%zmm27, -368(%rbp)              # 64-byte Spill
	vmovups	%zmm26, -432(%rbp)              # 64-byte Spill
	vmovups	%zmm25, -496(%rbp)              # 64-byte Spill
	vmovups	%zmm24, -560(%rbp)              # 64-byte Spill
	vmovups	%zmm23, -624(%rbp)              # 64-byte Spill
	vmovups	%zmm22, -688(%rbp)              # 64-byte Spill
	vmovups	%zmm21, -752(%rbp)              # 64-byte Spill
	vmovups	%zmm20, -816(%rbp)              # 64-byte Spill
	vmovups	%zmm19, -880(%rbp)              # 64-byte Spill
	vmovups	%zmm18, -944(%rbp)              # 64-byte Spill
	vmovups	%zmm17, -1008(%rbp)             # 64-byte Spill
	vmovups	%zmm16, -1072(%rbp)             # 64-byte Spill
	kmovd	%k0, %ecx
	vmovups	%zmm0, 128(%rsp)                # AlignMOV convert to UnAlignMOV 
	vmovups	%zmm1, 64(%rsp)                 # AlignMOV convert to UnAlignMOV 
	vmovdqu64	%zmm2, (%rsp)           # AlignMOV convert to UnAlignMOV 
	leaq	128(%rsp), %rdi
	leaq	64(%rsp), %rsi
	movq	%rsp, %rdx
	vzeroupper
	callq	*__svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper@GOTPCREL(%rip)
	vmovups	(%rsp), %zmm2                   # AlignMOV convert to UnAlignMOV 
	vmovups	-1072(%rbp), %zmm16             # 64-byte Reload
	vmovups	-1008(%rbp), %zmm17             # 64-byte Reload
	vmovups	-944(%rbp), %zmm18              # 64-byte Reload
	vmovups	-880(%rbp), %zmm19              # 64-byte Reload
	vmovups	-816(%rbp), %zmm20              # 64-byte Reload
	vmovups	-752(%rbp), %zmm21              # 64-byte Reload
	vmovups	-688(%rbp), %zmm22              # 64-byte Reload
	vmovups	-624(%rbp), %zmm23              # 64-byte Reload
	vmovups	-560(%rbp), %zmm24              # 64-byte Reload
	vmovups	-496(%rbp), %zmm25              # 64-byte Reload
	vmovups	-432(%rbp), %zmm26              # 64-byte Reload
	vmovups	-368(%rbp), %zmm27              # 64-byte Reload
	vmovups	-304(%rbp), %zmm28              # 64-byte Reload
	vmovups	-240(%rbp), %zmm29              # 64-byte Reload
	vmovups	-176(%rbp), %zmm30              # 64-byte Reload
	vmovups	-112(%rbp), %zmm31              # 64-byte Reload
	kmovq	-48(%rbp), %k4                  # 8-byte Reload
	kmovq	-40(%rbp), %k5                  # 8-byte Reload
	kmovq	-32(%rbp), %k6                  # 8-byte Reload
	kmovq	-24(%rbp), %k7                  # 8-byte Reload
	leaq	-16(%rbp), %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	vmovaps	%zmm2, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_atan2s32_ha, .Lfunc_end0-__svml_atan2s32_ha
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper
	.type	__svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper,@function
__svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper: # 
	.cfi_startproc
	endbr64
# %bb.0:
	subq	$184, %rsp
	vmovups	%xmm15, 160(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm14, 144(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm13, 128(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm12, 112(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm11, 96(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm10, 80(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm9, 64(%rsp)                 # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm8, 48(%rsp)                 # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	xorl	%eax, %eax
	.p2align	4
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	btl	%eax, %ecx
	jb	.LBB1_2
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	incq	%rax
	addq	$2, %rdx
	addq	$2, %rsi
	addq	$2, %rdi
	cmpq	$32, %rax
	jne	.LBB1_1
	jmp	.LBB1_4
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	movq	32(%rsp), %rdi                  # 8-byte Reload
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	callq	__svml_hatan2_ha_cout_rare_internal
	movq	40(%rsp), %rax                  # 8-byte Reload
	movq	32(%rsp), %rdi                  # 8-byte Reload
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movl	12(%rsp), %ecx                  # 4-byte Reload
	jmp	.LBB1_3
.LBB1_4:
	vmovups	48(%rsp), %xmm8                 # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	64(%rsp), %xmm9                 # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	80(%rsp), %xmm10                # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	96(%rsp), %xmm11                # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	112(%rsp), %xmm12               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	128(%rsp), %xmm13               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	144(%rsp), %xmm14               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	160(%rsp), %xmm15               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	addq	$184, %rsp
	retq
.Lfunc_end1:
	.size	__svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper, .Lfunc_end1-__svml_z0__svml_hatan2_ha_cout_rare_internal_wrapper
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hatan2_ha_cout_rare_internal

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hatan2_ha_data_internal:
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
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
	.long	1078530011                      # 0x40490fdb
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
	.size	__svml_hatan2_ha_data_internal, 576



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
