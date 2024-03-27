module Tx_Register_Decoder (
	input clk,
	input rst,
	input reg_enable,
	input [31:0] Reg_UART_Tx,
	
	output  [31:0]UART_Tx_Reg

);

wire [31:0] UART_Tx_Reg_w;

Reg_Param  #(
					.width(32)
				) 
				UART_RX_Register (
										.rst(rst),
										.D(Reg_UART_Tx),
										.clk(clk),
										.enable(reg_enable),
										.Q(UART_Tx_Reg_w)
				);
				
				
assign UART_Tx_Reg = UART_Tx_Reg_w;
				
endmodule 