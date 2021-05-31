`timescale 1ns/1ns
module DFF_MS_RST(input D, clk, rst, output Q,Q_bar);
	wire D2;
	assign D2 = D & ~rst;

	DFF_MS CUT(D2, clk, Q, Q_bar);
endmodule