`timescale 1ns/1ns
module FourBitBarrelShifterTB();
	reg [3:0] i;
	reg [1:0] shift;
	wire [3:0] o;
	FourBitBarrelShifter CUT1(i,shift,o);
	initial begin
		#10 i = 4'b1000; shift = 2'b00;
		#83 i = 4'b1000; shift = 2'b01;
		#83 i = 4'b1000; shift = 2'b10;
		#83 i = 4'b1000; shift = 2'b11;

		#83 i = 4'b1001; shift = 2'b00;
		#83 i = 4'b1001; shift = 2'b01;
		#83 i = 4'b1001; shift = 2'b10;
		#83 i = 4'b1001; shift = 2'b11;

		#83 i = 4'b1100; shift = 2'b00;
		#83 i = 4'b1100; shift = 2'b01;
		#83 i = 4'b1100; shift = 2'b10;
		#83 i = 4'b1100; shift = 2'b11;

		#83 i = 4'b0110; shift = 2'b00;
		#83 i = 4'b0110; shift = 2'b01;
		#83 i = 4'b0110; shift = 2'b10;
		#83 i = 4'b0110; shift = 2'b11;

		#83 i = 4'b0011; shift = 2'b00;
		#83 i = 4'b0011; shift = 2'b01;
		#83 i = 4'b0011; shift = 2'b10;
		#83 i = 4'b0011; shift = 2'b11;

		#83 i = 4'b0101; shift = 2'b00;
		#83 i = 4'b0101; shift = 2'b01;
		#83 i = 4'b0101; shift = 2'b10;
		#83 i = 4'b0101; shift = 2'b11;
		#83 $stop;
	end
endmodule