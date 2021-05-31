`timescale 1ns/1ns
module SR_Gated_TB();
	reg SS, RR;
	reg cclk=1'b0;
	wire QQ, QQ_prime;

	SR_Latch CUT1 (SS, RR, cclk, QQ, QQ_prime);

	always #89 cclk=~cclk;

	initial begin
		#89 SS=1;RR=0;
		#89 SS=0;RR=1;
		#89 SS=1;
		#89 SS=1;RR=0;
		#89 SS=1;RR=1;
		#89 SS=0;RR=1;
		#89 SS=1;RR=1;
		#89 SS=0;RR=0;
		#89 $stop;
	end
endmodule