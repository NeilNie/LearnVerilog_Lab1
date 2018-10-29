//
// Verilog Lab Part 5
// Neil Nie, Deerfield Academy
// CS 603, Ben Bakker
// (c) 2018, All Rights Reserved
//

// Lab Part 3

module two_bit_4to1_mux(
	in0,
	in1,
	in2,
	in3,
	sel,
	out
);

input [1:0] in0;
input [1:0] in1;
input [1:0] in2;
input [1:0] in3;
input [1:0] sel;
output [1:0] out;

wire [1:0] buffer_1;
wire [1:0] buffer_2;

assign buffer_1[0] = (~sel[0] & in0[1]) | (sel[0] & in1[1]);
assign buffer_1[1] = (~sel[0] & in0[0]) | (sel[0] & in1[0]);
assign buffer_2[0] = (~sel[0] & in2[1]) | (sel[0] & in3[1]);
assign buffer_2[1] = (~sel[0] & in2[0]) | (sel[0] & in3[0]);

assign out[1] = (~sel[1] & buffer_1[0]) | (sel[1] & buffer_2[0]);
assign out[0] = (~sel[1] & buffer_1[1]) | (sel[1] & buffer_2[1]);

endmodule

module display(
	in,
	hex
);

input [1:0] in;
output [6:0] hex;

assign hex[0] = (~in[1] & ~in[0]) + (in[1] & ~in[0]);
assign hex[1] = (~in[1] & in[0]);
assign hex[2] = (~in[1] & in[0]);
assign hex[3] = (in[1] & ~in[0]);
assign hex[4] = (in[1] & ~in[0]);
assign hex[5] = (~in[1] & ~in[0]) + (in[1] & ~in[0]);
assign hex[6] = (in[1] & ~in[0]) + (in[1] & in[0]);

endmodule


module Part5(

	SW,
	HEX0,
	HEX1,
	HEX2,
	HEX3
);

input  [9:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;

wire [1:0] mux0_out;
wire [1:0] mux1_out;
wire [1:0] mux2_out;
wire [1:0] mux3_out;

two_bit_4to1_mux(SW[1:0], SW[3:2], SW[5:4], SW[7:6], SW[9:8], mux0_out);
two_bit_4to1_mux(SW[3:2], SW[5:4], SW[7:6], SW[1:0], SW[9:8], mux1_out);
two_bit_4to1_mux(SW[5:4], SW[7:6], SW[1:0], SW[3:2], SW[9:8], mux2_out);
two_bit_4to1_mux(SW[7:6], SW[1:0], SW[3:2], SW[5:4], SW[9:8], mux3_out);

wire [6:0] display_out0;
wire [6:0] display_out1;
wire [6:0] display_out2;
wire [6:0] display_out3;

display(mux0_out, display_out0);
display(mux1_out, display_out1);
display(mux2_out, display_out2);
display(mux3_out, display_out3);


assign HEX0 = display_out0;
assign HEX1 = display_out1;
assign HEX2 = display_out2;
assign HEX3 = display_out3;


endmodule

