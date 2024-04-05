module Data_Path
#
(
	parameter DATA_WIDTH = 32
)
(
	//INPUTS
	input 							clk,
	input 							reset,
	input 	[DATA_WIDTH-1:0]	GPIO_i,
	
	//OUTPUTS
	output 	[DATA_WIDTH-1:0]	GPIO_o,
	output	[1:0] 				Device_o,
	
	//CONTROL SIGNALS
	input 							PCWrite,
	input 							RegWrite,
	input 							MemWrite,
	input 							IRWrite,
	input 	[1:0]					ResultSrc,
	input 	[1:0]					ALUSrcB,
	input 	[1:0]					ALUSrcA,
	input 	[3:0]					ALUControl,
	input 							ADRSrc,
	input 	[2:0]					ImmSrc,
					
	output							Zero,
	output	[6:0]					Op,
	output 	[2:0] 				Funct3,
	output	[6:0]					Funct7
);

	wire	[DATA_WIDTH-1:0]	PCNext;
	wire	[DATA_WIDTH-1:0]	PC;
	wire	[DATA_WIDTH-1:0]	Adr;
	wire	[DATA_WIDTH-1:0]	ReadData;
	wire	[DATA_WIDTH-1:0]	Instr;
	wire	[DATA_WIDTH-1:0]	Data;
	wire	[DATA_WIDTH-1:0]	OldPC;
	wire	[DATA_WIDTH-1:0]	Result;
	wire	[DATA_WIDTH-1:0]	RD1;
	wire	[DATA_WIDTH-1:0]	RD2;
	wire	[DATA_WIDTH-1:0]	A;
	wire	[DATA_WIDTH-1:0]	B;
	wire	[DATA_WIDTH-1:0]	SrcA;
	wire	[DATA_WIDTH-1:0]	SrcB;
	wire	[DATA_WIDTH-1:0]	ALUResult;
	wire	[DATA_WIDTH-1:0]	ALUOut;	
	wire	[27:0]				PC_Jump;	
	wire 	[DATA_WIDTH-1:0]	ImmExt_w;
	wire	[1:0]					Device;
	wire 	[DATA_WIDTH-1:0]	GPIO_o_w;

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
										.Register_i			(GPIO_i),
										.Instruction_o		(ReadData),
										.GPIO_o				(GPIO_o_w),
										.Device_o			(Device)
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
	assign GPIO_o = GPIO_o_w;
	assign Zero = !ALUResult;
	assign Device_o = Device;
								
endmodule
