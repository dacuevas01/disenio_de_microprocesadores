module Register_File
#(
	parameter DATA_WIDTH = 32
)
(
	input 							clk,
	input 							reset,
	input								Reg_Write_i,
	input		[4:0]					Write_Register_i,
	input		[4:0]					Read_Register_1_i,
	input		[4:0]					Read_Register_2_i,
	input		[DATA_WIDTH-1:0]	Write_Data_i,
	
	output	[DATA_WIDTH-1:0]	Read_Data_1_o,
	output	[DATA_WIDTH-1:0]	Read_Data_2_o	
);

	wire	[DATA_WIDTH-1:0]	one_hot;
	wire 	[DATA_WIDTH-1:0]	q [DATA_WIDTH-1:0];
	
	Decoder DEC (	
						.Write_Register	(Write_Register_i),
						.one_hot				(one_hot)				
					);
	
	Register zero	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[0] & Reg_Write_i),
							.d			(0),
							.q 		(q[0])
						);
	
	Register ra 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[1] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[1])
						);
	
	Register sp 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[2] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[2])
						);
	
	Register gp 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[3] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[3])
						);
	
	Register tp 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[4] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[4])
						);
	
	Register t0 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[5] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[5])
						);
	
	Register t1 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[6] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[6])
						);
		
	Register t2 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[7] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[7])
						);
	
	Register s0 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[8] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[8])
						);

	Register s1 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[9] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[9])
						);
	
	Register a0 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[10] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[10])
						);
	
	Register a1 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[11] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[11])
						);
	
	Register a2 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[12] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[12])
						);

	Register a3 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[13] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[13])
						);
	
	Register a4 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[14] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[14])
						);
	
	Register a5 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[15] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[15])
						);	
	
	Register a6 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[16] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[16])
						);

	Register a7 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[17] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[17])
						);
	
	Register s2 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[18] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[18])
						);
	
	Register s3 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[19] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[19])
						);
	
	Register s4 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[20] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[20])
						);

	Register s5 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[21] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[21])
						);
	
	Register s6 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[22] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[22])
						);
	
	Register s7 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[23] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[23])
						);	
	
	Register s8 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[24] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[24])
						);
	
	Register s9 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[25] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[25])
						);
						
	Register s10 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[26] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[26])
						);
	
	Register s11 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[27] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[27])
						);	

	Register t3 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[28] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[28])
						);
	
	Register t4 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[29] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[29])
						);
	
	Register t5 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[30] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[30])
						);
	
	Register t6 	(	
							.clk		(clk),
							.reset	(reset),
							.enable	(one_hot[31] & Reg_Write_i),
							.d			(Write_Data_i),
							.q 		(q[31])
						);				
	
	Mux32x1 Rrs	(
						.Selector	(Read_Register_1_i),
						.I_0			(q[0]),
						.I_1			(q[1]),
						.I_2			(q[2]),
						.I_3			(q[3]),
						.I_4			(q[4]),
						.I_5			(q[5]),
						.I_6			(q[6]),
						.I_7			(q[7]),
						.I_8			(q[8]),
						.I_9			(q[9]),
						.I_10			(q[10]),
						.I_11			(q[11]),
						.I_12			(q[12]),
						.I_13			(q[13]),
						.I_14			(q[14]),
						.I_15			(q[15]),
						.I_16			(q[16]),
						.I_17			(q[17]),
						.I_18			(q[18]),
						.I_19			(q[19]),
						.I_20			(q[20]),
						.I_21			(q[21]),
						.I_22			(q[22]),
						.I_23			(q[23]),
						.I_24			(q[24]),
						.I_25			(q[25]),
						.I_26			(q[26]),
						.I_27			(q[27]),
						.I_28			(q[28]),
						.I_29			(q[29]),
						.I_30			(q[30]),
						.I_31			(q[31]),
						.Mux_Out		(Read_Data_1_o)
					);
	
	Mux32x1 Rrt	(
						.Selector	(Read_Register_2_i),
						.I_0			(q[0]),
						.I_1			(q[1]),
						.I_2			(q[2]),
						.I_3			(q[3]),
						.I_4			(q[4]),
						.I_5			(q[5]),
						.I_6			(q[6]),
						.I_7			(q[7]),
						.I_8			(q[8]),
						.I_9			(q[9]),
						.I_10			(q[10]),
						.I_11			(q[11]),
						.I_12			(q[12]),
						.I_13			(q[13]),
						.I_14			(q[14]),
						.I_15			(q[15]),
						.I_16			(q[16]),
						.I_17			(q[17]),
						.I_18			(q[18]),
						.I_19			(q[19]),
						.I_20			(q[20]),
						.I_21			(q[21]),
						.I_22			(q[22]),
						.I_23			(q[23]),
						.I_24			(q[24]),
						.I_25			(q[25]),
						.I_26			(q[26]),
						.I_27			(q[27]),
						.I_28			(q[28]),
						.I_29			(q[29]),
						.I_30			(q[30]),
						.I_31			(q[31]),
						.Mux_Out		(Read_Data_2_o)
					);	
endmodule
