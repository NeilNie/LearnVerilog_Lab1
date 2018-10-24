//
// Part 4 Verilog 
// Neil Nie
// (C) Oct 24th, 2018
// Seven Segment Decoder

module Part4(

	SW,
	HEX0

);

input [1:0] SW;
output [6:0] HEX0;

wire [1:0] in;

assign in = SW;

assign HEX0[0] = in[1] & ~in[0];
assign HEX0[1] = (~in[1] & ~in[0]) + (in[1] & ~in[0]);
assign HEX0[2] = 0;
assign HEX0[3] = 0;
assign HEX0[4] = (~in[1] & in[0]) + (in[1] & ~in[0]);
assign HEX0[5] = ~in[1] & in[0];
assign HEX0[6] = ~in[1] & ~in[0];

endmodule
