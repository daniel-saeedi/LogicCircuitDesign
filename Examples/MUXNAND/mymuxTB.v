`timescale 1ns/1ns
module mymuxTB();
	reg ss = 0, aa = 1,bb = 1;
	wire yy;
	mymux CUT1(ss,aa,bb,yy);
	initial begin
	#50 $stop;
	end
endmodule
