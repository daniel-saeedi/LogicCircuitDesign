`timescale 1ns/1ns
module shift_register2_TB();
	reg ssin;
	reg cclk = 1'b1;
	reg reset = 1'b0;
	//Primary Output
	wire [7:0] PPO;

	shift_register2 CUT1(ssin, cclk, reset , PPO);

	always  #600 ssin=$random;
	always  #500 cclk=~cclk;
	initial begin
		#12000 $stop;
	end
endmodule