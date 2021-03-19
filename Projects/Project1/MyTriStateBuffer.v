`timescale 1ns/1ns
module MyTriStateBuffer (input a,en,output y);
	wire g,w,z;
	supply1 Vdd;
	supply0 Gnd;
	MyInverter InverterGate(en,g);
	pmos #(5,6,7) T1(w,Vdd,a);
	pmos #(5,6,7) T2(y,w,g);
	nmos #(3,4,5) T3(y,z,en);
	nmos #(3,4,5) T4(z,Gnd,a);
endmodule