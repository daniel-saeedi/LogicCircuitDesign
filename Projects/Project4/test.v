
`timescale 1ns/1ns
module Cnt4bit(input [3:0] PI, input CLK,ci,cnt,rst,ld,output reg [3:0] PO, output co);
	always @(*) begin
		if(rst) PO <= 8'b0;
		else begin
			if(ld)
				PO <= PI;
			else if(cnt)
				PO <= ci ? PO + 1 : PO;
		end
	end

	assign co = cnt ? &{PO,ci} : 1'b0;
endmodule