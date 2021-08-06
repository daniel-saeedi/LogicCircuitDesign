`timescale 1 ps/ 1 ps
module FPMULT_TB();
	reg cclk = 0,rrst,sstartFP = 0;
	reg [31:0] iinBus;
	wire [31:0] rresBus;
	wire ddoneFP;
	FPMULT2 CUT1(cclk,rrst,iinBus,sstartFP,rresBus,ddoneFP);
	always #50 cclk = ~cclk;
	initial begin
		#1 rrst = 1;
		#10 rrst = 0;
		#100 sstartFP = 1; 
		#80 sstartFP = 0;
		#20 iinBus = 32'b01000001001010110011001100110011; // 10.7
		#60 iinBus = 32'b01000000001000000000000000000000; //2.5

		#5000 $stop;
	end
endmodule