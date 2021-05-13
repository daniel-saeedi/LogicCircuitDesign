
`timescale 1ns/1ns
module RCA_structural_TB();
	reg [7:0] aa,bb;
	reg ccin;
	wire cout;
	wire [7:0] sum;
	RCA_structural #(8) CUT1 (aa,bb,ccin,sum,cout);

	initial begin
		#10 aa = 8'b00000001; bb = 8'b00000000; ccin = 1;
		#371 aa = 8'b00000001; bb = 8'b00000011; ccin = 0;
		#371 aa = 8'b00111001; bb = 8'b10000111; ccin = 1;
		#371 aa = 8'b11111111; bb = 8'b00000001; ccin = 0;
		#371 aa = 8'b11111111; bb = 8'b00000001; ccin = 0;
		#371 aa = 8'b11111111; bb = 8'b10000001; ccin = 1;
		#203 $stop;
	end
endmodule
