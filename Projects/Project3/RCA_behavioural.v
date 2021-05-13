`timescale 1ns/1ns
module RCA_behavioural #(parameter n = 8) 
	(input [n-1:0] A,B,input cin,output [n-1:0] s, output co);
	assign #(46*n) {co,s} = A + B + cin;
endmodule