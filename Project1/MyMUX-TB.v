`timescale 1ns/1ns
module MyMuxTB();
	wire yy;
	reg ss0,ss1,aa,bb,cc,dd;
	MyMUX CUT1(ss0,ss1,aa,bb,cc,dd,yy);
	initial begin
	#10 ss0 = 1;ss1 = 1; aa = 0;bb = 0; cc = 0;dd = 1;
	#30
	#15 ss0 = 1;ss1 = 0; aa = 1;bb = 0; cc = 0;dd = 1;
	#20
	#30 $stop;
	end
endmodule
