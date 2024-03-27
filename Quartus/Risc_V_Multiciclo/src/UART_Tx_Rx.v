module UART_Tx_Rx (
//Input registers
	input					clk,
	input					rst,
//Data registers
	input		[31:0] 	UART_Register_Tx,
	input		[1:0]		UART_Reg_Sel_i,
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
wire	[31:0]	UART_Register_Tx_w;

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

wire Tx_Sel;
assign Tx_Sel = (UART_Reg_Sel_i == 2'b01) ? 1:0;

	Register #(
				.DATA_WIDTH(32),
				.RESET_VALUE(0)
			)
			Read_Data_Register
									(
										.clk(clk),
										.reset(reset),
										.enable(Tx_Sel),
										.d(UART_Register_Tx),
	
										.q(UART_Register_Tx_w)	
);

UART_Register_Decode UART_Reg (
						.clk(clk),
						.reset(rst),
						.UART_TX_Reg_In(UART_Register_Tx_w),
						.UART_Reg_Sel_i(UART_Reg_Sel_i),
						.UART_Rx(Rx_SR_w),
						.RX_Parity(parity_w),
						.UART_Rx_Done(Rx_Done_w),
						.UART_Tx_Done(Tx_Sel),
						.tx_send(tx_send_w),

						.UART_Reg(UART_Register_out),
						.Parity(parity_sel_w),
						.UART_Tx_Data(UART_Tx_Data_w),
						.Tx_Start(Tx_Start_w)

);

endmodule 