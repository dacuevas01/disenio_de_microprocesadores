module Register_Mux
#
(
	parameter DATA_WIDTH = 32
)
(
	input			[1:0]					Select,
	input			[DATA_WIDTH-1:0]	I_0,
	input			[DATA_WIDTH-1:0]	I_1,
	
	output reg 	[DATA_WIDTH-1:0]	Mux_Out
);

localparam	DEVICE_UART_TX		= 2'b01,
				DEVICE_UART_RX		= 2'b10,
				DEVICE_UART_TX_O	= 2'b11;

	always@(*) begin
		case (Select)
			DEVICE_UART_TX		:	Mux_Out = I_1;
			DEVICE_UART_RX		:	Mux_Out = I_1;
			DEVICE_UART_TX_O	:	Mux_Out = I_1;
			default				:	Mux_Out = I_0;
		endcase	
	end
endmodule
