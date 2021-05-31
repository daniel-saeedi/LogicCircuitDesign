`timescale 1ns/1ns
module D_Latch(input D, clk, output Q, Q_BAR);
	wire D_BAR;

	not #6 G1(D_BAR,D);

	SR_Latch CUT1(D, D_BAR, clk, Q, Q_BAR);
endmodule