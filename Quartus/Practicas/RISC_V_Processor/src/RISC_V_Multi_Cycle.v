module RISC_V_Multi_Cycle
(
	input 			clk,
	input 			reset,
	input		[7:0]	GPIO_In,
	
	output	[7:0]	GPIO_Out
);

	wire	[6:0]	Op_w;
	wire	[3:0] Funct3_w;
	wire	[6:0]	Funct7_w;
	wire 			PCWrite_w;
	wire 			RegWrite_w;
	wire 			MemWrite_w;
	wire 			IRWrite_w;
	wire	[1:0]	ResultSrc_w;
	wire 	[1:0]	ALUSrcB_w;
	wire	[1:0]	ALUSrcA_w;
	wire 	[2:0]	ALUControl_w;
	wire 	[1:0]	ADRSrc_w;
	wire  [2:0]	ImmSrc_w;
	wire			Zero_w;
	
	wire	[7:0]	GPIO_Out_w;
	
	Control_Unit Control	(
									.clk(clk),
									.reset(reset),
	
									//CONTROL SIGNALS_INPUTS
									.Op(Op_w),
									.Funct3(Funct3_w),
									.Funct7(Funct7_w),
									.Zero(Zero_w),
									
									//CONTROL_SIGNALS_OUTPUTS
									.PCWrite(PCWrite_w),
									.RegWrite(RegWrite_w),
									.MemWrite(MemWrite_w),
									.IRWrite(IRWrite_w),
									.ResultSrc(ResultSrc_w),
									.ALUSrcB(ALUSrcB_w),
									.ALUSrcA(ALUSrcA_w),
									.ALUControl(ALUControl_w),
									.ADRSrc(ADRSrc_w),
									.ImmSrc(ImmSrc_w)
);

	
	Data_Path	#
					(
						.DATA_WIDTH(32)
					)
					DataPath	(
									//INPUTS
									.clk(clk),
									.reset(reset),
									.GPIO_i(GPIO_In),
	
									//OUTPUTS
									.GPIO_o(GPIO_Out_w),
	
									//CONTROL SIGNALS_INPUTS
									.PCWrite(PCWrite_w),
									.RegWrite(RegWrite_w),
									.MemWrite(MemWrite_w),
									.IRWrite(IRWrite_w),
									.ResultSrc(ResultSrc_w),
									.ALUSrcB(ALUSrcB_w),
									.ALUSrcA(ALUSrcA_w),
									.ALUControl(ALUControl_w),
									.ADRSrc(ADRSrc_w),
									.ImmSrc(ImmSrc_w),
									
									//CONTROL SIGNALS_OUTPUTS
									.Zero(Zero_w),
									.Op(Op_w),
									.Funct3(Funct3_w),
									.Funct7(Funct7_w)
								);


endmodule
