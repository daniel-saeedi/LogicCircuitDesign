// LFSR with x^8+x^7+x^6+x^3+1 polynomial
module LFSR#(parameter N = 8)( input clk, reset, output [N:0] q);

	reg [N:0] r_reg;
	wire [N:0] r_next;
	wire feedback_value;
	                        
	always @(posedge clk, posedge reset)
	begin 
	    if (reset)
	        begin
	        r_reg <= 1;
	        end     
	    else if (clk == 1'b1)
	        r_reg <= r_next;
	end
	assign feedback_value = r_reg[8] ^ r_reg[7] ^ r_reg[6] ^ r_reg[3] ^ r_reg[0];

	assign r_next = {feedback_value, r_reg[N:1]};
	assign q = r_reg;
endmodule