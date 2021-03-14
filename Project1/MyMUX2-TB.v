`timescale 1ns/1ns
module MyMux2TB();
	wire yy;
	reg ss0,ss1,aa,bb,cc,dd;
	MyMUX2 CUT1(ss0,ss1,aa,bb,cc,dd,yy);
	initial begin
	#10 ss1 = 0; ss0 = 0; aa = 0;bb = 0; cc = 1;dd = 0;
	// #10 ss1 = 0; ss0 = 0; aa = 1;bb = 0; cc = 0;dd = 0;
	// #50 ss1 = 1; ss0 = 1; aa = 1;bb = 0; cc = 1;dd = 0;
	// #50 ss1 = 0; ss0 = 1; aa = 0;bb = 1; cc = 1;dd = 0;
	// #50 ss1 = 1; ss0 = 0; aa = 0;bb = 1; cc = 0;dd = 0;
	// #50 ss1 = 0; ss0 = 0; aa = 0;bb = 1; cc = 1;dd = 0;
	// #50 ss1 = 1; ss0 = 0; aa = 0;bb = 1; cc = 0;dd = 0;
	// #50 ss1 = 0; ss0 = 1; aa = 0;bb = 0; cc = 1;dd = 0;
	// #50 ss1 = 1; ss0 = 1; aa = 0;bb = 1; cc = 1;dd = 1;
	#50 $stop;
	end
endmodule

