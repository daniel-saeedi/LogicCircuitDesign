`timescale 1ns/1ns
module mynandTB();
	reg aa = 1,bb = 0;
	wire ww;
	mynand CUT1(aa,bb,ww);
	initial begin
		#20 aa=1;bb = 1;
		#20 $stop;
	end
endmodule