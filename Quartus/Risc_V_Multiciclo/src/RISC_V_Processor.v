module RISC_V_Processor
(
	input 			MAX10_CLK1_50,
	input 	[9:0] SW,
	
	output	[9:0]	LEDR
);

	wire clk_gen;
	wire clk;
	
	Clock_Gen	Clock_Gen_inst	(
											.inclk0	(MAX10_CLK1_50),
											.c0 		(clk_gen)
										);

	cont_1s_RCO	clock	(
								.mclk 	(clk_gen),
								.reset	(SW[9]),
								.RCO		(clk)
							);

	RISC_V_Multi_Cycle	RISC_V	(
										.clk			(clk),
										.reset		(SW[9]),
										.GPIO_In		(SW[7:0]),
										.GPIO_Out	(LEDR[7:0])
									);
	
	assign LEDR[9] = clk;
	
endmodule
