
`timescale 1ns/1ns
module RCA_behavioural_TB();
	reg [3:0] aa,bb;
	reg ccin;
	wire cout;
	wire [3:0] sum;
	RCA_behavioural #(4) CUT1 (aa,bb,ccin,sum,cout);

	initial begin
		#10 aa = 4'b0001; bb = 4'b0000; ccin = 1;
		#203 aa = 4'b1111; bb = 4'b0000; ccin = 1;
		#203 aa = 4'b1110; bb = 4'b0001; ccin = 1;
		#203 aa = 4'b1000; bb = 4'b0001; ccin = 0;
		#203 aa = 4'b1111; bb = 4'b0001; ccin = 1;
		#203 aa = 4'b1000; bb = 4'b1111; ccin = 0;
		repeat(10) #203 aa = $random(); bb = $random(); ccin = $random();
		#203 $stop;
	end
endmodule
