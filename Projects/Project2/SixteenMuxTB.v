`timescale 1ns/1ns
module SixteenMuxTB();
	wire ww;
	reg [3:0] ss;
	reg [0:15] data;
	SixteenMux CUT1(data,ss,ww);
	initial begin
		#11 ss = 4'b0; data = 16'b0;
		#100 ss = 4'b0; data = 16'b1000000000000000;
		#100 ss = 4'b0001; 
		#100 data = 16'b0100000000000000;
		#100 ss = 4'b0010;
		#100 data = 16'b0010000000000000;
		#100 ss = 4'b1010;
		#13 data = 16'b0010000000100000;
		#100 ss = 4'b1111;
		#13 data = 16'b0000000000000001;
		#200 $stop;
	end
endmodule
