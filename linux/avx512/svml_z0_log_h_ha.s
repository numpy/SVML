/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_logs32_ha             # -- Begin function __svml_logs32_ha
	.p2align	4
	.type	__svml_logs32_ha,@function
__svml_logs32_ha:                    # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vgetmantps	$11, {sae}, %zmm1, %zmm3
	vgetmantps	$11, {sae}, %zmm2, %zmm4
	vgetexpps	{sae}, %zmm1, %zmm5
	vgetexpps	{sae}, %zmm2, %zmm6
	vpsrld	$19, %zmm3, %zmm7
	vpsrld	$19, %zmm4, %zmm8
	vmovups	__svml_hlog_ha_data_internal(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vsubps	{rn-sae}, %zmm9, %zmm3, %zmm10
	vsubps	{rn-sae}, %zmm9, %zmm4, %zmm9
	vmovdqu64	__svml_hlog_ha_data_internal+64(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vpermd	%zmm11, %zmm7, %zmm12
	vpermd	%zmm11, %zmm8, %zmm11
	vmovdqu64	__svml_hlog_ha_data_internal+128(%rip), %zmm13 # AlignMOV convert to UnAlignMOV 
	vpermd	%zmm13, %zmm7, %zmm14
	vpermd	%zmm13, %zmm8, %zmm13
	vfmadd231ps	{rn-sae}, %zmm12, %zmm10, %zmm14
	vfmadd231ps	{rn-sae}, %zmm11, %zmm9, %zmm13
	vgetexpps	{sae}, %zmm3, %zmm3
	vsubps	{rn-sae}, %zmm3, %zmm5, %zmm3
	vgetexpps	{sae}, %zmm4, %zmm4
	vsubps	{rn-sae}, %zmm4, %zmm6, %zmm4
	vmovdqu64	__svml_hlog_ha_data_internal+192(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vpxor	%xmm6, %xmm6, %xmm6
	vpermd	%zmm5, %zmm7, %zmm6
	vpermd	%zmm5, %zmm8, %zmm5
	vfmadd231ps	{rn-sae}, %zmm14, %zmm10, %zmm6
	vfmadd231ps	{rn-sae}, %zmm13, %zmm9, %zmm5
	vmovdqu64	__svml_hlog_ha_data_internal+256(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vpermd	%zmm11, %zmm7, %zmm7
	vpermd	%zmm11, %zmm8, %zmm8
	vfmadd231ps	{rn-sae}, %zmm6, %zmm10, %zmm7
	vfmadd231ps	{rn-sae}, %zmm5, %zmm9, %zmm8
	vmovups	__svml_hlog_ha_data_internal+320(%rip), %zmm5 # AlignMOV convert to UnAlignMOV 
	vmulps	{rn-sae}, %zmm5, %zmm3, %zmm3
	vmulps	{rn-sae}, %zmm5, %zmm4, %zmm4
	vfpclassps	$94, %zmm1, %k0         # k0 = isPositiveZero(zmm1) | isNegativeZero(zmm1) | isPositiveInfinity(zmm1) | isNegativeInfinity(zmm1) | isNegative(zmm1)
	vfpclassps	$94, %zmm2, %k1         # k1 = isPositiveZero(zmm2) | isNegativeZero(zmm2) | isPositiveInfinity(zmm2) | isNegativeInfinity(zmm2) | isNegative(zmm2)
	vfmadd231ps	{rn-sae}, %zmm7, %zmm10, %zmm3
	vfmadd231ps	{rn-sae}, %zmm8, %zmm9, %zmm4
	vcvtps2phx	%zmm3, %ymm1
	vcvtps2phx	%zmm4, %ymm2
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
	callq	*__svml_z0__svml_hlog_ha_cout_rare_internal_wrapper@GOTPCREL(%rip)
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
	.size	__svml_logs32_ha, .Lfunc_end0-__svml_logs32_ha
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __svml_z0__svml_hlog_ha_cout_rare_internal_wrapper
	.type	__svml_z0__svml_hlog_ha_cout_rare_internal_wrapper,@function
__svml_z0__svml_hlog_ha_cout_rare_internal_wrapper: # 
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
	callq	__svml_hlog_ha_cout_rare_internal
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
	.size	__svml_z0__svml_hlog_ha_cout_rare_internal_wrapper, .Lfunc_end1-__svml_z0__svml_hlog_ha_cout_rare_internal_wrapper
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hlog_ha_cout_rare_internal

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hlog_ha_data_internal:
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
	.long	3194499567                      # 0xbe6831ef
	.long	3191881870                      # 0xbe40408e
	.long	3189820965                      # 0xbe20ce25
	.long	3188177733                      # 0xbe07bb45
	.long	3186034033                      # 0xbde70571
	.long	3183874545                      # 0xbdc611f1
	.long	3182098566                      # 0xbdaaf886
	.long	3180625528                      # 0xbd947e78
	.long	3205885581                      # 0xbf15ee8d
	.long	3204713431                      # 0xbf040bd7
	.long	3202986354                      # 0xbee9b172
	.long	3201283063                      # 0xbecfb3f7
	.long	3199818667                      # 0xbeb95bab
	.long	3198553107                      # 0xbea60c13
	.long	3197454075                      # 0xbe9546fb
	.long	3196495328                      # 0xbe86a5e0
	.long	1051342523                      # 0x3eaa36bb
	.long	1051102009                      # 0x3ea68b39
	.long	1050719235                      # 0x3ea0b403
	.long	1050259833                      # 0x3e99b179
	.long	1049764999                      # 0x3e922487
	.long	1049260512                      # 0x3e8a71e0
	.long	1048762310                      # 0x3e82d7c6
	.long	1047983990                      # 0x3e76f776
	.long	1044808958                      # 0x3e4684fe
	.long	1047891773                      # 0x3e758f3d
	.long	1049356949                      # 0x3e8bea95
	.long	1050157361                      # 0x3e982131
	.long	1050708164                      # 0x3ea088c4
	.long	1051065485                      # 0x3ea5fc8d
	.long	1051272715                      # 0x3ea9260b
	.long	1051363578                      # 0x3eaa88fa
	.long	3204447891                      # 0xbefffe93
	.long	3204432523                      # 0xbeffc28b
	.long	3204384627                      # 0xbeff0773
	.long	3204298603                      # 0xbefdb76b
	.long	3204175099                      # 0xbefbd4fb
	.long	3204017696                      # 0xbef96e20
	.long	3203831137                      # 0xbef69561
	.long	3203620393                      # 0xbef35e29
	.long	3204845352                      # 0xbf060f28
	.long	3204676294                      # 0xbf037ac6
	.long	3204570658                      # 0xbf01de22
	.long	3204507866                      # 0xbf00e8da
	.long	3204473248                      # 0xbf0061a0
	.long	3204456356                      # 0xbf001fa4
	.long	3204449777                      # 0xbf0005f1
	.long	3204448283                      # 0xbf00001b
	.long	1065353216                      # 0x3f800000
	.long	1065353045                      # 0x3f7fff55
	.long	1065352036                      # 0x3f7ffb64
	.long	1065349339                      # 0x3f7ff0db
	.long	1065344188                      # 0x3f7fdcbc
	.long	1065335989                      # 0x3f7fbcb5
	.long	1065324332                      # 0x3f7f8f2c
	.long	1065308972                      # 0x3f7f532c
	.long	1065328777                      # 0x3f7fa089
	.long	1065341148                      # 0x3f7fd0dc
	.long	1065347780                      # 0x3f7feac4
	.long	1065351069                      # 0x3f7ff79d
	.long	1065352524                      # 0x3f7ffd4c
	.long	1065353058                      # 0x3f7fff62
	.long	1065353199                      # 0x3f7fffef
	.long	1065353216                      # 0x3f800000
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
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	8388608                         # 0x800000
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
	.long	2139095039                      # 0x7f7fffff
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
	.size	__svml_hlog_ha_data_internal, 1280


