`timescale 1ns/1ns
module MyNandTB();
	//Inputs
	reg aa,bb;
	//The NAND output
	wire ww;
	MyNAND CUT1(aa,bb,ww);
	initial begin
	#10 aa = 1;bb = 1;
	#25 aa = 1;bb = 0;
	#25 aa = 1;bb = 1;
	#25 aa = 0;bb = 0;
	#25 aa = 1;bb = 1;
	#25 aa = 0;bb = 1;
	#25
	repeat(15) #15 aa = ~aa; bb = ~bb;
	#30 $stop;
	end
endmodule