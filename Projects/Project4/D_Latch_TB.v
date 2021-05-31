`timescale 1ns/1ns
module D_Latch_TB();
	reg DD;
	reg cclk=1;
	wire QQ,QQ_bar;

	D_Latch CUT1 (DD, cclk, QQ, QQ_bar);

	always #80 cclk=~cclk;

	initial begin 
		#89 DD=1;
		#89 DD=0;
		#89 DD=0;
		#89 DD=1;
		#89 DD=1;
		#89 DD=1;
		#89 DD=0;
		repeat(20) #89 DD = ~DD;
		#89 $stop;
	end
endmodule