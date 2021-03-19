`timescale 1ns/1ns
module MyInverter (input a,output w);
	supply1 Vdd;
	supply0 Gnd;
	pmos #(5,6,7) T1(w,Vdd,a);
	nmos #(3,4,5) T2(w,Gnd,a);
endmodule