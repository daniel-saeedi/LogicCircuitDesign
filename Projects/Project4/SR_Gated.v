`timescale 1ns/1ns
module SR_Latch(input S, R , CLK, output Q, Q_bar);
	wire g,p;
	nand #8 G1(g,S,CLK);
	nand #8 G2(p,R,CLK);

	nand #8 G3(Q,g,Q_bar);
	nand #8 G4(Q_bar,p,Q);
endmodule
