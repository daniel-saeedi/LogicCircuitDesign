`timescale 1ns/1ns
module RCA_structural #( parameter SIZE = 8 )
					(input [SIZE-1:0] A,B,input cin, output [SIZE-1:0] sum,output co);
	wire [0:SIZE] carry_in;
	assign carry_in[0] = cin;
	genvar i;
	generate
		for(i = 0; i < SIZE; i = i + 1) begin
			FA_structural XX(A[i],B[i],carry_in[i],sum[i],carry_in[i+1]);
		end
	endgenerate
	assign co = carry_in[SIZE];
endmodule
