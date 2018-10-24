// Lab Part 3

module Part3(
	
	SW,
	LEDR

);

input [9:0] SW;
output [1:0] LEDR;

wire [1:0] U;
wire [1:0] V;
wire [1:0] W;
wire [1:0] X;
wire [1:0] out;
wire [1:0] sel;
wire [1:0] buffer_1;
wire [1:0] buffer_2;

assign U = SW[1:0];
assign V = SW[3:2];
assign W = SW[5:4];
assign X = SW[7:6];
assign sel = SW[9:8];

assign buffer_1[1] = (~sel[0] & U[1]) | (sel[0] & V[1]);
assign buffer_1[0] = (~sel[0] & U[0]) | (sel[0] & V[0]);
assign buffer_2[1] = (~sel[0] & W[1]) | (sel[0] & X[1]);
assign buffer_2[0] = (~sel[0] & W[0]) | (sel[0] & X[0]);

assign LEDR[1] = (~sel[1] & buffer_1[0]) | (sel[1] & buffer_2[0]);
assign LEDR[0] = (~sel[1] & buffer_1[1]) | (sel[1] & buffer_2[1]);

endmodule
