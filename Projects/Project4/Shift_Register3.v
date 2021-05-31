`timescale 1ns/1ns
module shift_register3(input sin, clk, rs, output reg [7:0] PO);
	always @ (posedge clk,posedge rs) begin
		if (rs)
			 PO <= 8'b0;
		 else
			PO <= {sin, PO[7:1]};
	end
endmodule
