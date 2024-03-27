module Device_Select #(
	parameter 	DATA_WIDTH = 32
)

(
	input		[(DATA_WIDTH-1):0]	Address_i,
	input		[(DATA_WIDTH-1):0]	Write_Data_i,
	input		[(DATA_WIDTH-1):0]	Register_i,
	input		[(DATA_WIDTH-1):0]	RAM_i,
	
	output	[1:0]						Device_sel,
	output	[(DATA_WIDTH-1):0]	Data_Out_Write,
	output	[(DATA_WIDTH-1):0]	Data_Out_Read
);


reg  [1:0]						Device_sel_r;
wire	[(DATA_WIDTH-1):0]	Write_Data_w;
wire	[(DATA_WIDTH-1):0]	Read_Data_w;

//Device select logic
localparam	DEVICE_UART_TX		= 2'b01,
				DEVICE_UART_RX		= 2'b10,
				DEVICE_UART_TX_R	= 2'b11;

localparam	ADDRESS_UART_TX_R	= 32'h10010028,
				ADDRESS_UART_TX 	= 32'h1001002c,
				ADDRESS_UART_RX	= 32'h10010030,
				ADDRESS_ROM		 	= 32'h04000000,
				ADDRESS_RAM			= 32'h10010000;
				
				
always @(Address_i) begin
	case(Address_i)
		ADDRESS_UART_TX:	begin
									Device_sel_r = DEVICE_UART_TX;
								end
		ADDRESS_UART_RX:	begin
									Device_sel_r = DEVICE_UART_RX;
								end
		ADDRESS_UART_TX_R:begin
									Device_sel_r = DEVICE_UART_TX_R;
								end
		default: Device_sel_r = 2'b00;
	
	endcase
end

assign Device_sel = Device_sel_r;

//RAM or GPIO logic write
/*
Register_Mux	Reg_Mux_Write_Write  (
									.Select(Device_sel_r),
									.I_0(Write_Data_i),
									.I_1(Register_i),
									.Mux_Out(Write_Data_w)
								);
								*/

assign Write_Data_w = (Device_sel_r == 2'b01) ? Write_Data_i: 32'b0;
								
assign Data_Out_Write = Write_Data_w; 

//RAM or GPIO logic read

Register_Mux	Reg_Mux_Write_Read  (
									.Select(Device_sel_r),
									.I_0(RAM_i),
									.I_1(Register_i),
									.Mux_Out(Read_Data_w)
								);
								
								

assign Data_Out_Read = Read_Data_w;
endmodule 