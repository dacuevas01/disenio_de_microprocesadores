module RISC_V_Multi_Cycle_Processor (
	input MAX10_CLK1_50,
	input reset,
	input rx,
	
	//output [31:0] GPIO_Out,
	output				tx,
	output				LED_Lock_PLL,
	output				LED_heard_bit_out
);

wire [31:0] 	GPIO_Out_w;
wire [31:0] 	GPIO_In_W;
wire [1:0]	  	UART_Reg_Sel_w;
wire 				clk_w;
wire 				tx_w;
wire 				LED_Lock_PLL_w;
wire 				LED_heard_bit_out_w;

/*
PLL_Clock_Gen PLL_Clock_Gen_i (
											.refclk(MAX10_CLK1_50),   //  refclk.clk
											.rst(~reset),      //   reset.reset
											
											.outclk_0(clk_w), // outclk0.clk
											.locked(LED_Lock_PLL_w)    //  locked.export
	);
*/
PLL_Clock_Gen_25M (
		.refclk(MAX10_CLK1_50),   //  refclk.clk
		.rst(~reset),      //   reset.reset
		.outclk_0(clk_w), // outclk0.clk
		.locked(LED_Lock_PLL_w)    //  locked.export
	);


RISC_V_Multi_Cycle RISC_V(
	.clk(clk_w),
	.reset(reset),
	.GPIO_In(GPIO_In_W),
	
	.GPIO_Out(GPIO_Out_w),
	.UART_Reg_Sel(UART_Reg_Sel_w)
);


UART_Tx_Rx UART (
//Input registers
				.clk(clk_w),
				.rst(reset),
//Data registers
				.UART_Register_Tx(GPIO_Out_w),
				.UART_Reg_Sel_i(UART_Reg_Sel_w),
				.rx(rx),
	
//Output registers
				.UART_Register_out(GPIO_In_W),	
				.heard_bit_out(heard_bit_out),
				.tx(tx)
);


endmodule 