`timescale 1ps/1ps
module mealy10010TB();
	reg cclk = 0,jj,rrst;
	// wire pre;
	wire post;
	// mealy10010_pre CUT1(cclk,rrst,jj,pre);
	mealy10010 CUT2(cclk,rrst,jj,post);
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