module Controller (
	input wire [5:0] OpCode, Func,
	input wire Zero,
	output wire RegWSrc, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg,
	output wire [1:0] RegDst, PCSrc,
	output wire [2:0] ALUOperation
);

	wire [11:0] allOutputs;
	assign { RegDst, RegWSrc, RegWrite, ALUSrc, ALUOperation, MemRead, MemWrite, MemToReg, PCSrc } = allOutputs;

	assign allOutputs = (
		OpCode == 6'b000000 ? (
			Func == 6'b000001 ? 13'b01_1_1_0_000_0_0_0_00 :
			Func == 6'b000010 ? 13'b01_1_1_0_001_0_0_0_00 :
			Func == 6'b000100 ? 13'b01_1_1_0_010_0_0_0_00 :
			Func == 6'b001000 ? 13'b01_1_1_0_011_0_0_0_00 :
			Func == 6'b010000 ? 13'b01_1_1_0_100_0_0_0_00 :
			13'b00_0_0_0_000_0_0_0_00
		) :
		OpCode == 6'b000001 ? 13'b00_1_1_1_000_0_0_0_00 :
		OpCode == 6'b000010 ? 13'b00_1_1_1_100_0_0_0_00 :
		OpCode == 6'b000011 ? 13'b00_1_1_1_000_1_0_1_00 :
		OpCode == 6'b000100 ? 13'b00_0_0_1_000_0_1_0_00 :
		OpCode == 6'b000101 ? (
			Zero == 1 ? 13'b00_0_0_0_001_0_0_0_01 : 13'b00_0_0_0_001_0_0_0_00
		) :
		OpCode == 6'b000110 ? 13'b00_0_0_0_000_0_0_0_10 :
		OpCode == 6'b000111 ? 13'b00_0_0_0_000_0_0_0_11 :
		OpCode == 6'b001000 ? 13'b10_0_1_0_000_0_0_0_10 :
		13'b00_0_0_0_000_0_0_0_00
	);

endmodule
