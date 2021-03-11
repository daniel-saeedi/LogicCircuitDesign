`timescale 1ns/1ns
module mymux(input s,a,b,output y);
	wire g,p,w;
	//NOT GATE
	nand #(14,10) nt1(g,s,s);
	nand #(14,10) n1(p,g,a);
	nand #(14,10) n2(w,s,b);
	nand #(14,10) n3(y,w,p);
endmodule