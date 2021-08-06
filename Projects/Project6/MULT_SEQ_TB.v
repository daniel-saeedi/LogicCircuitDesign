`timescale 1ns/1ns
module MULT_SEQ_TB();
	reg clk = 1'b0;
	reg rst = 0;
	reg start = 0;
	reg [23:0] A;
	reg [23:0] B;
	wire [47:0] ResultBus;
	wire ready;

	SeqMultTop UUT(clk,rst,start,A,B,ResultBus,ready);

	always #5 clk <= ~clk;

	initial begin
		#3 rst = 1;
		#3 rst = 0;
		#13 A = 23'b00000000000000000001011;
		#13 B = 23'b00000000000000000000011;
		#3 start = 1;
		#13 start = 0;
		#600 $stop;
	end
endmodule