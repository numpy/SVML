/*******************************************
* Copyright (C) 2026 Intel Corporation
* SPDX-License-Identifier: BSD-3-Clause
*******************************************/

	.text
	.globl	__svml_acoss32_ha            # -- Begin function __svml_acoss32_ha
	.p2align	4
	.type	__svml_acoss32_ha,@function
__svml_acoss32_ha:                   # 
	.cfi_startproc
# %bb.0:
	kmovq	%k4, -8(%rsp)                   # 8-byte Spill
	vcvtph2psx	%ymm0, %zmm1
	vextractf64x4	$1, %zmm0, %ymm0
	vcvtph2psx	%ymm0, %zmm0
	vmovups	__svml_hacos_ha_data_internal(%rip), %zmm2 # AlignMOV convert to UnAlignMOV 
	vandps	%zmm1, %zmm2, %zmm3
	vandps	%zmm0, %zmm2, %zmm2
	vxorps	%zmm1, %zmm3, %zmm4
	vxorps	%zmm0, %zmm2, %zmm5
	vmovups	__svml_hacos_ha_data_internal+64(%rip), %zmm6 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm6, %zmm7
	vcmpnltps	%zmm6, %zmm3, %k2
	vcmpnltps	%zmm6, %zmm2, %k1
	vfnmadd213ps	{rn-sae}, %zmm6, %zmm3, %zmm6
	vfnmadd213ps	{rn-sae}, %zmm7, %zmm2, %zmm7
	vmulps	{rn-sae}, %zmm1, %zmm1, %zmm1
	vmulps	{rn-sae}, %zmm0, %zmm0, %zmm0
	vminps	{sae}, %zmm6, %zmm1, %zmm1
	vminps	{sae}, %zmm7, %zmm0, %zmm0
	vmovups	__svml_hacos_ha_data_internal+128(%rip), %zmm8 # AlignMOV convert to UnAlignMOV 
	vxorps	%zmm8, %zmm4, %zmm9
	vxorps	%zmm8, %zmm5, %zmm10
	vmovaps	%zmm8, %zmm11
	vsubps	{rn-sae}, %zmm9, %zmm8, %zmm11 {%k2}
	vsubps	{rn-sae}, %zmm10, %zmm8, %zmm8 {%k1}
	vmovups	__svml_hacos_ha_data_internal+192(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vcmpneqps	%zmm9, %zmm6, %k3
	vcmpneqps	%zmm9, %zmm7, %k4
	vrsqrt14ps	%zmm6, %zmm9
	vrsqrt14ps	%zmm7, %zmm10
	vmulps	{rn-sae}, %zmm9, %zmm6, %zmm6 {%k3}
	vmulps	{rn-sae}, %zmm10, %zmm7, %zmm7 {%k4}
	vmovups	__svml_hacos_ha_data_internal+256(%rip), %zmm9 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacos_ha_data_internal+320(%rip), %zmm10 # AlignMOV convert to UnAlignMOV 
	vmovups	__svml_hacos_ha_data_internal+384(%rip), %zmm12 # AlignMOV convert to UnAlignMOV 
	vmovaps	%zmm1, %zmm13
	vfmadd213ps	{rn-sae}, %zmm10, %zmm9, %zmm13
	vfmadd213ps	{rn-sae}, %zmm10, %zmm0, %zmm9
	vfmadd213ps	{rn-sae}, %zmm12, %zmm1, %zmm13
	vfmadd213ps	{rn-sae}, %zmm12, %zmm0, %zmm9
	vmovups	__svml_hacos_ha_data_internal+448(%rip), %zmm0 # AlignMOV convert to UnAlignMOV 
	vmulps	{rn-sae}, %zmm0, %zmm6, %zmm3 {%k2}
	vmulps	{rn-sae}, %zmm0, %zmm7, %zmm2 {%k1}
	vxorps	%zmm3, %zmm4, %zmm0
	vfnmadd213ps	{rn-sae}, %zmm11, %zmm13, %zmm0
	vxorps	%zmm2, %zmm5, %zmm1
	vfnmadd213ps	{rn-sae}, %zmm8, %zmm9, %zmm1
	vcvtps2phx	%zmm0, %ymm0
	vcvtps2phx	%zmm1, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	kmovq	-8(%rsp), %k4                   # 8-byte Reload
	retq
.Lfunc_end0:
	.size	__svml_acoss32_ha, .Lfunc_end0-__svml_acoss32_ha
	.cfi_endproc
                                        # -- End function

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
__svml_hacos_ha_data_internal:
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
	.size	__svml_hacos_ha_data_internal, 512


