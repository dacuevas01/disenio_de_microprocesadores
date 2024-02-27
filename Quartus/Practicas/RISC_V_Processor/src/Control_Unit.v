module Control_Unit
(
	input 			clk,
	input 			reset,
	
	//CONTROL SIGNALS
	input		[5:0]	Op,
	input 	[5:0] Funct,
	input				Zero,
	
	output  			PC_En,
	output			I_or_D,
	output 			Mem_Write,
	output 			IR_Write,
	output 	[1:0]	Reg_Dst,
	output 	[1:0]	Mem_to_Reg,
	output 			Reg_Write,
	output 			ALU_Src_A,
	output 	[1:0]	ALU_Src_B,
	output 	[2:0]	ALU_Control,
	output 	[1:0]	PC_Src,
	output	[1:0] ImmSrc
);
	
	wire			PC_Write;
	wire			Branch;
	wire	[1:0]	ALU_Op;
	
	Control_Signals	State_and_Signals	(
														.clk			(clk),
														.reset		(reset),
														.Op			(Op),
														.Funct		(Funct),
														.PC_Write	(PC_Write),
														.I_or_D		(I_or_D),
														.Mem_Write	(Mem_Write),
														.IR_Write	(IR_Write),
														.Reg_Dst		(Reg_Dst),
														.Mem_to_Reg	(Mem_to_Reg),
														.Reg_Write	(Reg_Write),
														.ALU_Src_A	(ALU_Src_A),
														.ALU_Src_B	(ALU_Src_B),
														.ALU_Op		(ALU_Op),
														.PC_Src		(PC_Src),
														.Branch		(Branch)
													);
	
	ALU_Decoder	Operation	(
										.ALU_Op			(ALU_Op),
										.Funct			(Funct),
										.ALU_Control	(ALU_Control)
									);
									
	Instr_Decoder Instant_Dec (
										.Op			(Op),
										.ImmSrc		(ImmSrc)
									);
									
	
	assign PC_En = PC_Write | (Branch & Zero);
	
endmodule
