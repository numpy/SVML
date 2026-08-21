/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_exps32_ha             # -- Begin function __svml_exps32_ha
	.p2align	4
	.type	__svml_exps32_ha,@function
__svml_exps32_ha:                    # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vmovups	__svml_hexp_ha_data_internal+256(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp_ha_data_internal+320(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm5
	vfmadd213ps	{rz-sae}, %zmm4, %zmm3, %zmm5
	vfmadd213ps	{rz-sae}, %zmm4, %zmm2, %zmm3
	vmovups	__svml_hexp_ha_data_internal+896(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vcmpneqps	%zmm6, %zmm1, %k2
	vcmpneqps	%zmm6, %zmm2, %k1
	vsubps	{rn-sae}, %zmm4, %zmm5, %zmm6
	vsubps	{rn-sae}, %zmm4, %zmm3, %zmm4
	vmovups	__svml_hexp_ha_data_internal(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp_ha_data_internal+64(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm7, %zmm9
	vpermt2ps	%zmm8, %zmm5, %zmm9
	vpermt2ps	%zmm8, %zmm3, %zmm7
	vpsrld	$5, %zmm5, %zmm5
	vpsrld	$5, %zmm3, %zmm3
	vmovups	__svml_hexp_ha_data_internal+128(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp_ha_data_internal+192(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vpermi2ps	%zmm10, %zmm8, %zmm5
	vpermi2ps	%zmm10, %zmm8, %zmm3
	vmovups	__svml_hexp_ha_data_internal+384(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp_ha_data_internal+448(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm8, %zmm11
	vfnmadd213ps	{rn-sae}, %zmm1, %zmm6, %zmm11
	vfnmadd213ps	{rn-sae}, %zmm2, %zmm4, %zmm8
	vfnmadd231ps	{rn-sae}, %zmm10, %zmm6, %zmm11
	vfnmadd231ps	{rn-sae}, %zmm10, %zmm4, %zmm8
	vmovups	__svml_hexp_ha_data_internal+512(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vrangeps	$2, {sae}, %zmm10, %zmm11, %zmm11
	vrangeps	$2, {sae}, %zmm10, %zmm8, %zmm8
	vmulps	{rn-sae}, %zmm9, %zmm5, %zmm5 {%k2}
	vmulps	{rn-sae}, %zmm7, %zmm3, %zmm3 {%k1}
	vmovups	__svml_hexp_ha_data_internal+576(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hexp_ha_data_internal+640(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm2, %zmm7, %zmm2
	vandps	%zmm1, %zmm7, %zmm1
	vcmpleps	%zmm1, %zmm9, %k0
	vcmpleps	%zmm2, %zmm9, %k1
	vfmadd231ps	{rn-sae}, %zmm5, %zmm11, %zmm5
	vfmadd231ps	{rn-sae}, %zmm3, %zmm8, %zmm3
	vscalefps	{rn-sae}, %zmm6, %zmm5, %zmm1
	vscalefps	{rn-sae}, %zmm4, %zmm3, %zmm2
	vcvtps2phx	%zmm1, %ymm1
	vcvtps2phx	%zmm2, %ymm2
	vinsertf64x4	$1, %ymm2, %zmm1, %zmm1
	kortestw	%k1, %k0
	jne	.LBB0_1
# %bb.2:
	vmovaps	%zmm1, %zmm0
	retq
.LBB0_1:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	andq	$-64, %rsp
	subq	$1216, %rsp                     # imm = 0x4C0
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
	kunpckwd	%k0, %k1, %k0
	kmovd	%k0, %edx
	vmovups	%zmm0, 64(%rsp)                 # AlignMOV convert to UnAlignMOV 
	vmovups	%zmm1, (%rsp)                   # AlignMOV convert to UnAlignMOV 
	leaq	64(%rsp), %rdi
	movq	%rsp, %rsi
	vzeroupper
	callq	*__svml_z0__svml_hexp_ha_cout_rare_internal_wrapper@GOTPCREL(%rip)
	vmovups	(%rsp), %zmm1                   # AlignMOV convert to UnAlignMOV 
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
	vmovaps	%zmm1, %zmm0
	retq
.Lfunc_end0:
	.size	__svml_exps32_ha, .Lfunc_end0-__svml_exps32_ha
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __svml_z0__svml_hexp_ha_cout_rare_internal_wrapper
	.type	__svml_z0__svml_hexp_ha_cout_rare_internal_wrapper,@function
__svml_z0__svml_hexp_ha_cout_rare_internal_wrapper: # 
	.cfi_startproc
# %bb.0:
	subq	$168, %rsp
	vmovups	%xmm15, 144(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm14, 128(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm13, 112(%rsp)               # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm12, 96(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm11, 80(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm10, 64(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm9, 48(%rsp)                 # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	%xmm8, 32(%rsp)                 # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	xorl	%eax, %eax
	.p2align	4
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	btl	%eax, %edx
	jb	.LBB1_2
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	incq	%rax
	addq	$2, %rsi
	addq	$2, %rdi
	cmpq	$32, %rax
	jne	.LBB1_1
	jmp	.LBB1_4
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	callq	__svml_hexp_ha_cout_rare_internal
	movq	24(%rsp), %rax                  # 8-byte Reload
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movl	4(%rsp), %edx                   # 4-byte Reload
	jmp	.LBB1_3
.LBB1_4:
	vmovups	32(%rsp), %xmm8                 # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	48(%rsp), %xmm9                 # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	64(%rsp), %xmm10                # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	80(%rsp), %xmm11                # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	96(%rsp), %xmm12                # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	112(%rsp), %xmm13               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	128(%rsp), %xmm14               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	vmovups	144(%rsp), %xmm15               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	addq	$168, %rsp
	retq
.Lfunc_end1:
	.size	__svml_z0__svml_hexp_ha_cout_rare_internal_wrapper, .Lfunc_end1-__svml_z0__svml_hexp_ha_cout_rare_internal_wrapper
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hexp_ha_cout_rare_internal

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hexp_ha_data_internal:
	.long	1065353217                      # 0x3f800001
	.long	1065358897                      # 0x3f801631
	.long	1065364581                      # 0x3f802c65
	.long	1065370269                      # 0x3f80429d
	.long	1065375961                      # 0x3f8058d9
	.long	1065381656                      # 0x3f806f18
	.long	1065387356                      # 0x3f80855c
	.long	1065393059                      # 0x3f809ba3
	.long	1065398766                      # 0x3f80b1ee
	.long	1065404477                      # 0x3f80c83d
	.long	1065410192                      # 0x3f80de90
	.long	1065415911                      # 0x3f80f4e7
	.long	1065421634                      # 0x3f810b42
	.long	1065427360                      # 0x3f8121a0
	.long	1065433091                      # 0x3f813803
	.long	1065438825                      # 0x3f814e69
	.long	1065444563                      # 0x3f8164d3
	.long	1065450305                      # 0x3f817b41
	.long	1065456051                      # 0x3f8191b3
	.long	1065461801                      # 0x3f81a829
	.long	1065467554                      # 0x3f81bea2
	.long	1065473312                      # 0x3f81d520
	.long	1065479074                      # 0x3f81eba2
	.long	1065484839                      # 0x3f820227
	.long	1065490608                      # 0x3f8218b0
	.long	1065496381                      # 0x3f822f3d
	.long	1065502159                      # 0x3f8245cf
	.long	1065507940                      # 0x3f825c64
	.long	1065513725                      # 0x3f8272fd
	.long	1065519513                      # 0x3f828999
	.long	1065525306                      # 0x3f82a03a
	.long	1065531103                      # 0x3f82b6df
	.long	1065353216                      # 0x3f800000
	.long	1065536903                      # 0x3f82cd87
	.long	1065724611                      # 0x3f85aac3
	.long	1065916431                      # 0x3f88980f
	.long	1066112450                      # 0x3f8b95c2
	.long	1066312762                      # 0x3f8ea43a
	.long	1066517459                      # 0x3f91c3d3
	.long	1066726640                      # 0x3f94f4f0
	.long	1066940400                      # 0x3f9837f0
	.long	1067158842                      # 0x3f9b8d3a
	.long	1067382066                      # 0x3f9ef532
	.long	1067610179                      # 0x3fa27043
	.long	1067843287                      # 0x3fa5fed7
	.long	1068081499                      # 0x3fa9a15b
	.long	1068324927                      # 0x3fad583f
	.long	1068573686                      # 0x3fb123f6
	.long	1068827891                      # 0x3fb504f3
	.long	1069087663                      # 0x3fb8fbaf
	.long	1069353124                      # 0x3fbd08a4
	.long	1069624397                      # 0x3fc12c4d
	.long	1069901610                      # 0x3fc5672a
	.long	1070184894                      # 0x3fc9b9be
	.long	1070474380                      # 0x3fce248c
	.long	1070770206                      # 0x3fd2a81e
	.long	1071072509                      # 0x3fd744fd
	.long	1071381432                      # 0x3fdbfbb8
	.long	1071697119                      # 0x3fe0ccdf
	.long	1072019719                      # 0x3fe5b907
	.long	1072349383                      # 0x3feac0c7
	.long	1072686266                      # 0x3fefe4ba
	.long	1073030525                      # 0x3ff5257d
	.long	1073382323                      # 0x3ffa83b3
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1178599424                      # 0x46400000
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	1060205080                      # 0x3f317218
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	2969756424                      # 0xb102e308
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	1056964608                      # 0x3f000000
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	2147483647                      # 0x7fffffff
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	1118743631                      # 0x42aeac4f
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	796917760                       # 0x2f800000
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	124                             # 0x7c
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.long	3968                            # 0xf80
	.zero	64
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
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
	.long	849703008                       # 0x32a57060
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
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	52352                           # 0xcc80
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
	.short	18944                           # 0x4a00
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
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.short	15813                           # 0x3dc5
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
	.long	1069066811                      # 0x3fb8aa3b
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
	.size	__svml_hexp_ha_data_internal, 1920



	.section	.note.GNU-stack,"",@progbits
