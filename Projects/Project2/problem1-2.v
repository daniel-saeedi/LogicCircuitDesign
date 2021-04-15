`timescale 1ns/1ns
module MUX4to1V2(input [0:3] data,input [1:0] s,output w);
	assign #40 w = (s == 2'b00) ? data[0] :
				   (s == 2'b01) ? data[1] :
				   (s == 2'b10) ? data[2] :
				   (s == 2'b11) ? data[3] :
				   1'bx;
endmodule