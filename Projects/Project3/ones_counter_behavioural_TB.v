`timescale 1ns / 1ns
module ones_counter_behavioural_TB();
	reg [126 : 0] numb;
	wire [6 : 0] out;
	ones_counter_behavioural onecounter(numb,out);
	initial begin
		//Marching-1
		#1200 numb = 127'b0;
		repeat(127*2) begin
			#1200 numb = {~numb[0], numb[126 : 1]};
		end

		//Other tests
		#1200 numb = 127'b101111100011111111111111000000;
		#1200 numb = 127'b10111110001111111111111100001100110011;
		#1200 numb = 127'b1011111000111111111111110000001111111111;
		#1200 numb = 127'b10111110001111111111111100000011111111110000000000000111111111;
		#1200 $stop;
	end
endmodule