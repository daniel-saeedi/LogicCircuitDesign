`timescale 1ns/1ns
module MuxTB();
	wire ww;
	reg [1:0] ss;
	reg [0:3] data;
	MUX4to1V2 CUT2(data,ss,ww);
	initial begin
		#11 ss = 2'b00; data = 4'b0001;
		#61 ss = 2'b00; data = 4'b1000;
		#61 ss = 2'b10; data = 4'b0100;
		#61 ss = 2'b10; data = 4'b0010;
		#61 ss = 2'b01; data = 4'b0010;
		#61 ss = 2'b01; data = 4'b0110;
		#61 ss = 2'b11; data = 4'b0110;
		#61 ss = 2'b11; data = 4'b0101;
		#61 $stop;
	end
endmodule