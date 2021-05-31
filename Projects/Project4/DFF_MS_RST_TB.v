`timescale 1ns/1ns
module DFF_MS_RST_TB();
	reg DD;
	reg cclk=1'b1;
	reg reset = 1'b0;
	wire QQ,QQ_bar;

	DFF_MS_RST CUT(DD, cclk, reset, QQ, QQ_bar);

	always #100 cclk=~cclk;

	initial begin 
		#150 DD=1;
		#150 DD=0;
		#150 DD=1; reset = 1;
		#150 DD=1;
		#150 DD=1; reset = 0;
		#150 $stop;
	end
endmodule
