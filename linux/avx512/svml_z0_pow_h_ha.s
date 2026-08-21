/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_pows32_ha             # -- Begin function __svml_pows32_ha
	.p2align	4
	.type	__svml_pows32_ha,@function
__svml_pows32_ha:                    # 
	.cfi_startproc
# %bb.0:
	vfpclassph	$223, %zmm0, %k0        # k0 = isQuietNaN(zmm0) | isPositiveZero(zmm0) | isNegativeZero(zmm0) | isPositiveInfinity(zmm0) | isNegativeInfinity(zmm0) | isNegative(zmm0) | isSignalingNaN(zmm0)
	vcvtph2psx	%ymm0, %zmm2
	vfpclassph	$153, %zmm1, %k1        # k1 = isQuietNaN(zmm1) | isPositiveInfinity(zmm1) | isNegativeInfinity(zmm1) | isSignalingNaN(zmm1)
	vextractf64x4	$1, %zmm0, %ymm3
	vcvtph2psx	%ymm3, %zmm3
	vcvtph2psx	%ymm1, %zmm4
	vextractf64x4	$1, %zmm1, %ymm5
	vcvtph2psx	%ymm5, %zmm5
	vgetmantps	$11, {sae}, %zmm2, %zmm6
	vgetmantps	$11, {sae}, %zmm3, %zmm7
	vgetexpps	{sae}, %zmm2, %zmm2
	vgetexpps	{sae}, %zmm3, %zmm3
	vmovups	__svml_hpow_ha_data_internal(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vsubps	{rn-sae}, %zmm8, %zmm6, %zmm9
	vsubps	{rn-sae}, %zmm8, %zmm7, %zmm8
	vgetexpps	{sae}, %zmm6, %zmm6
	vsubps	{rn-sae}, %zmm6, %zmm2, %zmm2
	vgetexpps	{sae}, %zmm7, %zmm6
	vsubps	{rn-sae}, %zmm6, %zmm3, %zmm3
	vmovups	__svml_hpow_ha_data_internal+64(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+128(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+192(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+256(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+320(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+384(%rip), %zmm13 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm9, %zmm14
	vfmadd213ps	{rn-sae}, %zmm7, %zmm6, %zmm14
	vfmadd213ps	{rn-sae}, %zmm7, %zmm8, %zmm6
	vfmadd213ps	{rn-sae}, %zmm10, %zmm9, %zmm14
	vfmadd213ps	{rn-sae}, %zmm10, %zmm8, %zmm6
	vfmadd213ps	{rn-sae}, %zmm11, %zmm9, %zmm14
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm6
	vfmadd213ps	{rn-sae}, %zmm12, %zmm9, %zmm14
	vfmadd213ps	{rn-sae}, %zmm12, %zmm8, %zmm6
	vfmadd213ps	{rn-sae}, %zmm13, %zmm9, %zmm14
	vfmadd213ps	{rn-sae}, %zmm13, %zmm8, %zmm6
	vfmadd213ps	{rn-sae}, %zmm2, %zmm9, %zmm14
	vmulps	{rn-sae}, %zmm14, %zmm4, %zmm2
	vfmadd213ps	{rn-sae}, %zmm3, %zmm8, %zmm6
	vmulps	{rn-sae}, %zmm6, %zmm5, %zmm3
	vreduceps	$9, {sae}, %zmm2, %zmm4
	vreduceps	$9, {sae}, %zmm3, %zmm5
	vmovups	__svml_hpow_ha_data_internal+448(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+512(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+576(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hpow_ha_data_internal+640(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm6, %zmm10
	vfmadd213ps	{rn-sae}, %zmm7, %zmm5, %zmm6
	vfmadd213ps	{rn-sae}, %zmm8, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm8, %zmm5, %zmm6
	vfmadd213ps	{rn-sae}, %zmm9, %zmm4, %zmm10
	vfmadd213ps	{rn-sae}, %zmm9, %zmm5, %zmm6
	vscalefps	{rn-sae}, %zmm2, %zmm10, %zmm2
	vscalefps	{rn-sae}, %zmm3, %zmm6, %zmm3
	vcvtps2phx	%zmm2, %ymm2
	vcvtps2phx	%zmm3, %ymm3
	vinsertf64x4	$1, %ymm3, %zmm2, %zmm2
	kortestd	%k1, %k0
	jne	.LBB0_1
# %bb.2:
	vmovaps	%zmm2, %zmm0
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
	kord	%k1, %k0, %k0
	kmovd	%k0, %ecx
	vmovups	%zmm0, 128(%rsp)                # AlignMOV convert to UnAlignMOV 
	vmovups	%zmm1, 64(%rsp)                 # AlignMOV convert to UnAlignMOV 
	vmovups	%zmm2, (%rsp)                   # AlignMOV convert to UnAlignMOV 
	leaq	128(%rsp), %rdi
	leaq	64(%rsp), %rsi
	movq	%rsp, %rdx
	vzeroupper
	callq	*__svml_z0__svml_hpow_ha_cout_rare_internal_wrapper@GOTPCREL(%rip)
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
	.size	__svml_pows32_ha, .Lfunc_end0-__svml_pows32_ha
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __svml_z0__svml_hpow_ha_cout_rare_internal_wrapper
	.type	__svml_z0__svml_hpow_ha_cout_rare_internal_wrapper,@function
__svml_z0__svml_hpow_ha_cout_rare_internal_wrapper: # 
	.cfi_startproc
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
	callq	__svml_hpow_ha_cout_rare_internal
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
	.size	__svml_z0__svml_hpow_ha_cout_rare_internal_wrapper, .Lfunc_end1-__svml_z0__svml_hpow_ha_cout_rare_internal_wrapper
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hpow_ha_cout_rare_internal

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hpow_ha_data_internal:
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
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	3189767340                      # 0xbe1ffcac
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	1050174652                      # 0x3e9864bc
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	3200067665                      # 0xbebd2851
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	1056329159                      # 0x3ef64dc7
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	3208158829                      # 0xbf389e6d
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
	.long	1069066796                      # 0x3fb8aa2c
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
	.size	__svml_hpow_ha_data_internal, 704



	.section	.note.GNU-stack,"",@progbits
