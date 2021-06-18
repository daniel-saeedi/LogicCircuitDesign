`timescale 1ns/1ns
module mealy10010_pre(input clk,rst,j, output w);
	reg [2:0] ns,ps;
	parameter [2:0] A = 3'b0,B = 3'b001,C = 3'b010,D = 3'b011,E = 3'b100;

	//Combinational
	always @(ps,j) begin
		ns = A;
		case(ps)
			A : ns = j ? B : A;
			B : ns = j ? B : C;
			C : ns = j ? B : D;
			D : ns = j ? E : A;
			E : ns = j ? B : C;
			default: ns = A;
		endcase
	end
	
	assign w = (ps == E) ? ~j : 1'b0;
	
	//Sequential
	always @(posedge clk,posedge rst) begin
		if(rst)
			ps <= A;
		else
			ps <= ns;
	end
endmodule