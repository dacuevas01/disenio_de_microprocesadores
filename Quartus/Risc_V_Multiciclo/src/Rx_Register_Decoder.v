module Rx_Register_Decoder (
	input clk,
	input rst,
	input reg_enable,
	input [31:0]Reg_UART_Rx,
	
	output  [31:0]UART_Rx_Reg

);

wire [31:0] UART_Rx_Reg_w;

Reg_Param  #(
					.width(32)
				) 
				UART_RX_Register (
										.rst(rst),
										.D(Reg_UART_Rx),
										.clk(clk),
										.enable(reg_enable),
										.Q(UART_Rx_Reg_w)
				);
				
				
assign UART_Rx_Reg = UART_Rx_Reg_w;
				
endmodule 