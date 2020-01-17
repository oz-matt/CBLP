
module qtestpd (
	clk_clk,
	onchip_memory2_0_s1_address,
	onchip_memory2_0_s1_clken,
	onchip_memory2_0_s1_chipselect,
	onchip_memory2_0_s1_write,
	onchip_memory2_0_s1_readdata,
	onchip_memory2_0_s1_writedata,
	reset_reset_n);	

	input		clk_clk;
	input	[6:0]	onchip_memory2_0_s1_address;
	input		onchip_memory2_0_s1_clken;
	input		onchip_memory2_0_s1_chipselect;
	input		onchip_memory2_0_s1_write;
	output	[7:0]	onchip_memory2_0_s1_readdata;
	input	[7:0]	onchip_memory2_0_s1_writedata;
	input		reset_reset_n;
endmodule
