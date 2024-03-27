module RISC_V_Multi_Cycle_Processor (
	input clk,
	input reset,
	input rx,
	
	//output [31:0] GPIO_Out,
	output tx,
	output heard_bit_out
);

wire [31:0] 	GPIO_Out_w;
wire [31:0] 	GPIO_In_W;
wire [1:0]	  	UART_Reg_Sel_w;

RISC_V_Multi_Cycle RISC_V(
	.clk(clk),
	.reset(reset),
	.GPIO_In(GPIO_In_W),
	
	.GPIO_Out(GPIO_Out_w),
	.UART_Reg_Sel(UART_Reg_Sel_w)
);


UART_Tx_Rx UART (
//Input registers
				.clk(clk),
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