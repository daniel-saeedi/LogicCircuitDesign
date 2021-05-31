`timescale 1ns/1ns
module shift_register2(input sin,clk,rst, output [7:0] PO);
	wire [8:0] Q;
	wire [8:0] Q_BAR;
	assign Q[8] = sin;
	assign PO[0] = Q[0];
	genvar i;
	generate
	for (i=0;i<8;i=i+1) begin: I0
		DFF_MS_RST XX(Q[i+1],clk, rst ,Q[i],Q_BAR[i]);
		assign PO[i]=Q[i];
	end
	endgenerate
endmodule
