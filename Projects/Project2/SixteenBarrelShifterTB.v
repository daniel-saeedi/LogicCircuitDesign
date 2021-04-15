`timescale 1ns/1ns
module SixteenBShifterTB();
	reg [15:0] i;
	reg [3:0] shift;
	wire [15:0] o;
	SixteenBarrelShifter CUT1(i,shift,o);
	initial begin
		#11 i = 16'b1000000000000000;
		#101 shift = 4'b0000;
		#101 shift = 4'b0001;
		#101 shift = 4'b0010;
		#101 shift = 4'b0011;
		#101 shift = 4'b0100;
		#101 shift = 4'b0101;
		#101 shift = 4'b0110;
		#101 shift = 4'b0111;
		#101 shift = 4'b1000;
		#101 shift = 4'b1001;
		#101 shift = 4'b1010;
		#101 shift = 4'b1011;
		#101 shift = 4'b1100;
		#101 shift = 4'b1101;
		#101 shift = 4'b1110;
		#101 shift = 4'b1111;

		#101 i = 16'b1000000001000000;
		#101 shift = 4'b0000;
		#101 shift = 4'b0001;
		#101 shift = 4'b0010;
		#101 shift = 4'b0011;
		#101 shift = 4'b0100;
		#101 shift = 4'b0101;
		#101 shift = 4'b0110;
		#101 shift = 4'b0111;
		#101 shift = 4'b1000;
		#101 shift = 4'b1001;
		#101 shift = 4'b1010;
		#101 shift = 4'b1011;
		#101 shift = 4'b1100;
		#101 shift = 4'b1101;
		#101 shift = 4'b1110;
		#101 shift = 4'b1111;
		#101 $stop;
	end
endmodule