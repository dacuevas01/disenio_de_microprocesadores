`timescale 1ns / 1ps
module UART_Tx_tb ();

reg clk, tx_send, rst, parity_sel;
reg [7:0]Tx_data;
wire tx;
//wire [32:0]Q;

initial begin
	#5 rst = 1'b1;
	#10 rst = 1'b0;
	#10 clk = 1'b0;
	#10 tx_send = 1'b0;
	#10 parity_sel = 1'b0;
	#10 Tx_data = 8'b11001101;
	#9600 tx_send = 1'b1;
	#9680 tx_send = 1'b0;
	#3000000 tx_send = 1'b1;
	#800 tx_send = 1'b0;
end

always begin
	#20 clk = ~clk;
end

UART_Tx UUT (.clk(clk),.tx_send(tx_send),.rst(rst),.parity_sel(parity_sel),.Tx_data(Tx_data),.tx(tx));
endmodule 