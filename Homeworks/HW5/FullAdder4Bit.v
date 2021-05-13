module FA4Bit(input [3:0] a,b,input ci,output co,output [3:0] sum);
	assign {co,sum} = a+b+ci;
endmodule