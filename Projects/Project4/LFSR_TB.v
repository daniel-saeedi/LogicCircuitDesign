`timescale 1ns/1ns
module LFSR_TB();
	reg cclk = 1'b0;
	reg rrs = 1'b0;
	wire [8:0] q;
	LFSR CUT2(cclk,rrs,q);
	always #100 cclk = ~cclk;
	initial begin
		#50 rrs = 1;
		#50 rrs = 0;
		#50000 $stop;
	end
endmodule