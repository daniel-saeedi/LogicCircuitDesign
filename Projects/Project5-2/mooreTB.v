`timescale 1ps/1ps
module moore10010TB();
	reg cclk = 0,jj,rrst;
	wire ww1;
	wire ww2;
	moore10010 CUT1(cclk,rrst,jj,ww1);
	always #50 cclk = ~cclk;
	initial begin
		#1 rrst = 1;
		#10 rrst = 0;
		#20 jj = 1;
		#30 jj = 0;
		#200 jj = 1;
		#100 jj = 0;
		#110 jj = 0;
		#110 jj = 1;
		#110 jj = 0;

		#200 $stop;
	end
endmodule