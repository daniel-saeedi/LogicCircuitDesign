`timescale 1ns/1ns
module MUXComparison();
	wire mux1_output,mux2_output;
	reg ss0,ss1,aa,bb,cc,dd;
	//Mux Problem 3
	MyMuxV2 mux1(ss0,ss1,aa,bb,cc,dd,mux1_output);
	//Mux Problem 4
	MyMUX2 mux2(ss0,ss1,aa,bb,cc,dd,mux2_output);
	initial begin
	#10 ss1 = 0; ss0 = 0; aa = 1;bb = 0; cc = 0;dd = 0;
	#50 ss1 = 1; ss0 = 1; aa = 1;bb = 0; cc = 1;dd = 0;
	#50 ss1 = 0; ss0 = 1; aa = 0;bb = 1; cc = 1;dd = 0;
	#50 ss1 = 1; ss0 = 0; aa = 0;bb = 1; cc = 0;dd = 0;
	#50 ss1 = 0; ss0 = 0; aa = 0;bb = 1; cc = 1;dd = 0;
	#50 ss1 = 1; ss0 = 0; aa = 0;bb = 1; cc = 0;dd = 0;
	#50 ss1 = 0; ss0 = 1; aa = 0;bb = 0; cc = 1;dd = 0;
	#50 ss1 = 1; ss0 = 1; aa = 0;bb = 1; cc = 1;dd = 1;
	#50 $stop;
	end
endmodule