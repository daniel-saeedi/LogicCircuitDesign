`timescale 1ns / 1ns
module OnesCounterTB();
	reg [126 : 0] numb;
	wire [6 : 0] out;
	OnesCounter #6 onecounter(numb,out);
	initial begin
		//Marching-1
		#1000 numb = 127'b0;
		repeat(127*2) begin
			#1000 numb = {~numb[0], numb[126 : 1]};
		end

		//Other tests
		#1000 numb = 127'b101111100011111111111111000000;
		#1000 numb = 127'b10111110001111111111111100001100110011;
		#1000 numb = 127'b1011111000111111111111110000001111111111;
		#1000 numb = 127'b10111110001111111111111100000011111111110000000000000111111111;
		#1000 $stop;
	end
endmodule
