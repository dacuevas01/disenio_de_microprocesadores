module RISC_V_MultyCycle (
	input 				MAX10_CLK1_50,
	input 				rx,
	input					rst,
	
	output				tx,
	output				LED_Lock_PLL,
	output				LED_heard_bit_out

);


wire clk_w;
wire tx_w;
wire LED_Lock_PLL_w;
wire LED_heard_bit_out_w;


PLL_Clock_Gen PLL_Clock_Gen_i (
											.refclk(MAX10_CLK1_50),   //  refclk.clk
											.rst(rst),      //   reset.reset
											
											.outclk_0(clk_w), // outclk0.clk
											.locked(LED_Lock_PLL_w)    //  locked.export
	);
	
RISC_V_Multi_Cycle_Processor RISC_V_Multi_Cycle_Processor_i (
																					.clk(clk_w),
																					.reset(rst),
																					.rx(rx),
	
	//output [31:0] GPIO_Out,
																					.tx(tx_w),
																					.heard_bit_out(LED_heard_bit_out_w)
);

assign tx = tx_w;
assign LED_Lock_PLL = LED_Lock_PLL_w;
assign LED_heard_bit_out = LED_heard_bit_out_w;

endmodule 