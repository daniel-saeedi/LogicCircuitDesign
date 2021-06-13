`include "../simulation/modelsim/moore10010.vo"
`include "../mealy/simulation/modelsim/mealy10010.vo"
`timescale 1 ns/ 1 ps
module TB();
	reg cclk = 0,jj,rrst;
	wire moore;
	wire mealy;
	moore10010 CUT1(cclk,rrst,jj,moore);
	mealy10010 CUT2(cclk,rrst,jj,mealy);
	reg diff;
	
	assign #1 diff = moore ^ mealy;

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