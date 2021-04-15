`timescale 1ns/1ns
module FourBitBarrelShifter(input [3:0] A,input [1:0] N,output [3:0] SHO);
	reg [0:3] J,K,L,M;
	wire o0,o1,o2,o3;

	assign J = {A[3],A[0],A[1],A[2]};
	MUX4to1V2 CUT1(J,N,o3);

	assign K = {A[2],A[3],A[0],A[1]};
	MUX4to1V2 CUT2(K,N,o2);

	assign L = {A[1],A[2],A[3],A[0]};
	MUX4to1V2 CUT3(L,N,o1);

	assign M = {A[0],A[1],A[2],A[3]};
	MUX4to1V2 CUT4(M,N,o0);

	assign SHO = {o3,o2,o1,o0};

endmodule