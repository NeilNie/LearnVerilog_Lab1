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
// CREATED		"Tue Oct 23 10:48:29 2018"

module Part2(
	SW,		// the switchs
	LEDR		// output LEDs
);


input	[8:0] SW;	// assign those switches as inputs
output [3:0] LEDR;// assigne the LEDs as outputs

wire X;
wire Y;
wire S;

assign X = SW[3:0];
assign Y = SW[7:4];
assign S = SW[8];

//assign LEDR

assign LEDR[3] = (~SW[8] & SW[3]) | (SW[8] & SW[7]);
assign LEDR[2] = (~SW[8] & SW[2]) | (SW[8] & SW[6]);
assign LEDR[1] = (~SW[8] & SW[1]) | (SW[8] & SW[5]);
assign LEDR[0] = (~SW[8] & SW[0]) | (SW[8] & SW[4]);


endmodule
