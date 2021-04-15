`timescale 1ns/1ns
module FourInputsNand(input a,b,c,d,output w);
	wire g,p,z;
	supply1 Vdd;
	supply0 Gnd;
	pmos #(5,6,7) T1(w,Vdd,a);
	pmos #(5,6,7) T2(w,Vdd,b);
	pmos #(5,6,7) T3(w,Vdd,c);
	pmos #(5,6,7) T4(w,Vdd,d);
	nmos #(3,4,5) T5(w,z,a);
	nmos #(3,4,5) T6(z,g,b);
	nmos #(3,4,5) T7(g,p,c);
	nmos #(3,4,5) T8(p,Gnd,d);
endmodule

