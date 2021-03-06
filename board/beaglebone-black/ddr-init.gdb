define DDRInit
	set ((CCM_Type *) 0x4006B000)->CCGR4 |= 0x22a00000
	set ((CCM_Type *) 0x4006B000)->CCGR3 |= 0x00004022
	set ((CCM_Type *) 0x4006B000)->CCGR2 |= 0x0fee0000
	set ((SCSC_Type *)0x40052000)->SOSC_CTR |= 0x1
	set ((CCM_Type *) 0x4006B000)->CIMR  |= 0x40
	set ((CCM_Type *) 0x4006B000)->CCR   |= 0x1000
	set ((CCM_Type *) 0x4006B000)->CLPCR &= ~0x800

    while (((CCM_Type *)0x4006B000)->CSR & 0x20) == 0
	   p/x ((CCM_Type *)(0x4006B000))->CSR & 0x20
	end

	set ((ANADIG_Type *)0x40050000)->PLL1_CTRL = 0x00002003
	set ((ANADIG_Type *)0x40050000)->PLL1_PFD  = (((ANADIG_Type *)0x40050000u)->PLL1_PFD & ~0x3F3F0000) | (18 << 16) | (31 << 24)
	set ((ANADIG_Type *)0x40050000)->PLL3_CTRL = 0x00003040

	set ((CCM_Type *)0x4006B000)->CCGR4 |= 0x00C00000
	set ((CCM_Type *)0x4006B000)->CCSR   = 0xF003FF64
	set ((CCM_Type *)0x4006B000)->CACRR  = 0x00000809
	set ((ANADIG_Type *)0x40050000)->PLL2_CTRL = 0x00002002
	set ((ANADIG_Type *)0x40050000)->PLL5_CTRL = 0x00002001
	set ((CCM_Type *)0x4006B000)->CCGR6 |= 0x30000000

	set $reg = &(((IOMUXC_Type *)0x40048000)->DDR_RESETB)
	while $reg <= &(((IOMUXC_Type *)0x40048000)->DUMMY_DDRBYTE2)
		set *$reg = 0x00010140
		set $reg++
	end

	set ((IOMUXC_Type *)0x40048000)->DDR_CLK_0 |= 0x10000
	set ((IOMUXC_Type *)0x40048000)->DDR_DQS_0 |= 0x10000
	set ((IOMUXC_Type *)0x40048000)->DDR_DQS_1 |= 0x10000

	set ((DDRMC_Type *)0x400AE000)->CR00 = 0x00000600

	set ((DDRMC_Type *)0x400AE000)->CR02 = 0x00000020

	set ((DDRMC_Type *)0x400AE000)->CR10 = 0x00013880
	set ((DDRMC_Type *)0x400AE000)->CR11 = 0x00030D40
	set ((DDRMC_Type *)0x400AE000)->CR12 = 0x0000050c
	set ((DDRMC_Type *)0x400AE000)->CR13 = 0x15040400
	set ((DDRMC_Type *)0x400AE000)->CR14 = 0x1406040F
	set ((DDRMC_Type *)0x400AE000)->CR16 = 0x04040000
	set ((DDRMC_Type *)0x400AE000)->CR17 = 0x006DB00C
	set ((DDRMC_Type *)0x400AE000)->CR18 = 0x00000403

	set ((DDRMC_Type *)0x400AE000)->CR20 = 0x01000000
	set ((DDRMC_Type *)0x400AE000)->CR21 = 0x00060001
	set ((DDRMC_Type *)0x400AE000)->CR22 = 0x000C0000
	set ((DDRMC_Type *)0x400AE000)->CR23 = 0x03000200
	set ((DDRMC_Type *)0x400AE000)->CR24 = 0x00000006
	set ((DDRMC_Type *)0x400AE000)->CR25 = 0x00010000
	set ((DDRMC_Type *)0x400AE000)->CR26 = 0x0C30002C

	set ((DDRMC_Type *)0x400AE000)->CR28 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR29 = 0x00000003
	set ((DDRMC_Type *)0x400AE000)->CR30 = 0x0000000A
	set ((DDRMC_Type *)0x400AE000)->CR31 = 0x003001D4
	set ((DDRMC_Type *)0x400AE000)->CR33 = 0x00010000
	set ((DDRMC_Type *)0x400AE000)->CR34 = 0x00050500

	set ((DDRMC_Type *)0x400AE000)->CR38 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR39 = 0x04001002

	set ((DDRMC_Type *)0x400AE000)->CR41 = 0x00000001

	set ((DDRMC_Type *)0x400AE000)->CR45 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR46 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR47 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR48 = 0x00460420
	set ((DDRMC_Type *)0x400AE000)->CR49 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR51 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR57 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR66 = 0x01000200
	set ((DDRMC_Type *)0x400AE000)->CR67 = 0x00000040

	set ((DDRMC_Type *)0x400AE000)->CR69 = 0x00000200
	set ((DDRMC_Type *)0x400AE000)->CR70 = 0x00000040
	set ((DDRMC_Type *)0x400AE000)->CR71 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR72 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR73 = 0x0a010300
	set ((DDRMC_Type *)0x400AE000)->CR74 = 0x01014040
	set ((DDRMC_Type *)0x400AE000)->CR75 = 0x01010101
	set ((DDRMC_Type *)0x400AE000)->CR76 = 0x03030100
	set ((DDRMC_Type *)0x400AE000)->CR77 = 0x01000101
	set ((DDRMC_Type *)0x400AE000)->CR78 = 0x0700000C
	set ((DDRMC_Type *)0x400AE000)->CR79 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR82 = 0x10000000

	set ((DDRMC_Type *)0x400AE000)->CR87 = 0x01000000
	set ((DDRMC_Type *)0x400AE000)->CR88 = 0x00040000
	set ((DDRMC_Type *)0x400AE000)->CR89 = 0x00000002

	set ((DDRMC_Type *)0x400AE000)->CR91 = 0x00020000
	set ((DDRMC_Type *)0x400AE000)->CR92 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR96 = 0x00002819
	set ((DDRMC_Type *)0x400AE000)->CR97 = 0x01000000
	set ((DDRMC_Type *)0x400AE000)->CR98 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR99 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR102 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR105 = 0x00001800
	set ((DDRMC_Type *)0x400AE000)->CR106 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR110 = 0x00000018

	set ((DDRMC_Type *)0x400AE000)->CR114 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR115 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR117 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR118 = 0x01010000
	set ((DDRMC_Type *)0x400AE000)->CR119 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR120 = 0x02020000
	set ((DDRMC_Type *)0x400AE000)->CR121 = 0x00000202
	set ((DDRMC_Type *)0x400AE000)->CR122 = 0x01010064
	set ((DDRMC_Type *)0x400AE000)->CR123 = 0x00010101
	set ((DDRMC_Type *)0x400AE000)->CR124 = 0x00000064
	set ((DDRMC_Type *)0x400AE000)->CR125 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR126 = 0x00000800
	set ((DDRMC_Type *)0x400AE000)->CR127 = 0x00000000

	set ((DDRMC_Type *)0x400AE000)->CR131 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->CR132 = 0x00000506

	set ((DDRMC_Type *)0x400AE000)->CR137 = 0x00020000
	set ((DDRMC_Type *)0x400AE000)->CR138 = 0x01000100
	set ((DDRMC_Type *)0x400AE000)->CR139 = 0x04070303
	set ((DDRMC_Type *)0x400AE000)->CR140 = 0x00000040

	set ((DDRMC_Type *)0x400AE000)->CR143 = 0x06000080
	set ((DDRMC_Type *)0x400AE000)->CR144 = 0x04070303
	set ((DDRMC_Type *)0x400AE000)->CR145 = 0x00000040
	set ((DDRMC_Type *)0x400AE000)->CR146 = 0x00000040
	set ((DDRMC_Type *)0x400AE000)->CR147 = 0x000F0000
	set ((DDRMC_Type *)0x400AE000)->CR148 = 0x000F0000

	set ((DDRMC_Type *)0x400AE000)->CR151 = 0x00000101

	set ((DDRMC_Type *)0x400AE000)->CR154 = 0x682C4000
	set ((DDRMC_Type *)0x400AE000)->CR155 = 0x00000012

	set ((DDRMC_Type *)0x400AE000)->CR158 = 0x00000006

	set ((DDRMC_Type *)0x400AE000)->CR161 = 0x00010202

	set ((DDRMC_Type *)0x400AE000)->PHY00 = 0x00002613
	set ((DDRMC_Type *)0x400AE000)->PHY16 = 0x00002613

	set ((DDRMC_Type *)0x400AE000)->PHY01 = 0x00002615
	set ((DDRMC_Type *)0x400AE000)->PHY17 = 0x00002615

	set ((DDRMC_Type *)0x400AE000)->PHY02 = 0x00210000
	set ((DDRMC_Type *)0x400AE000)->PHY18 = 0x00210000
	set ((DDRMC_Type *)0x400AE000)->PHY34 = 0x00210000

	set ((DDRMC_Type *)0x400AE000)->PHY03 = 0x0001012a
	set ((DDRMC_Type *)0x400AE000)->PHY19 = 0x0001012a
	set ((DDRMC_Type *)0x400AE000)->PHY35 = 0x0001012a

	set ((DDRMC_Type *)0x400AE000)->PHY04 = 0x00002400
	set ((DDRMC_Type *)0x400AE000)->PHY20 = 0x00002400
	set ((DDRMC_Type *)0x400AE000)->PHY36 = 0x00002400

	set ((DDRMC_Type *)0x400AE000)->PHY49 = 0x00000000
	set ((DDRMC_Type *)0x400AE000)->PHY50 = 0x00001100
	set ((DDRMC_Type *)0x400AE000)->PHY52 = 0x00010101

	set ((DDRMC_Type *)0x400AE000)->CR00 = 0x00000601

	set ((DDRMC_Type *)0x400AE000)->CR69 = 0x00000200
end

document ddr_init
Initialize DDR RAM controller, to allow loading program to the external DDR3 RAM.
end
