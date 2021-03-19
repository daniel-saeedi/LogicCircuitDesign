`timescale 1ns/1ns
module MyMUX(
	input s0,s1,a,b,c,d,
	output y
);
	wire s0_not,s1_not,g,p,t,z;
	nand #(10,8) nand_1(s0_not,s0,s0);
	nand #(10,8) nand_2(s1_not,s1,s1);
	nand #(10,8) nand_3(g,a,s1_not,s0_not);
	nand #(10,8) nand_4(p,b,s1_not,s0);
	nand #(10,8) nand_5(t,c,s1,s0_not);
	nand #(10,8) nand_6(z,d,s1,s0);
	nand #(10,8) nand_7(y,g,p,t,z); 
endmodule