`timescale 1ns/1ns
module SeqMultTop(input clk, rst, startMul, input [23:0] A, input [23:0] B, output [47:0] ResultBus, output DoneMul);
	wire A0, loadA, loadB, loadP, initP, ShiftA, sel;

	SeqMult DataPath(B, A, clk, rst, loadA, ShiftA, loadP, loadB, initP, sel, ResultBus, A0);
	SeqMultCont Controller(startMul, A0, clk, rst, loadA, loadB, loadP, initP, sel, ShiftA, DoneMul);

endmodule