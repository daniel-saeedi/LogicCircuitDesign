`timescale 1ns/1ns
module FA_structural(input a,b,cin,output s,co);
	wire w1,w2,w3;
	xor #23 g1(w1,a,b);
	xor #23 g2(s,w1,cin);
	and #14 g3(w2,w1,cin);
	and #14 g4(w3,a,b);
	or #17 g5(co,w2,w3);
endmodule
