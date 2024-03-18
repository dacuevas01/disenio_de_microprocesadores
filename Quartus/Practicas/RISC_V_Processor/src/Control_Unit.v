module Control_Unit
(
	input 			clk,
	input 			reset,
	
	//CONTROL SIGNALS
	input		[6:0]	Op,
	input 	[2:0] Funct3,
	input		[6:0]	Funct7,
	input				Zero,
	
	output  			PCWrite,
	output			RegWrite,
	output 			MemWrite,
	output 			IRWrite,
	output	[1:0]	ResultSrc,
	output 	[1:0]	ALUSrcB,
	output 	[1:0]	ALUSrcA,
	output 	[2:0]	ALUControl,
	output 	[1:0]	ADRSrc,
	output	[2:0] ImmSrc
);
	
	wire			PCUpdate;
	wire			Branch;
	wire	[1:0]	ALUOp;
	
	
Control_Signals State_and_Signals(
												.clk			(clk),
												.reset		(reset),
												.Op			(Op),
												.Branch		(Branch),	
												.PC_Update	(PCUpdate),
												.Reg_Write	(RegWrite),
												.Mem_Write	(MemWrite),
												.IR_Write	(IRWrite),
												.Result_Src	(ResultSrc),
												.ALU_Src_B	(ALUSrcB),
												.ALU_Src_A	(ALUSrcA),
												.AdrSrc		(ADRSrc),
												.ALU_Op		(ALUOp)
);
	
	
	
	ALU_Decoder	Operation	(
										.ALU_Op			(ALUOp),
										.Funct3			(Funct3),
										.Funct7			(Funct7),
										.ALUControl		(ALUControl)
									);
									
	Instr_Decoder Instant_Dec (
										.Op			(Op),
										.ImmSrc		(ImmSrc)
									);
									
	
	assign PCWrite = PCUpdate | (Branch & Zero);
	
endmodule
