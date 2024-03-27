module UART_Full_Duplex (
	input 		clk,
	input 		rst,
	//inputs rx
	input 		rx,
	input 		parity_sel,
	//inputs tx
	input 		tx_send,
	input [7:0]	Tx_data,
	
	//output rx
	output 		parity,
	//output [7:0]Rx_Data,
	output [8:0]Rx_SR,
	output		Rx_Donde,
	output 		heard_bit_out,
	output 		tx,
	output		tx_d
);



wire 			parity_w,heard_bit_out_w,tx_w;
wire 	[8:0]	Rx_SR_w;
wire			Rx_ready_w;
wire			tx_done_w;

UART_Rx UART_Rx_i(
						.clk(clk),
						.n_rst(rst),
						.rx(rx),
						.parity(parity_w),
						.Rx_SR(Rx_SR_w),
						.heard_bit_out(heard_bit_out_w),
						.Rx_ready(Rx_ready_w)
						);

UART_Tx UART_Tx_i(
						.clk(clk),
						.tx_send(tx_send),
						.rst(rst),
						.parity_sel(parity_sel),
						.Tx_data(Tx_data),
						.tx(tx),
						.tx_done(tx_done_w)
						);
						
assign Rx_SR = Rx_SR_w;
assign Rx_Donde = Rx_ready_w;
assign parity = parity_w;
assign heard_bit_out = heard_bit_out_w;
assign tx_d = tx_done_w;

endmodule 