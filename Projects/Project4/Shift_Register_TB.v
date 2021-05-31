`timescale 1ns/1ns
module shift_register_TB();
	reg ssin;
	reg cclk = 1'b1;
	//Primary Output
	wire [7:0] PPO;

	shift_register CUT1(ssin, cclk, PPO);

	always  #600 ssin=$random;
	always  #500 cclk=~cclk;
	initial begin
		#12000 $stop;
	end
endmodule