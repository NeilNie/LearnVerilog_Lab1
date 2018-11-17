// 
// Learning Verilog
// Lab 1
// Neil Nie, (c) 2018
//

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
