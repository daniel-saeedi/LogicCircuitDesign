`timescale 1ns/1ns
module mynandTB();
	reg aa,bb;
	wire ww;
	mynand CUT1(aa,bb,ww);
	initial begin
		#14 aa=1;bb = 1;
		#20 $stop;
	end
endmodule