`timescale 1ns/1ns
module SeqMult(input [23:0] Bbus, input [23:0] Abus, input clk, rst, loadA, ShiftA, loadP, loadB, initP, sel, output [47:0] ResultBus, output A0);
reg [23:0] Areg, Breg, Preg;
wire [24:0] AddBus;
wire [23:0] MuxBus;

	always @(posedge clk, posedge rst) begin
		if (rst)
			Breg <= 24'b0;
		else
			if (loadB)
				Breg <= Bbus;
	end

	always @(posedge clk, posedge rst) begin
		if (rst)
			Preg <= 24'b0;
		else begin
			if (initP)
				Preg <= 24'b0;
			else
				if (loadP)
					Preg <= AddBus[24:1];
		end
	end

	always @(posedge clk, posedge rst) begin
		if (rst)
			Areg <= 24'b0;
		else begin
			if (loadA)
				Areg <= Abus;
			else
				if (ShiftA)
					Areg <= {AddBus[0], Areg[23:1]};
		end
	end

	assign MuxBus = sel ? Breg: 24'b0;
	assign AddBus = MuxBus + Preg;
	assign ResultBus = {Preg, Areg};
	assign 	A0 = Areg[0];


endmodule
