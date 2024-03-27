`timescale 1ns / 1ps
// ITESO
// Cuauhtemoc Aguilera
// Testbench of a UAR
module UART_Rx_TB ( );

reg clk, rst, rx;
wire parity, heard_bit_out;
wire [8:0] Rx_Data;

UART_Rx UUT (.clk(clk),.n_rst(rst),.rx(rx),.parity(parity),.Rx_SR(Rx_Data),.heard_bit_out(heard_bit_out));

initial
	begin
		clk 		= 1'b0;
		rx 		= 1'b1;
		rst 		= 1'b1;
		# 5 rst 	= 1'b0;
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