module Device_Selector (
	input 	[2:0]	Device,
	
	output 			UART_TX,
	output 			UART_RX,
	output			UART_TX_O
);

localparam 	UART_Tx 		= 3'b001,
				UART_Rx 		= 3'b010,
				UART_Tx_o	= 3'b011;
				
reg [2:0] out_sel;
				
always @(Device) begin
	
	case(Device)
			UART_Tx: 	begin 
									out_sel = 001;
							end				
			UART_Rx: 	begin
									out_sel = 010;
							end
			UART_Tx_o:	begin
									out_sel = 100;
							end
			default:		begin
									out_sel = 000;
							end
	endcase
end 

assign UART_TX = out_sel[0];
assign UART_RX = out_sel[1];
assign UART_TX_O = out_sel[2];

endmodule 