`timescale 1ns/1ns
module MyMux(
	input s0,s1,a,b,c,d,
	output y
);
	wire s0_not,s1_not,g,p,t,z;
	TwoInputNAND nand_1(s0,s0,s0_not);
	TwoInputNAND nand_2(s1,s1,s1_not);
	ThreeInputsNand nand_3(a,s1_not,s0_not,g);
	ThreeInputsNand nand_4(b,s1_not,s0,p);
	ThreeInputsNand nand_5(c,s1,s0_not,t);
	ThreeInputsNand nand_6(d,s1,s0,z);
	FourInputsNand nand_7(g,p,t,z,y); 
endmodule
