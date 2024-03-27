`timescale 1ns / 1ps
module UART_Tx_Rx_TB();


reg 				clk;
reg 				rst;

reg 	[31:0]	UART_Register_Tx;
reg				UART_RX_Sel;
reg				UART_Tx_Sel;
reg				rx;

wire	[31:0]	UART_Register_out;
wire	[31:0]	UART_Register_Tx_out;
wire				heard_bit_out;
wire				tx;




UART_Tx_Rx UUT (
//Input registers
							.clk(clk),
							.rst(rst),
//Data registers
							.UART_Register_Tx(UART_Register_Tx),
							.UART_RX_Sel(UART_RX_Sel),
							.UART_Tx_Sel(UART_Tx_Sel),
							.rx(rx),
	
//Output registers
							.UART_Register_out(UART_Register_out),
							.heard_bit_out(heard_bit_out),
							.tx(tx)
);


initial
	begin
		clk 					= 	1'b0;
		rx 					= 	1'b1;
		rst 					= 	1'b0;
		# 5 rst 				= 	1'b1;
		UART_RX_Sel			= 	1'b0;
		UART_Tx_Sel			=	1'b0;
		UART_Register_Tx	= 32'b00000000000000000000000110101010;
		# 10 UART_Tx_Sel  =  1'b1;
		# 100 UART_Tx_Sel =  1'b0;
	end

always
	begin
		#10 clk = ~ clk;
	end

always
	begin
		#9600 rx = 1'b0;
		#9600 rx = 1'b1;
		#9600 rx = 1'b0;
	end	
endmodule	