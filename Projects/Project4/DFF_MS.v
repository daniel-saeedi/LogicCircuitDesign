`timescale 1ns/1ns
module DFF_MS(input D, clk, output Q,Q_bar);
	wire q1,q1_bar,clk_not;
	D_Latch D1(D,clk,q1,q1_bar);

	not #6 G1(clk_not,clk);
	D_Latch D2(q1,clk_not,Q,Q_bar);
endmodule