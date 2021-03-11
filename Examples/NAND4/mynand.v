`timescale 1ns/1ns
module mynand(input a,b,output w);
	supply1 vdd;
	supply0 gnd;
	wire y;
	pmos #(4,6,8) T1(w,vdd,a);
	pmos #(4,6,8) T2(w,vdd,b);
	nmos #(3,5,7) T3(y,gnd,b);
	nmos #(3,5,7) T4(w,y,a);
endmodule