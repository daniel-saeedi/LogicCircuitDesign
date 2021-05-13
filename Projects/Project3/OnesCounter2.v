`timescale 1ns/1ns
module ones_counter_behavioural #(parameter n = 127) 
	(input [n-1:0] A,output reg [n-1:0] count);

	integer i;
	always @ (A) begin
		count = 127'b0;
		for (i = 0; i < n; i = i + 1) begin
			if (A[i] == 1'b1)
				count = count + 1;
		end
	end
endmodule