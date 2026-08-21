/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_asins32_ha            # -- Begin function __svml_asins32_ha
	.p2align	4
	.type	__svml_asins32_ha,@function
__svml_asins32_ha:                   # 
	.cfi_startproc
# %bb.0:
	kmovq	%k4, -8(%rsp)                   # 8-byte Spill
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hasin_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm2, %zmm3
	vandps	%zmm0, %zmm2, %zmm2
	vmovups	__svml_hasin_ha_data_internal+64(%rip), %zmm4 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm4, %zmm5
	vcmpnltps	%zmm4, %zmm3, %k2
	vcmpnltps	%zmm4, %zmm2, %k1
	vfnmadd213ps	{rn-sae}, %zmm4, %zmm3, %zmm4
	vfnmadd213ps	{rn-sae}, %zmm5, %zmm2, %zmm5
	vmulps	{rn-sae}, %zmm1, %zmm1, %zmm6
	vmulps	{rn-sae}, %zmm0, %zmm0, %zmm7
	vminps	{sae}, %zmm4, %zmm6, %zmm6
	vminps	{sae}, %zmm5, %zmm7, %zmm7
	vmovups	__svml_hasin_ha_data_internal+128(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasin_ha_data_internal+192(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vblendmps	%zmm8, %zmm9, %zmm10 {%k2}
	vblendmps	%zmm8, %zmm9, %zmm8 {%k1}
	vcmpneqps	%zmm9, %zmm4, %k3
	vcmpneqps	%zmm9, %zmm5, %k4
	vrsqrt14ps	%zmm4, %zmm9
	vrsqrt14ps	%zmm5, %zmm11
	vmulps	{rn-sae}, %zmm9, %zmm4, %zmm4 {%k3}
	vmulps	{rn-sae}, %zmm11, %zmm5, %zmm5 {%k4}
	vmovups	__svml_hasin_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasin_ha_data_internal+320(%rip), %zmm11 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hasin_ha_data_internal+384(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm6, %zmm13
	vfmadd213ps	{rn-sae}, %zmm11, %zmm9, %zmm13
	vfmadd213ps	{rn-sae}, %zmm11, %zmm7, %zmm9
	vfmadd213ps	{rn-sae}, %zmm12, %zmm6, %zmm13
	vfmadd213ps	{rn-sae}, %zmm12, %zmm7, %zmm9
	vmovups	__svml_hasin_ha_data_internal+448(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm3, %zmm7
	vmulps	{rn-sae}, %zmm6, %zmm4, %zmm7 {%k2}
	vfmadd213ps	{rn-sae}, %zmm10, %zmm13, %zmm7
	vmovaps	%zmm2, %zmm4
	vmulps	{rn-sae}, %zmm6, %zmm5, %zmm4 {%k1}
	vfmadd213ps	{rn-sae}, %zmm8, %zmm9, %zmm4
	vpternlogd	$150, %zmm3, %zmm1, %zmm7 # zmm7 = zmm7 ^ zmm1 ^ zmm3
	vpternlogd	$150, %zmm2, %zmm0, %zmm4 # zmm4 = zmm4 ^ zmm0 ^ zmm2
	vcvtps2phx	%zmm7, %ymm0
	vcvtps2phx	%zmm4, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	kmovq	-8(%rsp), %k4                   # 8-byte Reload
	retq
.Lfunc_end0:
	.size	__svml_asins32_ha, .Lfunc_end0-__svml_asins32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hasin_ha_data_internal:
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
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1036306094                      # 0x3dc4c6ae
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1042839218                      # 0x3e2876b2
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	1065353483                      # 0x3f80010b
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.long	3221225472                      # 0xc0000000
	.size	__svml_hasin_ha_data_internal, 512



	.section	.note.GNU-stack,"",@progbits
