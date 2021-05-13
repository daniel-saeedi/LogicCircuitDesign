`timescale 1ns/1ns
module FA_structural_TB();
	reg aa,bb,ccin;
	wire cout,sum;
	FA_structural CUT1(aa,bb,ccin,sum,cout);

	initial begin
		#10 aa = 1; bb = 1; ccin = 1;
		#80 aa = 1; bb = 0; ccin = 0;
		#80 aa = 1; bb = 1; ccin = 0;
		#80 aa = 1; bb = 0; ccin = 0;
		#80 aa = 1; bb = 0; ccin = 1;
		#80 aa = 0; bb = 0; ccin = 0;
		#80 aa = 0; bb = 1; ccin = 1;
		#80 aa = 0; bb = 1; ccin = 0;
		#100 $stop;
	end
endmodule
