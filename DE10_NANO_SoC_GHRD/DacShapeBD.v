// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Sun Sep 01 13:56:18 2019"

module DacShapeBD(
	SW1,
	SW2,
	SINE,
	SAW,
	TRIA
);


input wire	SW1;
input wire	SW2;
output wire	SINE;
output wire	SAW;
output wire	TRIA;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	SINE = SYNTHESIZED_WIRE_0 & SW2;

assign	TRIA = SW1 & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_0 =  ~SW1;

assign	SYNTHESIZED_WIRE_1 =  ~SW2;

assign	SAW = SW1 & SW2;


endmodule
