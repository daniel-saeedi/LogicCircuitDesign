`timescale 1ns/1ns
module SeqMultCont(input startMul, A0, clk, rst, output reg loadA, loadB, loadP, initP, sel, ShiftA, DoneMul);
	wire Co;
	reg [1:0] ps;
	reg [1:0] ns;
	reg init_counter;
	reg inc_counter;
	reg [4:0] Count;
	parameter [1:0] Idle = 2'b00;
	parameter [1:0] Init = 2'b01;
	parameter [1:0] Load = 2'b10;
	parameter [1:0] Shift = 2'b11;

	always @(ps, A0, startMul, Co) begin
		ns = 0;
		{loadA, loadB, initP, sel, ShiftA, DoneMul, loadP} = 7'b0;
		{init_counter, inc_counter} = 2'b0;
			case (	ps)
				Idle: begin ns = startMul ? Init: Idle; DoneMul = 1; end
				Init: begin ns = startMul ? Init: Load; init_counter = 1'b1; initP = 1'b1; end
				Load: begin ns = Shift; loadA = 1; loadB = 1; end
				Shift: begin ns = Co ? Idle: Shift; inc_counter = 1; ShiftA = 1; loadP = 1; sel = A0; end
			endcase
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			ps <= Idle;
		else
			ps <= ns;
	end

	always @(posedge clk, posedge rst) begin
		if (rst)
			Count <= 5'b0;
		else
			if (init_counter)
				Count <= 5'd8;
			else	
				if (inc_counter)
					Count <= Count + 1;
	end

	assign Co = &Count;
endmodule