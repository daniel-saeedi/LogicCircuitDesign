`timescale 1ns/1ns
module OutputWrapper(input clk,rst,ready,gotData,input [31:0] inBus,output [31:0] outBus,output reg oBufferReady,oBufferEmpty,InitBS);
	reg [31:0] ResultReg;
	parameter [2:0] Empty = 3'b000,ReceiveData = 3'b001, waitForGot = 3'b010,
			   makeSureGot = 3'b011;
	reg [2:0] ns,ps;
	reg ldO;
	always @(ps,ready,inBus) begin
		{InitBS,oBufferEmpty,ldO} = 3'b000;
		case (ps)
			Empty : begin 
				ns <= ready ? ReceiveData : Empty;
				oBufferEmpty <= 1'b1;
			end
			ReceiveData : begin
				InitBS <= 1'b1;
				ns <= waitForGot;
			end
			waitForGot : begin
				ns <= gotData ? makeSureGot : waitForGot;
			end
			makeSureGot : begin
				ns <= gotData ? waitForGot : Empty;
			end
		endcase
	end

	always @(posedge clk,posedge rst) begin
		if(rst) begin
			ps <= Empty;
			ResultReg <= 32'b0;
		end
		else
			ps <= ns;
	end

endmodule