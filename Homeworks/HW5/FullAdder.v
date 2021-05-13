module FA(input a,b,ci,output co,sum);
	assign {co,sum} = a+b+ci;
endmodule