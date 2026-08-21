/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_sins32_ha             # -- Begin function __svml_sins32_ha
	.p2align	4
	.type	__svml_sins32_ha,@function
__svml_sins32_ha:                    # 
	.cfi_startproc
# %bb.0:
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm2
	vcvtph2psx	%ymm2, %zmm2
	vmovups	__svml_hsin_ha_data_internal+4096(%rip), %zmm3 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm3, %zmm4
	vandps	%zmm2, %zmm3, %zmm5
	vmovups	__svml_hsin_ha_data_internal+5248(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsin_ha_data_internal+5312(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm6, %zmm8
	vfmadd213ps	{rn-sae}, %zmm7, %zmm4, %zmm8
	vfmadd213ps	{rn-sae}, %zmm7, %zmm5, %zmm6
	vpslld	$31, %zmm8, %zmm9
	vpslld	$31, %zmm6, %zmm10
	vsubps	{rn-sae}, %zmm7, %zmm8, %zmm8
	vsubps	{rn-sae}, %zmm7, %zmm6, %zmm6
	vmovups	__svml_hsin_ha_data_internal+4800(%rip), %zmm7 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm7, %zmm11
	vfnmadd213ps	{rn-sae}, %zmm4, %zmm8, %zmm11
	vfnmadd213ps	{rn-sae}, %zmm5, %zmm6, %zmm7
	vmovups	__svml_hsin_ha_data_internal+4864(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm12, %zmm8, %zmm11
	vfnmadd231ps	{rn-sae}, %zmm12, %zmm6, %zmm7
	vmovups	__svml_hsin_ha_data_internal+4928(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vfnmadd231ps	{rn-sae}, %zmm8, %zmm12, %zmm11
	vfnmadd231ps	{rn-sae}, %zmm12, %zmm6, %zmm7
	vmulps	{rn-sae}, %zmm11, %zmm11, %zmm6
	vmulps	{rn-sae}, %zmm7, %zmm7, %zmm8
	vpxord	%zmm11, %zmm9, %zmm9
	vpxord	%zmm7, %zmm10, %zmm7
	vmovups	__svml_hsin_ha_data_internal+5184(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hsin_ha_data_internal+5120(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm6, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm10, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm10
	vmovups	__svml_hsin_ha_data_internal+5056(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vfmadd213ps	{rn-sae}, %zmm11, %zmm6, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm10
	vmovups	__svml_hsin_ha_data_internal+4992(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vfmadd213ps	{rn-sae}, %zmm11, %zmm6, %zmm12
	vfmadd213ps	{rn-sae}, %zmm11, %zmm8, %zmm10
	vmulps	{rn-sae}, %zmm6, %zmm12, %zmm6
	vmulps	{rn-sae}, %zmm8, %zmm10, %zmm8
	vfmadd213ps	{rn-sae}, %zmm9, %zmm9, %zmm6
	vfmadd213ps	{rn-sae}, %zmm7, %zmm7, %zmm8
	vpternlogd	$210, %zmm1, %zmm3, %zmm6 # zmm6 = zmm6 ^ (zmm1 & ~zmm3)
	vpternlogd	$210, %zmm2, %zmm3, %zmm8 # zmm8 = zmm8 ^ (zmm2 & ~zmm3)
	vmovups	__svml_hsin_ha_data_internal+4160(%rip), %zmm1 # AlignMOV convert to UnAlignMOV 
	vcmpnleps	%zmm1, %zmm4, %k0
	vcmpnleps	%zmm1, %zmm5, %k1
	vcvtps2phx	%zmm6, %ymm1
	vcvtps2phx	%zmm8, %ymm2
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
	callq	*__svml_z0__svml_hsin_ha_cout_rare_internal_wrapper@GOTPCREL(%rip)
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
	.size	__svml_sins32_ha, .Lfunc_end0-__svml_sins32_ha
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __svml_z0__svml_hsin_ha_cout_rare_internal_wrapper
	.type	__svml_z0__svml_hsin_ha_cout_rare_internal_wrapper,@function
__svml_z0__svml_hsin_ha_cout_rare_internal_wrapper: # 
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
	callq	__svml_hsin_ha_cout_rare_internal
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
	.size	__svml_z0__svml_hsin_ha_cout_rare_internal_wrapper, .Lfunc_end1-__svml_z0__svml_hsin_ha_cout_rare_internal_wrapper
	.cfi_endproc
                                        # -- End function
	.hidden	__svml_hsin_ha_cout_rare_internal

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hsin_ha_data_internal:
	.zero	4
	.zero	4
	.zero	4
	.long	1065353216                      # 0x3f800000
	.long	3114133471                      # 0xb99de7df
	.long	1019808432                      # 0x3cc90ab0
	.long	2953169304                      # 0xb005c998
	.long	1065353216                      # 0x3f800000
	.long	3130909128                      # 0xba9de1c8
	.long	1028193072                      # 0x3d48fb30
	.long	2968461951                      # 0xb0ef227f
	.long	1065353216                      # 0x3f800000
	.long	3140588184                      # 0xbb319298
	.long	1033283845                      # 0x3d96a905
	.long	2975014497                      # 0xb1531e61
	.long	1065353216                      # 0x3f800000
	.long	3147680113                      # 0xbb9dc971
	.long	1036565814                      # 0x3dc8bd36
	.long	2960495349                      # 0xb07592f5
	.long	1065353216                      # 0x3f800000
	.long	3153489468                      # 0xbbf66e3c
	.long	1039839859                      # 0x3dfab273
	.long	2970970319                      # 0xb11568cf
	.long	1065353216                      # 0x3f800000
	.long	3157349634                      # 0xbc315502
	.long	1041645699                      # 0x3e164083
	.long	837346836                       # 0x31e8e614
	.long	1065353216                      # 0x3f800000
	.long	3161536011                      # 0xbc71360b
	.long	1043271842                      # 0x3e2f10a2
	.long	823224313                       # 0x311167f9
	.long	1065353216                      # 0x3f800000
	.long	3164432432                      # 0xbc9d6830
	.long	1044891074                      # 0x3e47c5c2
	.long	2967836285                      # 0xb0e5967d
	.long	1065353216                      # 0x3f800000
	.long	3167161428                      # 0xbcc70c54
	.long	1046502419                      # 0x3e605c13
	.long	833086710                       # 0x31a7e4f6
	.long	1065353216                      # 0x3f800000
	.long	3170205956                      # 0xbcf58104
	.long	1048104908                      # 0x3e78cfcc
	.long	2971391005                      # 0xb11bd41d
	.long	1065353216                      # 0x3f800000
	.long	3172229004                      # 0xbd145f8c
	.long	1049136787                      # 0x3e888e93
	.long	824999326                       # 0x312c7d9e
	.long	1065353216                      # 0x3f800000
	.long	3174063957                      # 0xbd305f55
	.long	1049927729                      # 0x3e94a031
	.long	846027248                       # 0x326d59f0
	.long	1065353216                      # 0x3f800000
	.long	3176053642                      # 0xbd4ebb8a
	.long	1050712805                      # 0x3ea09ae5
	.long	2990442912                      # 0xb23e89a0
	.long	1065353216                      # 0x3f800000
	.long	3178196862                      # 0xbd6f6f7e
	.long	1051491540                      # 0x3eac7cd4
	.long	2988789250                      # 0xb2254e02
	.long	1065353216                      # 0x3f800000
	.long	3179887378                      # 0xbd893b12
	.long	1052263466                      # 0x3eb8442a
	.long	2993707942                      # 0xb2705ba6
	.long	1065353216                      # 0x3f800000
	.long	3181110540                      # 0xbd9be50c
	.long	1053028117                      # 0x3ec3ef15
	.long	836097324                       # 0x31d5d52c
	.long	1065353216                      # 0x3f800000
	.long	3182408396                      # 0xbdafb2cc
	.long	1053785034                      # 0x3ecf7bca
	.long	829045603                       # 0x316a3b63
	.long	1065353216                      # 0x3f800000
	.long	3183780163                      # 0xbdc4a143
	.long	1054533760                      # 0x3edae880
	.long	840832460                       # 0x321e15cc
	.long	1065353216                      # 0x3f800000
	.long	3185225016                      # 0xbddaad38
	.long	1055273845                      # 0x3ee63375
	.long	2983839604                      # 0xb1d9c774
	.long	1065353216                      # 0x3f800000
	.long	3186742084                      # 0xbdf1d344
	.long	1056004842                      # 0x3ef15aea
	.long	2986287417                      # 0xb1ff2139
	.long	1065353216                      # 0x3f800000
	.long	3188000746                      # 0xbe0507ea
	.long	1056726311                      # 0x3efc5d27
	.long	2978016425                      # 0xb180eca9
	.long	1065353216                      # 0x3f800000
	.long	3188830103                      # 0xbe11af97
	.long	1057201213                      # 0x3f039c3d
	.long	2992349186                      # 0xb25ba002
	.long	1065353216                      # 0x3f800000
	.long	3189694133                      # 0xbe1edeb5
	.long	1057551771                      # 0x3f08f59b
	.long	2998815566                      # 0xb2be4b4e
	.long	1065353216                      # 0x3f800000
	.long	3190592315                      # 0xbe2c933b
	.long	1057896922                      # 0x3f0e39da
	.long	2991207143                      # 0xb24a32e7
	.long	1065353216                      # 0x3f800000
	.long	3191524108                      # 0xbe3acb0c
	.long	1058236458                      # 0x3f13682a
	.long	852349230                       # 0x32cdd12e
	.long	1065353216                      # 0x3f800000
	.long	3192488951                      # 0xbe4983f7
	.long	1058570176                      # 0x3f187fc0
	.long	2982650867                      # 0xb1c7a3f3
	.long	1065353216                      # 0x3f800000
	.long	3193486263                      # 0xbe58bbb7
	.long	1058897873                      # 0x3f1d7fd1
	.long	848430348                       # 0x3292050c
	.long	1065353216                      # 0x3f800000
	.long	3194515443                      # 0xbe686ff3
	.long	1059219353                      # 0x3f226799
	.long	841032635                       # 0x322123bb
	.long	1065353216                      # 0x3f800000
	.long	3195575871                      # 0xbe789e3f
	.long	1059534422                      # 0x3f273656
	.long	2986574659                      # 0xb2038343
	.long	1065353216                      # 0x3f800000
	.long	3196363278                      # 0xbe84a20e
	.long	1059842890                      # 0x3f2beb4a
	.long	2998350134                      # 0xb2b73136
	.long	1065353216                      # 0x3f800000
	.long	3196923773                      # 0xbe8d2f7d
	.long	1060144571                      # 0x3f3085bb
	.long	2997759282                      # 0xb2ae2d32
	.long	1065353216                      # 0x3f800000
	.long	3197498906                      # 0xbe95f61a
	.long	1060439283                      # 0x3f3504f3
	.long	844097402                       # 0x324fe77a
	.long	1065353216                      # 0x3f800000
	.long	1044518635                      # 0x3e4216eb
	.long	1060726850                      # 0x3f396842
	.long	2994798599                      # 0xb2810007
	.long	1056964608                      # 0x3f000000
	.long	1043311911                      # 0x3e2fad27
	.long	1061007097                      # 0x3f3daef9
	.long	832220140                       # 0x319aabec
	.long	1056964608                      # 0x3f000000
	.long	1042078039                      # 0x3e1cd957
	.long	1061279856                      # 0x3f41d870
	.long	851442039                       # 0x32bff977
	.long	1056964608                      # 0x3f000000
	.long	1040817765                      # 0x3e099e65
	.long	1061544963                      # 0x3f45e403
	.long	850481524                       # 0x32b15174
	.long	1056964608                      # 0x3f000000
	.long	1038876298                      # 0x3debfe8a
	.long	1061802258                      # 0x3f49d112
	.long	848897600                       # 0x32992640
	.long	1056964608                      # 0x3f000000
	.long	1036254719                      # 0x3dc3fdff
	.long	1062051586                      # 0x3f4d9f02
	.long	847147240                       # 0x327e70e8
	.long	1056964608                      # 0x3f000000
	.long	1033584979                      # 0x3d9b4153
	.long	1062292797                      # 0x3f514d3d
	.long	806113028                       # 0x300c4f04
	.long	1056964608                      # 0x3f000000
	.long	1029938589                      # 0x3d639d9d
	.long	1062525745                      # 0x3f54db31
	.long	848357914                       # 0x3290ea1a
	.long	1056964608                      # 0x3f000000
	.long	1024416170                      # 0x3d0f59aa
	.long	1062750291                      # 0x3f584853
	.long	2994560960                      # 0xb27d5fc0
	.long	1056964608                      # 0x3f000000
	.long	1013387058                      # 0x3c670f32
	.long	1062966298                      # 0x3f5b941a
	.long	841166280                       # 0x32232dc8
	.long	1056964608                      # 0x3f000000
	.long	3152590408                      # 0xbbe8b648
	.long	1063173637                      # 0x3f5ebe05
	.long	851900755                       # 0x32c6f953
	.long	1056964608                      # 0x3f000000
	.long	3169472868                      # 0xbcea5164
	.long	1063372184                      # 0x3f61c598
	.long	3001545765                      # 0xb2e7f425
	.long	1056964608                      # 0x3f000000
	.long	3176031322                      # 0xbd4e645a
	.long	1063561817                      # 0x3f64aa59
	.long	823789818                       # 0x311a08fa
	.long	1056964608                      # 0x3f000000
	.long	3180617215                      # 0xbd945dff
	.long	1063742424                      # 0x3f676bd8
	.long	2998678409                      # 0xb2bc3389
	.long	1056964608                      # 0x3f000000
	.long	3183612120                      # 0xbdc210d8
	.long	1063913895                      # 0x3f6a09a7
	.long	3001754476                      # 0xb2eb236c
	.long	1056964608                      # 0x3f000000
	.long	3186639787                      # 0xbdf043ab
	.long	1064076126                      # 0x3f6c835e
	.long	854796500                       # 0x32f328d4
	.long	1056964608                      # 0x3f000000
	.long	3188684717                      # 0xbe0f77ad
	.long	1064229022                      # 0x3f6ed89e
	.long	2995991516                      # 0xb29333dc
	.long	1056964608                      # 0x3f000000
	.long	1035072335                      # 0x3db1f34f
	.long	1064372488                      # 0x3f710908
	.long	840880349                       # 0x321ed0dd
	.long	1048576000                      # 0x3e800000
	.long	1031957395                      # 0x3d826b93
	.long	1064506439                      # 0x3f731447
	.long	851742225                       # 0x32c48e11
	.long	1048576000                      # 0x3e800000
	.long	1025835404                      # 0x3d25018c
	.long	1064630795                      # 0x3f74fa0b
	.long	2996018466                      # 0xb2939d22
	.long	1048576000                      # 0x3e800000
	.long	1015605553                      # 0x3c88e931
	.long	1064745479                      # 0x3f76ba07
	.long	846006572                       # 0x326d092c
	.long	1048576000                      # 0x3e800000
	.long	3152414341                      # 0xbbe60685
	.long	1064850424                      # 0x3f7853f8
	.long	2987244005                      # 0xb20db9e5
	.long	1048576000                      # 0x3e800000
	.long	3170705253                      # 0xbcfd1f65
	.long	1064945565                      # 0x3f79c79d
	.long	851856985                       # 0x32c64e59
	.long	1048576000                      # 0x3e800000
	.long	3177244920                      # 0xbd60e8f8
	.long	1065030846                      # 0x3f7b14be
	.long	855602635                       # 0x32ff75cb
	.long	1048576000                      # 0x3e800000
	.long	1027359369                      # 0x3d3c4289
	.long	1065106216                      # 0x3f7c3b28
	.long	2989610635                      # 0xb231d68b
	.long	1040187392                      # 0x3e000000
	.long	1018299420                      # 0x3cb2041c
	.long	1065171628                      # 0x3f7d3aac
	.long	2969000681                      # 0xb0f75ae9
	.long	1040187392                      # 0x3e000000
	.long	3140071849                      # 0xbb29b1a9
	.long	1065227044                      # 0x3f7e1324
	.long	3002197507                      # 0xb2f1e603
	.long	1040187392                      # 0x3e000000
	.long	3168602920                      # 0xbcdd0b28
	.long	1065272429                      # 0x3f7ec46d
	.long	838093129                       # 0x31f44949
	.long	1040187392                      # 0x3e000000
	.long	1010124837                      # 0x3c354825
	.long	1065307757                      # 0x3f7f4e6d
	.long	852498564                       # 0x32d01884
	.long	1031798784                      # 0x3d800000
	.long	3160150850                      # 0xbc5c1342
	.long	1065333007                      # 0x3f7fb10f
	.long	836655967                       # 0x31de5b5f
	.long	1031798784                      # 0x3d800000
	.long	3151746369                      # 0xbbdbd541
	.long	1065348163                      # 0x3f7fec43
	.long	814009613                       # 0x3084cd0d
	.long	1023410176                      # 0x3d000000
	.zero	4
	.long	1065353216                      # 0x3f800000
	.zero	4
	.zero	4
	.long	1004262721                      # 0x3bdbd541
	.long	1065348163                      # 0x3f7fec43
	.long	814009613                       # 0x3084cd0d
	.long	3170893824                      # 0xbd000000
	.long	1012667202                      # 0x3c5c1342
	.long	1065333007                      # 0x3f7fb10f
	.long	836655967                       # 0x31de5b5f
	.long	3179282432                      # 0xbd800000
	.long	3157608485                      # 0xbc354825
	.long	1065307757                      # 0x3f7f4e6d
	.long	852498564                       # 0x32d01884
	.long	3179282432                      # 0xbd800000
	.long	1021119272                      # 0x3cdd0b28
	.long	1065272429                      # 0x3f7ec46d
	.long	838093129                       # 0x31f44949
	.long	3187671040                      # 0xbe000000
	.long	992588201                       # 0x3b29b1a9
	.long	1065227044                      # 0x3f7e1324
	.long	3002197507                      # 0xb2f1e603
	.long	3187671040                      # 0xbe000000
	.long	3165783068                      # 0xbcb2041c
	.long	1065171628                      # 0x3f7d3aac
	.long	2969000681                      # 0xb0f75ae9
	.long	3187671040                      # 0xbe000000
	.long	3174843017                      # 0xbd3c4289
	.long	1065106216                      # 0x3f7c3b28
	.long	2989610635                      # 0xb231d68b
	.long	3187671040                      # 0xbe000000
	.long	1029761272                      # 0x3d60e8f8
	.long	1065030846                      # 0x3f7b14be
	.long	855602635                       # 0x32ff75cb
	.long	3196059648                      # 0xbe800000
	.long	1023221605                      # 0x3cfd1f65
	.long	1064945565                      # 0x3f79c79d
	.long	851856985                       # 0x32c64e59
	.long	3196059648                      # 0xbe800000
	.long	1004930693                      # 0x3be60685
	.long	1064850424                      # 0x3f7853f8
	.long	2987244005                      # 0xb20db9e5
	.long	3196059648                      # 0xbe800000
	.long	3163089201                      # 0xbc88e931
	.long	1064745479                      # 0x3f76ba07
	.long	846006572                       # 0x326d092c
	.long	3196059648                      # 0xbe800000
	.long	3173319052                      # 0xbd25018c
	.long	1064630795                      # 0x3f74fa0b
	.long	2996018466                      # 0xb2939d22
	.long	3196059648                      # 0xbe800000
	.long	3179441043                      # 0xbd826b93
	.long	1064506439                      # 0x3f731447
	.long	851742225                       # 0x32c48e11
	.long	3196059648                      # 0xbe800000
	.long	3182555983                      # 0xbdb1f34f
	.long	1064372488                      # 0x3f710908
	.long	840880349                       # 0x321ed0dd
	.long	3196059648                      # 0xbe800000
	.long	1041201069                      # 0x3e0f77ad
	.long	1064229022                      # 0x3f6ed89e
	.long	2995991516                      # 0xb29333dc
	.long	3204448256                      # 0xbf000000
	.long	1039156139                      # 0x3df043ab
	.long	1064076126                      # 0x3f6c835e
	.long	854796500                       # 0x32f328d4
	.long	3204448256                      # 0xbf000000
	.long	1036128472                      # 0x3dc210d8
	.long	1063913895                      # 0x3f6a09a7
	.long	3001754476                      # 0xb2eb236c
	.long	3204448256                      # 0xbf000000
	.long	1033133567                      # 0x3d945dff
	.long	1063742424                      # 0x3f676bd8
	.long	2998678409                      # 0xb2bc3389
	.long	3204448256                      # 0xbf000000
	.long	1028547674                      # 0x3d4e645a
	.long	1063561817                      # 0x3f64aa59
	.long	823789818                       # 0x311a08fa
	.long	3204448256                      # 0xbf000000
	.long	1021989220                      # 0x3cea5164
	.long	1063372184                      # 0x3f61c598
	.long	3001545765                      # 0xb2e7f425
	.long	3204448256                      # 0xbf000000
	.long	1005106760                      # 0x3be8b648
	.long	1063173637                      # 0x3f5ebe05
	.long	851900755                       # 0x32c6f953
	.long	3204448256                      # 0xbf000000
	.long	3160870706                      # 0xbc670f32
	.long	1062966298                      # 0x3f5b941a
	.long	841166280                       # 0x32232dc8
	.long	3204448256                      # 0xbf000000
	.long	3171899818                      # 0xbd0f59aa
	.long	1062750291                      # 0x3f584853
	.long	2994560960                      # 0xb27d5fc0
	.long	3204448256                      # 0xbf000000
	.long	3177422237                      # 0xbd639d9d
	.long	1062525745                      # 0x3f54db31
	.long	848357914                       # 0x3290ea1a
	.long	3204448256                      # 0xbf000000
	.long	3181068627                      # 0xbd9b4153
	.long	1062292797                      # 0x3f514d3d
	.long	806113028                       # 0x300c4f04
	.long	3204448256                      # 0xbf000000
	.long	3183738367                      # 0xbdc3fdff
	.long	1062051586                      # 0x3f4d9f02
	.long	847147240                       # 0x327e70e8
	.long	3204448256                      # 0xbf000000
	.long	3186359946                      # 0xbdebfe8a
	.long	1061802258                      # 0x3f49d112
	.long	848897600                       # 0x32992640
	.long	3204448256                      # 0xbf000000
	.long	3188301413                      # 0xbe099e65
	.long	1061544963                      # 0x3f45e403
	.long	850481524                       # 0x32b15174
	.long	3204448256                      # 0xbf000000
	.long	3189561687                      # 0xbe1cd957
	.long	1061279856                      # 0x3f41d870
	.long	851442039                       # 0x32bff977
	.long	3204448256                      # 0xbf000000
	.long	3190795559                      # 0xbe2fad27
	.long	1061007097                      # 0x3f3daef9
	.long	832220140                       # 0x319aabec
	.long	3204448256                      # 0xbf000000
	.long	3192002283                      # 0xbe4216eb
	.long	1060726850                      # 0x3f396842
	.long	2994798599                      # 0xb2810007
	.long	3204448256                      # 0xbf000000
	.long	1050015258                      # 0x3e95f61a
	.long	1060439283                      # 0x3f3504f3
	.long	844097402                       # 0x324fe77a
	.long	3212836864                      # 0xbf800000
	.long	1049440125                      # 0x3e8d2f7d
	.long	1060144571                      # 0x3f3085bb
	.long	2997759282                      # 0xb2ae2d32
	.long	3212836864                      # 0xbf800000
	.long	1048879630                      # 0x3e84a20e
	.long	1059842890                      # 0x3f2beb4a
	.long	2998350134                      # 0xb2b73136
	.long	3212836864                      # 0xbf800000
	.long	1048092223                      # 0x3e789e3f
	.long	1059534422                      # 0x3f273656
	.long	2986574659                      # 0xb2038343
	.long	3212836864                      # 0xbf800000
	.long	1047031795                      # 0x3e686ff3
	.long	1059219353                      # 0x3f226799
	.long	841032635                       # 0x322123bb
	.long	3212836864                      # 0xbf800000
	.long	1046002615                      # 0x3e58bbb7
	.long	1058897873                      # 0x3f1d7fd1
	.long	848430348                       # 0x3292050c
	.long	3212836864                      # 0xbf800000
	.long	1045005303                      # 0x3e4983f7
	.long	1058570176                      # 0x3f187fc0
	.long	2982650867                      # 0xb1c7a3f3
	.long	3212836864                      # 0xbf800000
	.long	1044040460                      # 0x3e3acb0c
	.long	1058236458                      # 0x3f13682a
	.long	852349230                       # 0x32cdd12e
	.long	3212836864                      # 0xbf800000
	.long	1043108667                      # 0x3e2c933b
	.long	1057896922                      # 0x3f0e39da
	.long	2991207143                      # 0xb24a32e7
	.long	3212836864                      # 0xbf800000
	.long	1042210485                      # 0x3e1edeb5
	.long	1057551771                      # 0x3f08f59b
	.long	2998815566                      # 0xb2be4b4e
	.long	3212836864                      # 0xbf800000
	.long	1041346455                      # 0x3e11af97
	.long	1057201213                      # 0x3f039c3d
	.long	2992349186                      # 0xb25ba002
	.long	3212836864                      # 0xbf800000
	.long	1040517098                      # 0x3e0507ea
	.long	1056726311                      # 0x3efc5d27
	.long	2978016425                      # 0xb180eca9
	.long	3212836864                      # 0xbf800000
	.long	1039258436                      # 0x3df1d344
	.long	1056004842                      # 0x3ef15aea
	.long	2986287417                      # 0xb1ff2139
	.long	3212836864                      # 0xbf800000
	.long	1037741368                      # 0x3ddaad38
	.long	1055273845                      # 0x3ee63375
	.long	2983839604                      # 0xb1d9c774
	.long	3212836864                      # 0xbf800000
	.long	1036296515                      # 0x3dc4a143
	.long	1054533760                      # 0x3edae880
	.long	840832460                       # 0x321e15cc
	.long	3212836864                      # 0xbf800000
	.long	1034924748                      # 0x3dafb2cc
	.long	1053785034                      # 0x3ecf7bca
	.long	829045603                       # 0x316a3b63
	.long	3212836864                      # 0xbf800000
	.long	1033626892                      # 0x3d9be50c
	.long	1053028117                      # 0x3ec3ef15
	.long	836097324                       # 0x31d5d52c
	.long	3212836864                      # 0xbf800000
	.long	1032403730                      # 0x3d893b12
	.long	1052263466                      # 0x3eb8442a
	.long	2993707942                      # 0xb2705ba6
	.long	3212836864                      # 0xbf800000
	.long	1030713214                      # 0x3d6f6f7e
	.long	1051491540                      # 0x3eac7cd4
	.long	2988789250                      # 0xb2254e02
	.long	3212836864                      # 0xbf800000
	.long	1028569994                      # 0x3d4ebb8a
	.long	1050712805                      # 0x3ea09ae5
	.long	2990442912                      # 0xb23e89a0
	.long	3212836864                      # 0xbf800000
	.long	1026580309                      # 0x3d305f55
	.long	1049927729                      # 0x3e94a031
	.long	846027248                       # 0x326d59f0
	.long	3212836864                      # 0xbf800000
	.long	1024745356                      # 0x3d145f8c
	.long	1049136787                      # 0x3e888e93
	.long	824999326                       # 0x312c7d9e
	.long	3212836864                      # 0xbf800000
	.long	1022722308                      # 0x3cf58104
	.long	1048104908                      # 0x3e78cfcc
	.long	2971391005                      # 0xb11bd41d
	.long	3212836864                      # 0xbf800000
	.long	1019677780                      # 0x3cc70c54
	.long	1046502419                      # 0x3e605c13
	.long	833086710                       # 0x31a7e4f6
	.long	3212836864                      # 0xbf800000
	.long	1016948784                      # 0x3c9d6830
	.long	1044891074                      # 0x3e47c5c2
	.long	2967836285                      # 0xb0e5967d
	.long	3212836864                      # 0xbf800000
	.long	1014052363                      # 0x3c71360b
	.long	1043271842                      # 0x3e2f10a2
	.long	823224313                       # 0x311167f9
	.long	3212836864                      # 0xbf800000
	.long	1009865986                      # 0x3c315502
	.long	1041645699                      # 0x3e164083
	.long	837346836                       # 0x31e8e614
	.long	3212836864                      # 0xbf800000
	.long	1006005820                      # 0x3bf66e3c
	.long	1039839859                      # 0x3dfab273
	.long	2970970319                      # 0xb11568cf
	.long	3212836864                      # 0xbf800000
	.long	1000196465                      # 0x3b9dc971
	.long	1036565814                      # 0x3dc8bd36
	.long	2960495349                      # 0xb07592f5
	.long	3212836864                      # 0xbf800000
	.long	993104536                       # 0x3b319298
	.long	1033283845                      # 0x3d96a905
	.long	2975014497                      # 0xb1531e61
	.long	3212836864                      # 0xbf800000
	.long	983425480                       # 0x3a9de1c8
	.long	1028193072                      # 0x3d48fb30
	.long	2968461951                      # 0xb0ef227f
	.long	3212836864                      # 0xbf800000
	.long	966649823                       # 0x399de7df
	.long	1019808432                      # 0x3cc90ab0
	.long	2953169304                      # 0xb005c998
	.long	3212836864                      # 0xbf800000
	.zero	4
	.zero	4
	.zero	4
	.long	3212836864                      # 0xbf800000
	.long	966649823                       # 0x399de7df
	.long	3167292080                      # 0xbcc90ab0
	.long	805685656                       # 0x3005c998
	.long	3212836864                      # 0xbf800000
	.long	983425480                       # 0x3a9de1c8
	.long	3175676720                      # 0xbd48fb30
	.long	820978303                       # 0x30ef227f
	.long	3212836864                      # 0xbf800000
	.long	993104536                       # 0x3b319298
	.long	3180767493                      # 0xbd96a905
	.long	827530849                       # 0x31531e61
	.long	3212836864                      # 0xbf800000
	.long	1000196465                      # 0x3b9dc971
	.long	3184049462                      # 0xbdc8bd36
	.long	813011701                       # 0x307592f5
	.long	3212836864                      # 0xbf800000
	.long	1006005820                      # 0x3bf66e3c
	.long	3187323507                      # 0xbdfab273
	.long	823486671                       # 0x311568cf
	.long	3212836864                      # 0xbf800000
	.long	1009865986                      # 0x3c315502
	.long	3189129347                      # 0xbe164083
	.long	2984830484                      # 0xb1e8e614
	.long	3212836864                      # 0xbf800000
	.long	1014052363                      # 0x3c71360b
	.long	3190755490                      # 0xbe2f10a2
	.long	2970707961                      # 0xb11167f9
	.long	3212836864                      # 0xbf800000
	.long	1016948784                      # 0x3c9d6830
	.long	3192374722                      # 0xbe47c5c2
	.long	820352637                       # 0x30e5967d
	.long	3212836864                      # 0xbf800000
	.long	1019677780                      # 0x3cc70c54
	.long	3193986067                      # 0xbe605c13
	.long	2980570358                      # 0xb1a7e4f6
	.long	3212836864                      # 0xbf800000
	.long	1022722308                      # 0x3cf58104
	.long	3195588556                      # 0xbe78cfcc
	.long	823907357                       # 0x311bd41d
	.long	3212836864                      # 0xbf800000
	.long	1024745356                      # 0x3d145f8c
	.long	3196620435                      # 0xbe888e93
	.long	2972482974                      # 0xb12c7d9e
	.long	3212836864                      # 0xbf800000
	.long	1026580309                      # 0x3d305f55
	.long	3197411377                      # 0xbe94a031
	.long	2993510896                      # 0xb26d59f0
	.long	3212836864                      # 0xbf800000
	.long	1028569994                      # 0x3d4ebb8a
	.long	3198196453                      # 0xbea09ae5
	.long	842959264                       # 0x323e89a0
	.long	3212836864                      # 0xbf800000
	.long	1030713214                      # 0x3d6f6f7e
	.long	3198975188                      # 0xbeac7cd4
	.long	841305602                       # 0x32254e02
	.long	3212836864                      # 0xbf800000
	.long	1032403730                      # 0x3d893b12
	.long	3199747114                      # 0xbeb8442a
	.long	846224294                       # 0x32705ba6
	.long	3212836864                      # 0xbf800000
	.long	1033626892                      # 0x3d9be50c
	.long	3200511765                      # 0xbec3ef15
	.long	2983580972                      # 0xb1d5d52c
	.long	3212836864                      # 0xbf800000
	.long	1034924748                      # 0x3dafb2cc
	.long	3201268682                      # 0xbecf7bca
	.long	2976529251                      # 0xb16a3b63
	.long	3212836864                      # 0xbf800000
	.long	1036296515                      # 0x3dc4a143
	.long	3202017408                      # 0xbedae880
	.long	2988316108                      # 0xb21e15cc
	.long	3212836864                      # 0xbf800000
	.long	1037741368                      # 0x3ddaad38
	.long	3202757493                      # 0xbee63375
	.long	836355956                       # 0x31d9c774
	.long	3212836864                      # 0xbf800000
	.long	1039258436                      # 0x3df1d344
	.long	3203488490                      # 0xbef15aea
	.long	838803769                       # 0x31ff2139
	.long	3212836864                      # 0xbf800000
	.long	1040517098                      # 0x3e0507ea
	.long	3204209959                      # 0xbefc5d27
	.long	830532777                       # 0x3180eca9
	.long	3212836864                      # 0xbf800000
	.long	1041346455                      # 0x3e11af97
	.long	3204684861                      # 0xbf039c3d
	.long	844865538                       # 0x325ba002
	.long	3212836864                      # 0xbf800000
	.long	1042210485                      # 0x3e1edeb5
	.long	3205035419                      # 0xbf08f59b
	.long	851331918                       # 0x32be4b4e
	.long	3212836864                      # 0xbf800000
	.long	1043108667                      # 0x3e2c933b
	.long	3205380570                      # 0xbf0e39da
	.long	843723495                       # 0x324a32e7
	.long	3212836864                      # 0xbf800000
	.long	1044040460                      # 0x3e3acb0c
	.long	3205720106                      # 0xbf13682a
	.long	2999832878                      # 0xb2cdd12e
	.long	3212836864                      # 0xbf800000
	.long	1045005303                      # 0x3e4983f7
	.long	3206053824                      # 0xbf187fc0
	.long	835167219                       # 0x31c7a3f3
	.long	3212836864                      # 0xbf800000
	.long	1046002615                      # 0x3e58bbb7
	.long	3206381521                      # 0xbf1d7fd1
	.long	2995913996                      # 0xb292050c
	.long	3212836864                      # 0xbf800000
	.long	1047031795                      # 0x3e686ff3
	.long	3206703001                      # 0xbf226799
	.long	2988516283                      # 0xb22123bb
	.long	3212836864                      # 0xbf800000
	.long	1048092223                      # 0x3e789e3f
	.long	3207018070                      # 0xbf273656
	.long	839091011                       # 0x32038343
	.long	3212836864                      # 0xbf800000
	.long	1048879630                      # 0x3e84a20e
	.long	3207326538                      # 0xbf2beb4a
	.long	850866486                       # 0x32b73136
	.long	3212836864                      # 0xbf800000
	.long	1049440125                      # 0x3e8d2f7d
	.long	3207628219                      # 0xbf3085bb
	.long	850275634                       # 0x32ae2d32
	.long	3212836864                      # 0xbf800000
	.long	1050015258                      # 0x3e95f61a
	.long	3207922931                      # 0xbf3504f3
	.long	2991581050                      # 0xb24fe77a
	.long	3212836864                      # 0xbf800000
	.long	3192002283                      # 0xbe4216eb
	.long	3208210498                      # 0xbf396842
	.long	847314951                       # 0x32810007
	.long	3204448256                      # 0xbf000000
	.long	3190795559                      # 0xbe2fad27
	.long	3208490745                      # 0xbf3daef9
	.long	2979703788                      # 0xb19aabec
	.long	3204448256                      # 0xbf000000
	.long	3189561687                      # 0xbe1cd957
	.long	3208763504                      # 0xbf41d870
	.long	2998925687                      # 0xb2bff977
	.long	3204448256                      # 0xbf000000
	.long	3188301413                      # 0xbe099e65
	.long	3209028611                      # 0xbf45e403
	.long	2997965172                      # 0xb2b15174
	.long	3204448256                      # 0xbf000000
	.long	3186359946                      # 0xbdebfe8a
	.long	3209285906                      # 0xbf49d112
	.long	2996381248                      # 0xb2992640
	.long	3204448256                      # 0xbf000000
	.long	3183738367                      # 0xbdc3fdff
	.long	3209535234                      # 0xbf4d9f02
	.long	2994630888                      # 0xb27e70e8
	.long	3204448256                      # 0xbf000000
	.long	3181068627                      # 0xbd9b4153
	.long	3209776445                      # 0xbf514d3d
	.long	2953596676                      # 0xb00c4f04
	.long	3204448256                      # 0xbf000000
	.long	3177422237                      # 0xbd639d9d
	.long	3210009393                      # 0xbf54db31
	.long	2995841562                      # 0xb290ea1a
	.long	3204448256                      # 0xbf000000
	.long	3171899818                      # 0xbd0f59aa
	.long	3210233939                      # 0xbf584853
	.long	847077312                       # 0x327d5fc0
	.long	3204448256                      # 0xbf000000
	.long	3160870706                      # 0xbc670f32
	.long	3210449946                      # 0xbf5b941a
	.long	2988649928                      # 0xb2232dc8
	.long	3204448256                      # 0xbf000000
	.long	1005106760                      # 0x3be8b648
	.long	3210657285                      # 0xbf5ebe05
	.long	2999384403                      # 0xb2c6f953
	.long	3204448256                      # 0xbf000000
	.long	1021989220                      # 0x3cea5164
	.long	3210855832                      # 0xbf61c598
	.long	854062117                       # 0x32e7f425
	.long	3204448256                      # 0xbf000000
	.long	1028547674                      # 0x3d4e645a
	.long	3211045465                      # 0xbf64aa59
	.long	2971273466                      # 0xb11a08fa
	.long	3204448256                      # 0xbf000000
	.long	1033133567                      # 0x3d945dff
	.long	3211226072                      # 0xbf676bd8
	.long	851194761                       # 0x32bc3389
	.long	3204448256                      # 0xbf000000
	.long	1036128472                      # 0x3dc210d8
	.long	3211397543                      # 0xbf6a09a7
	.long	854270828                       # 0x32eb236c
	.long	3204448256                      # 0xbf000000
	.long	1039156139                      # 0x3df043ab
	.long	3211559774                      # 0xbf6c835e
	.long	3002280148                      # 0xb2f328d4
	.long	3204448256                      # 0xbf000000
	.long	1041201069                      # 0x3e0f77ad
	.long	3211712670                      # 0xbf6ed89e
	.long	848507868                       # 0x329333dc
	.long	3204448256                      # 0xbf000000
	.long	3182555983                      # 0xbdb1f34f
	.long	3211856136                      # 0xbf710908
	.long	2988363997                      # 0xb21ed0dd
	.long	3196059648                      # 0xbe800000
	.long	3179441043                      # 0xbd826b93
	.long	3211990087                      # 0xbf731447
	.long	2999225873                      # 0xb2c48e11
	.long	3196059648                      # 0xbe800000
	.long	3173319052                      # 0xbd25018c
	.long	3212114443                      # 0xbf74fa0b
	.long	848534818                       # 0x32939d22
	.long	3196059648                      # 0xbe800000
	.long	3163089201                      # 0xbc88e931
	.long	3212229127                      # 0xbf76ba07
	.long	2993490220                      # 0xb26d092c
	.long	3196059648                      # 0xbe800000
	.long	1004930693                      # 0x3be60685
	.long	3212334072                      # 0xbf7853f8
	.long	839760357                       # 0x320db9e5
	.long	3196059648                      # 0xbe800000
	.long	1023221605                      # 0x3cfd1f65
	.long	3212429213                      # 0xbf79c79d
	.long	2999340633                      # 0xb2c64e59
	.long	3196059648                      # 0xbe800000
	.long	1029761272                      # 0x3d60e8f8
	.long	3212514494                      # 0xbf7b14be
	.long	3003086283                      # 0xb2ff75cb
	.long	3196059648                      # 0xbe800000
	.long	3174843017                      # 0xbd3c4289
	.long	3212589864                      # 0xbf7c3b28
	.long	842126987                       # 0x3231d68b
	.long	3187671040                      # 0xbe000000
	.long	3165783068                      # 0xbcb2041c
	.long	3212655276                      # 0xbf7d3aac
	.long	821517033                       # 0x30f75ae9
	.long	3187671040                      # 0xbe000000
	.long	992588201                       # 0x3b29b1a9
	.long	3212710692                      # 0xbf7e1324
	.long	854713859                       # 0x32f1e603
	.long	3187671040                      # 0xbe000000
	.long	1021119272                      # 0x3cdd0b28
	.long	3212756077                      # 0xbf7ec46d
	.long	2985576777                      # 0xb1f44949
	.long	3187671040                      # 0xbe000000
	.long	3157608485                      # 0xbc354825
	.long	3212791405                      # 0xbf7f4e6d
	.long	2999982212                      # 0xb2d01884
	.long	3179282432                      # 0xbd800000
	.long	1012667202                      # 0x3c5c1342
	.long	3212816655                      # 0xbf7fb10f
	.long	2984139615                      # 0xb1de5b5f
	.long	3179282432                      # 0xbd800000
	.long	1004262721                      # 0x3bdbd541
	.long	3212831811                      # 0xbf7fec43
	.long	2961493261                      # 0xb084cd0d
	.long	3170893824                      # 0xbd000000
	.zero	4
	.long	3212836864                      # 0xbf800000
	.zero	4
	.zero	4
	.long	3151746369                      # 0xbbdbd541
	.long	3212831811                      # 0xbf7fec43
	.long	2961493261                      # 0xb084cd0d
	.long	1023410176                      # 0x3d000000
	.long	3160150850                      # 0xbc5c1342
	.long	3212816655                      # 0xbf7fb10f
	.long	2984139615                      # 0xb1de5b5f
	.long	1031798784                      # 0x3d800000
	.long	1010124837                      # 0x3c354825
	.long	3212791405                      # 0xbf7f4e6d
	.long	2999982212                      # 0xb2d01884
	.long	1031798784                      # 0x3d800000
	.long	3168602920                      # 0xbcdd0b28
	.long	3212756077                      # 0xbf7ec46d
	.long	2985576777                      # 0xb1f44949
	.long	1040187392                      # 0x3e000000
	.long	3140071849                      # 0xbb29b1a9
	.long	3212710692                      # 0xbf7e1324
	.long	854713859                       # 0x32f1e603
	.long	1040187392                      # 0x3e000000
	.long	1018299420                      # 0x3cb2041c
	.long	3212655276                      # 0xbf7d3aac
	.long	821517033                       # 0x30f75ae9
	.long	1040187392                      # 0x3e000000
	.long	1027359369                      # 0x3d3c4289
	.long	3212589864                      # 0xbf7c3b28
	.long	842126987                       # 0x3231d68b
	.long	1040187392                      # 0x3e000000
	.long	3177244920                      # 0xbd60e8f8
	.long	3212514494                      # 0xbf7b14be
	.long	3003086283                      # 0xb2ff75cb
	.long	1048576000                      # 0x3e800000
	.long	3170705253                      # 0xbcfd1f65
	.long	3212429213                      # 0xbf79c79d
	.long	2999340633                      # 0xb2c64e59
	.long	1048576000                      # 0x3e800000
	.long	3152414341                      # 0xbbe60685
	.long	3212334072                      # 0xbf7853f8
	.long	839760357                       # 0x320db9e5
	.long	1048576000                      # 0x3e800000
	.long	1015605553                      # 0x3c88e931
	.long	3212229127                      # 0xbf76ba07
	.long	2993490220                      # 0xb26d092c
	.long	1048576000                      # 0x3e800000
	.long	1025835404                      # 0x3d25018c
	.long	3212114443                      # 0xbf74fa0b
	.long	848534818                       # 0x32939d22
	.long	1048576000                      # 0x3e800000
	.long	1031957395                      # 0x3d826b93
	.long	3211990087                      # 0xbf731447
	.long	2999225873                      # 0xb2c48e11
	.long	1048576000                      # 0x3e800000
	.long	1035072335                      # 0x3db1f34f
	.long	3211856136                      # 0xbf710908
	.long	2988363997                      # 0xb21ed0dd
	.long	1048576000                      # 0x3e800000
	.long	3188684717                      # 0xbe0f77ad
	.long	3211712670                      # 0xbf6ed89e
	.long	848507868                       # 0x329333dc
	.long	1056964608                      # 0x3f000000
	.long	3186639787                      # 0xbdf043ab
	.long	3211559774                      # 0xbf6c835e
	.long	3002280148                      # 0xb2f328d4
	.long	1056964608                      # 0x3f000000
	.long	3183612120                      # 0xbdc210d8
	.long	3211397543                      # 0xbf6a09a7
	.long	854270828                       # 0x32eb236c
	.long	1056964608                      # 0x3f000000
	.long	3180617215                      # 0xbd945dff
	.long	3211226072                      # 0xbf676bd8
	.long	851194761                       # 0x32bc3389
	.long	1056964608                      # 0x3f000000
	.long	3176031322                      # 0xbd4e645a
	.long	3211045465                      # 0xbf64aa59
	.long	2971273466                      # 0xb11a08fa
	.long	1056964608                      # 0x3f000000
	.long	3169472868                      # 0xbcea5164
	.long	3210855832                      # 0xbf61c598
	.long	854062117                       # 0x32e7f425
	.long	1056964608                      # 0x3f000000
	.long	3152590408                      # 0xbbe8b648
	.long	3210657285                      # 0xbf5ebe05
	.long	2999384403                      # 0xb2c6f953
	.long	1056964608                      # 0x3f000000
	.long	1013387058                      # 0x3c670f32
	.long	3210449946                      # 0xbf5b941a
	.long	2988649928                      # 0xb2232dc8
	.long	1056964608                      # 0x3f000000
	.long	1024416170                      # 0x3d0f59aa
	.long	3210233939                      # 0xbf584853
	.long	847077312                       # 0x327d5fc0
	.long	1056964608                      # 0x3f000000
	.long	1029938589                      # 0x3d639d9d
	.long	3210009393                      # 0xbf54db31
	.long	2995841562                      # 0xb290ea1a
	.long	1056964608                      # 0x3f000000
	.long	1033584979                      # 0x3d9b4153
	.long	3209776445                      # 0xbf514d3d
	.long	2953596676                      # 0xb00c4f04
	.long	1056964608                      # 0x3f000000
	.long	1036254719                      # 0x3dc3fdff
	.long	3209535234                      # 0xbf4d9f02
	.long	2994630888                      # 0xb27e70e8
	.long	1056964608                      # 0x3f000000
	.long	1038876298                      # 0x3debfe8a
	.long	3209285906                      # 0xbf49d112
	.long	2996381248                      # 0xb2992640
	.long	1056964608                      # 0x3f000000
	.long	1040817765                      # 0x3e099e65
	.long	3209028611                      # 0xbf45e403
	.long	2997965172                      # 0xb2b15174
	.long	1056964608                      # 0x3f000000
	.long	1042078039                      # 0x3e1cd957
	.long	3208763504                      # 0xbf41d870
	.long	2998925687                      # 0xb2bff977
	.long	1056964608                      # 0x3f000000
	.long	1043311911                      # 0x3e2fad27
	.long	3208490745                      # 0xbf3daef9
	.long	2979703788                      # 0xb19aabec
	.long	1056964608                      # 0x3f000000
	.long	1044518635                      # 0x3e4216eb
	.long	3208210498                      # 0xbf396842
	.long	847314951                       # 0x32810007
	.long	1056964608                      # 0x3f000000
	.long	3197498906                      # 0xbe95f61a
	.long	3207922931                      # 0xbf3504f3
	.long	2991581050                      # 0xb24fe77a
	.long	1065353216                      # 0x3f800000
	.long	3196923773                      # 0xbe8d2f7d
	.long	3207628219                      # 0xbf3085bb
	.long	850275634                       # 0x32ae2d32
	.long	1065353216                      # 0x3f800000
	.long	3196363278                      # 0xbe84a20e
	.long	3207326538                      # 0xbf2beb4a
	.long	850866486                       # 0x32b73136
	.long	1065353216                      # 0x3f800000
	.long	3195575871                      # 0xbe789e3f
	.long	3207018070                      # 0xbf273656
	.long	839091011                       # 0x32038343
	.long	1065353216                      # 0x3f800000
	.long	3194515443                      # 0xbe686ff3
	.long	3206703001                      # 0xbf226799
	.long	2988516283                      # 0xb22123bb
	.long	1065353216                      # 0x3f800000
	.long	3193486263                      # 0xbe58bbb7
	.long	3206381521                      # 0xbf1d7fd1
	.long	2995913996                      # 0xb292050c
	.long	1065353216                      # 0x3f800000
	.long	3192488951                      # 0xbe4983f7
	.long	3206053824                      # 0xbf187fc0
	.long	835167219                       # 0x31c7a3f3
	.long	1065353216                      # 0x3f800000
	.long	3191524108                      # 0xbe3acb0c
	.long	3205720106                      # 0xbf13682a
	.long	2999832878                      # 0xb2cdd12e
	.long	1065353216                      # 0x3f800000
	.long	3190592315                      # 0xbe2c933b
	.long	3205380570                      # 0xbf0e39da
	.long	843723495                       # 0x324a32e7
	.long	1065353216                      # 0x3f800000
	.long	3189694133                      # 0xbe1edeb5
	.long	3205035419                      # 0xbf08f59b
	.long	851331918                       # 0x32be4b4e
	.long	1065353216                      # 0x3f800000
	.long	3188830103                      # 0xbe11af97
	.long	3204684861                      # 0xbf039c3d
	.long	844865538                       # 0x325ba002
	.long	1065353216                      # 0x3f800000
	.long	3188000746                      # 0xbe0507ea
	.long	3204209959                      # 0xbefc5d27
	.long	830532777                       # 0x3180eca9
	.long	1065353216                      # 0x3f800000
	.long	3186742084                      # 0xbdf1d344
	.long	3203488490                      # 0xbef15aea
	.long	838803769                       # 0x31ff2139
	.long	1065353216                      # 0x3f800000
	.long	3185225016                      # 0xbddaad38
	.long	3202757493                      # 0xbee63375
	.long	836355956                       # 0x31d9c774
	.long	1065353216                      # 0x3f800000
	.long	3183780163                      # 0xbdc4a143
	.long	3202017408                      # 0xbedae880
	.long	2988316108                      # 0xb21e15cc
	.long	1065353216                      # 0x3f800000
	.long	3182408396                      # 0xbdafb2cc
	.long	3201268682                      # 0xbecf7bca
	.long	2976529251                      # 0xb16a3b63
	.long	1065353216                      # 0x3f800000
	.long	3181110540                      # 0xbd9be50c
	.long	3200511765                      # 0xbec3ef15
	.long	2983580972                      # 0xb1d5d52c
	.long	1065353216                      # 0x3f800000
	.long	3179887378                      # 0xbd893b12
	.long	3199747114                      # 0xbeb8442a
	.long	846224294                       # 0x32705ba6
	.long	1065353216                      # 0x3f800000
	.long	3178196862                      # 0xbd6f6f7e
	.long	3198975188                      # 0xbeac7cd4
	.long	841305602                       # 0x32254e02
	.long	1065353216                      # 0x3f800000
	.long	3176053642                      # 0xbd4ebb8a
	.long	3198196453                      # 0xbea09ae5
	.long	842959264                       # 0x323e89a0
	.long	1065353216                      # 0x3f800000
	.long	3174063957                      # 0xbd305f55
	.long	3197411377                      # 0xbe94a031
	.long	2993510896                      # 0xb26d59f0
	.long	1065353216                      # 0x3f800000
	.long	3172229004                      # 0xbd145f8c
	.long	3196620435                      # 0xbe888e93
	.long	2972482974                      # 0xb12c7d9e
	.long	1065353216                      # 0x3f800000
	.long	3170205956                      # 0xbcf58104
	.long	3195588556                      # 0xbe78cfcc
	.long	823907357                       # 0x311bd41d
	.long	1065353216                      # 0x3f800000
	.long	3167161428                      # 0xbcc70c54
	.long	3193986067                      # 0xbe605c13
	.long	2980570358                      # 0xb1a7e4f6
	.long	1065353216                      # 0x3f800000
	.long	3164432432                      # 0xbc9d6830
	.long	3192374722                      # 0xbe47c5c2
	.long	820352637                       # 0x30e5967d
	.long	1065353216                      # 0x3f800000
	.long	3161536011                      # 0xbc71360b
	.long	3190755490                      # 0xbe2f10a2
	.long	2970707961                      # 0xb11167f9
	.long	1065353216                      # 0x3f800000
	.long	3157349634                      # 0xbc315502
	.long	3189129347                      # 0xbe164083
	.long	2984830484                      # 0xb1e8e614
	.long	1065353216                      # 0x3f800000
	.long	3153489468                      # 0xbbf66e3c
	.long	3187323507                      # 0xbdfab273
	.long	823486671                       # 0x311568cf
	.long	1065353216                      # 0x3f800000
	.long	3147680113                      # 0xbb9dc971
	.long	3184049462                      # 0xbdc8bd36
	.long	813011701                       # 0x307592f5
	.long	1065353216                      # 0x3f800000
	.long	3140588184                      # 0xbb319298
	.long	3180767493                      # 0xbd96a905
	.long	827530849                       # 0x31531e61
	.long	1065353216                      # 0x3f800000
	.long	3130909128                      # 0xba9de1c8
	.long	3175676720                      # 0xbd48fb30
	.long	820978303                       # 0x30ef227f
	.long	1065353216                      # 0x3f800000
	.long	3114133471                      # 0xb99de7df
	.long	3167292080                      # 0xbcc90ab0
	.long	805685656                       # 0x3005c998
	.long	1065353216                      # 0x3f800000
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
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	1176256512                      # 0x461c4000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	2139095040                      # 0x7f800000
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	3190467243                      # 0xbe2aaaab
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	1007192156                      # 0x3c08885c
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	3204448256                      # 0xbf000000
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1026206332                      # 0x3d2aaa7c
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	1078525952                      # 0x40490000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	981311488                       # 0x3a7da000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	874651648                       # 0x34222000
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
	.long	750018842                       # 0x2cb4611a
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
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	3015425326                      # 0xb3bbbd2e
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	2809605357                      # 0xa7772ced
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	3190467238                      # 0xbe2aaaa6
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	1007191910                      # 0x3c088766
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	3109009407                      # 0xb94fb7ff
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	909041400                       # 0x362edef8
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
	.long	1050868099                      # 0x3ea2f983
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
	.size	__svml_hsin_ha_data_internal, 5376



	.section	.note.GNU-stack,"",@progbits
