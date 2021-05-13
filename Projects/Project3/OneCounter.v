`timescale 1ns/1ns
module OnesCounter #(parameter levels = 6) (input [0 : 2 ** (levels + 1) - 2] in, output [levels : 0] out);
	wire c[1:2**levels];
	wire [levels-1:0] w[1:2**levels];
	assign out = {c[1], w[1]};
	genvar i, j;
	generate
		for(i = 0; i < levels; i = i + 1) begin
			for(j = 2 ** i; j < 2 ** (i + 1); j = j + 1) begin
				if(i < levels - 1)
					RCA_behavioural #(levels - i) XX({c[2 * j], w[2 * j][levels - i - 2 : 0]}, {c[2 * j + 1], 
						w[2 * j + 1][levels - i - 2 : 0]}, in[j - 1], w[j][levels - i - 1 : 0], c[j]);
				else
					RCA_behavioural #(levels - i) XX(in[2 * j - 1], in[2 * j + 1 - 1], in[j - 1], 
						w[j][levels - i - 1 : 0], c[j]);
			end
		end
	endgenerate
endmodule