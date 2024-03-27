module UART_Tx_Rx (
//Input registers
	input					clk,
	input					rst,
//Data registers
	input		[31:0] 	UART_Register_Tx,
	input					UART_RX_Sel,
	input					UART_Tx_Sel,
	input					rx,
	
//Output registers
	output	[31:0]	UART_Register_out,	
	output				heard_bit_out,
	output				tx
);

wire	[8:0]		Rx_SR_w;
wire				parity_w;
wire				parity_sel_w;	
wire				Rx_Done_w;
wire	[7:0]		UART_Tx_Data_w;
wire				Tx_Start_w;
wire				tx_send_w;

UART_Full_Duplex UART (
						.clk(clk),
						.rst(rst),
						//inputs rx
						.rx(rx),
						//inputs tx
						.parity_sel(parity_sel_w),
						.tx_send(Tx_Start_w),
						.Tx_data(UART_Tx_Data_w),
	
						//output rx
						.parity(parity_w),
						.Rx_SR(Rx_SR_w),
						.Rx_Donde(Rx_Done_w),
						.heard_bit_out(heard_bit_out),
						//output tx
						.tx(tx),
						.tx_d(tx_send_w)
);


UART_Register_Decode UART_Reg (
						.clk(clk),
						.reset(rst),
						.UART_TX_Reg_In(UART_Register_Tx),
						.Tx_Sel(UART_Tx_Sel),
						.Rx_Sel(UART_RX_Sel),
						.UART_Rx(Rx_SR_w),
						.RX_Parity(parity_w),
						.UART_Rx_Done(Rx_Done_w),
						.UART_Tx_Done(UART_Tx_Sel),
						.tx_send(tx_send_w),

						.UART_Reg(UART_Register_out),
						.Parity(parity_sel_w),
						.UART_Tx_Data(UART_Tx_Data_w),
						.Tx_Start(Tx_Start_w)

);

endmodule 