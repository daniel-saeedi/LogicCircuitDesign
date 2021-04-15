`timescale 1ns/1ns
module SixteenMux(input [0:15] data,input [3:0] s,output w);
	wire g,p,t,z;
	MUX4to1V2 CUT1({data[0],data[1],data[2],data[3]},{s[1],s[0]},g);
	MUX4to1V2 CUT2({data[4],data[5],data[6],data[7]},{s[1],s[0]},p);
	MUX4to1V2 CUT3({data[8],data[9],data[10],data[11]},{s[1],s[0]},t);
	MUX4to1V2 CUT4({data[12],data[13],data[14],data[15]},{s[1],s[0]},z);
	MUX4to1V2 CUT5({g,p,t,z},{s[3],s[2]},w);
endmodule