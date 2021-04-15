`timescale 1ns/1ns
module MUX4to1(input s0,s1,a,b,c,d,output w);
	assign #40 w = (~s1&~s0&a)|(~s1&s0&b)|(s1&~s0&c)|(s1&s0&d);
endmodule