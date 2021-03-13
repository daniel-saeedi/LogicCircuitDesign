`timescale 1ns/1ns
module MyTriStateTB();
	wire yy;
	reg aa,enable;
	MyTriStateBuffer CUT1(aa,enable,yy);
	initial begin
	#10 aa = 1;enable = 0;
	#21 aa = 0;enable = 1;
	#21 aa = 1;enable = 1;
	#21 aa = 0;enable = 0;
	#21 aa = 1;enable = 1;
	#20
	repeat(15) #15 aa = ~aa; enable = ~enable;
	#30 $stop;
	end
endmodule