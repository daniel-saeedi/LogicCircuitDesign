`timescale 1ns/1ns
module DFF_MS_TB();
	reg DD;
	reg cclk=1'b1;
	wire QQ,QQ_bar;

	DFF_MS CUT(DD, cclk, QQ, QQ_bar);

	always #100 cclk=~cclk;

	initial begin 
		#150 DD=1;
		#150 DD=0;
		#150 DD=0;
		#150 DD=1;
		#150 $stop;
	end
endmodule