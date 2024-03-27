module Tx_Register_Encoder (
	input 	[31:0]	UART_TX_Reg_In,
	input					Tx_Sel_In,
	
	output	[7:0]		Tx_Data,
	output				Parity_sel,
	output				Tx_Sel_Out
);

wire [7:0] 	Tx_Data_w;
wire			Parity_Sel_w, Tx_Sel_w;

assign Tx_Data_w = UART_TX_Reg_In[7:0];
assign Parity_Sel_w = UART_TX_Reg_In[8];
assign Tx_Sel_w = Tx_Sel_In;

assign Tx_Data = Tx_Data_w;
assign Parity_sel = Parity_Sel_w;
assign Tx_Sel_Out = Tx_Sel_w;

endmodule 