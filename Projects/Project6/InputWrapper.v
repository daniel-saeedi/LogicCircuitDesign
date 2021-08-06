`timescale 1ns/1ns
module InputWrapper(input clk,rst,oBufferReady,dataReady,input [31:0] inBus,output [31:0] outBus,output reg dataAccept);
	reg [31:0] Areg;
	reg [31:0] Breg;
	reg Count;
	parameter [2:0] Idle = 3'b000,Init = 3'b001, GetA = 3'b010,
			   GetB = 3'b011,Accept = 3'b100,waitForBuff = 3'b101, start = 3'b110, calc = 3'b111;
	reg [2:0] ns,ps;
	reg ldA,ldB,InitBS;
	reg CoBS;
	always @(ps,oBufferReady,inBus) begin
		{Idle,Init,GetA,GetB,Accept,waitForBuff,start,calc} = 3'b000;

		case(ps) :
			Idle : ns <= dataReady ? Init : Idle;
			Init : begin
				InitBS <= 1'b1;
				ns <= GetA;
			end
			GetA : begin
				ns <= GetB;
				ldA <= 1'b1;
			end
			GetB : begin
				ns <= Accept;
				ldB <= 1'b1;
			end
			Accept : begin
				ns <= dataReady ? Accept : waitForBuff;
				dataAccept <= 1'b1;
			end
			waitForBuff : begin
				ns <= ready & oBufferReady ? start : waitForBuff;
			end
			start : begin
				ns <= ~ready ? calc : start;
			end
			calc : begin
				ns <= ready && ~CoBS ? start : Idle;
			end			
	end

	always @(posedge clk,posedge rst) begin
		if(rst) begin
			ps <= Idle;
			Areg <= 32'b0;
			Breg <= 32'b0;
			Count <= 1'b0;
			CoBS <= 1'b0;
		end
		else
			ps <= ns;
	end

	always @(CoBS,Count) begin
		if(rst)
			Count <= 1'b0;
		else
			Count <= Count + 1;
	end

	assign CoBS = &Count;
endmodule