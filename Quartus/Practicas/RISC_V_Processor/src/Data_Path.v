module Data_Path
#
(
	parameter DATA_WIDTH = 32
)
(
	//INPUTS
	input 			clk,
	input 			reset,
	input 	[7:0]	GPIO_i,
	
	//OUTPUTS
	output 	[7:0] GPIO_o,
	
	//CONTROL SIGNALS
	input 			PCWrite,
	input 			RegWrite,
	input 			MemWrite,
	input 			IRWrite,
	input 			ResultSrc,
	input 			ALUSrcB,
	input 			ALUSrcA,
	input 			ALUControl,
	input 			ADRSrc,
	input 			ImmSrc,
	
	output			Zero,
	output	[6:0]	Op,
	output 	[2:0] Funct3,
	output	[6:0]	Funct7
);

	wire	[DATA_WIDTH-1:0]	PCNext;
	wire	[DATA_WIDTH-1:0]	PC;
	wire	[DATA_WIDTH-1:0]	Adr;
	wire	[DATA_WIDTH-1:0]	ReadData;
	wire	[DATA_WIDTH-1:0]	Instr;
	wire	[DATA_WIDTH-1:0]	Data;
	wire	[DATA_WIDTH-1:0]	OldPC;
	//wire	[4:0]					Write_Register;
	wire	[DATA_WIDTH-1:0]	Result;
	wire	[DATA_WIDTH-1:0]	RD1;
	wire	[DATA_WIDTH-1:0]	RD2;
	wire	[DATA_WIDTH-1:0]	A;
	wire	[DATA_WIDTH-1:0]	B;
	wire	[DATA_WIDTH-1:0]	SrcA;
	wire	[DATA_WIDTH-1:0]	SrcB;
	wire	[DATA_WIDTH-1:0]	ALUResult;
	wire	[DATA_WIDTH-1:0]	ALUOut;	
	wire	[27:0]	PC_Jump;	
	wire 	[DATA_WIDTH-1:0]	ImmExt_w;

	Register	#
				(
					.RESET_VALUE(32'h400000)
				)
				Program_Counter
				(
					.clk		(clk),
					.reset	(reset),
					.enable	(PCWrite),
					.d			(Result),
					.q			(PC)
				);
	
	Mux2x1	Instr_or_Data	(
										.Selector	(ADRSrc),
										.I_0			(PC),
										.I_1			(Result),
										.Mux_Out		(Adr)
									);
			
	Memory_System	ROM_RAM	(
										.clk					(clk),
										.Write_Enable_i	(MemWrite),
										.Write_Data_i		(B),
										.Address_i			(Adr),
										.Instruction_o		(ReadData)
									);
	
	Register	Instruction_Register	(
												.clk		(clk),
												.reset	(reset),
												.enable	(IRWrite),
												.d			(ReadData),
												.q			(Instr)
											);
											
	Register OldPC_Register (
												.clk		(clk),
												.reset	(reset),
												.enable	(IRWrite),
												.d			(PC),
												.q			(OldPC)
											);
											
			
	Register	Data_Register	(
										.clk		(clk),
										.reset	(reset),
										.enable	(1'b1),
										.d			(ReadData),
										.q			(Data)
									);
									
	/*Mux4x1	#
				(
					.DATA_WIDTH	(5)
				)
				Rrt_or_Rrd
				(
					.Selector	(Reg_Dst),
					.I_0			(Instr[20:16]),
					.I_1			(Instr[15:11]),
					.I_2			(5'd31),
					.I_3			(0),
					.Mux_Out		(Write_Register)
				);
	
	Mux4x1	Write_Data_Mux	(
										.Selector	(Mem_to_Reg),
										.I_0			(ALU_Out),
										.I_1			(Data),
										.I_2			({24'b0,GPIO_i}),
										.I_3			(0),
										.Mux_Out		(Write_Data)
									);*/
									
	Register_File	Reg_File	(
										.clk						(clk),
										.reset					(reset),
										.Reg_Write_i			(RegWrite),
										.Write_Register_i		(Instr[11:7]),
										.Read_Register_1_i	(Instr[19:15]),
										.Read_Register_2_i	(Instr[24:20]),
										.Write_Data_i			(Result),
										.Read_Data_1_o			(RD1),
										.Read_Data_2_o			(RD2)
									);
	
	/*Register	GPIO_Out_Register	(
											.clk		(clk),
											.reset	(reset),
											.enable	(((WriteRegister == 5'd23) & !SrcA) ? 1'b1 : 1'b0),
											.d			(WriteData),
											.q			(GPIO_o[7:0])
										);*/	
	
	Register	A_Register	(
									.clk		(clk),
									.reset	(reset),
									.enable	(1'b1),
									.d			(RD1),
									.q			(A)
								);
								
	Register	B_Register	(
									.clk		(clk),
									.reset	(reset),
									.enable	(1'b1),
									.d			(RD2),
									.q			(B)
								);
								
	Sign_Extend	Sign_Ext	(
									.Instr				(Instr[31:0]),
									.ImmSrc				(ImmSrc),
									.ImmExt				(ImmExt_w)
								);

	
	
	//Shift_Left_2 Branch_Shift	(
	//										.Ext_Imm			(Sign_Imm),
	//										.Shifted_Imm	(Shifted_Imm)
	//									);
	
	Mux3x1	A_Input	(
								.Selector	(ALUSrcA),
								.I_0			(PC),
								.I_1			(OldPC),
								.I_2			(A),
								.Mux_Out		(SrcA)
							);
							
	Mux3x1	B_Input	(
								.Selector	(ALUSrcB),
								.I_0			(B),
								.I_1			(ImmExt_w),
								.I_2			(4),
								.Mux_Out		(SrcB)
							);
	
	ALU	ALU	(
						.Control	(ALUControl),
						.A			(SrcA),
						.B			(SrcB),
						.Result	(ALUResult)
					);
	
	Register	Result_Register	(
											.clk		(clk),
											.reset	(reset),
											.enable	(1'b1),
											.d			(ALUResult),
											.q			(ALUOut)
										);
								
	/*Shift_Left_2	#
						(
							.DATA_WIDTH	(28)
						)
						Jump_Shift	
						(
							.Ext_Imm			({2'b0,Instr[25:0]}),
							.Shifted_Imm	(PC_Jump)
						);

	Mux4x1	Program_Count_Source	(
												.Selector	(PC_Src),
												.I_0			(ALU_Result),
												.I_1			(ALU_Out),
												.I_2			({4'b0,PC_Jump}),
												.I_3			(0),
												.Mux_Out		(PC_Next)
											);	*/
	Mux3x1 Result_Source (
								.Selector	(ResultSrc),
								.I_0			(ALUOut),
								.I_1			(Data),
								.I_2			(ALUResult),
								.Mux_Out		(Result)
							);	
	
	
	assign Op = Instr[6:0];
	assign Funct3 = Instr[14:12];
	assign Funct7 = Instr[31:25];
	//assign GPIO_o = ALU_Result[7:0];
	assign Zero = !ALUResult;
								
endmodule
