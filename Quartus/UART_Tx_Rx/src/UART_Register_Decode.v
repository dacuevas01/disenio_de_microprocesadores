module UART_Register_Decode(
input						clk,
input						reset,
input		[31:0]		UART_TX_Reg_In,
input						Tx_Sel,
input						Rx_Sel,
input		[8:0]			UART_Rx,

input						RX_Parity,
input						UART_Rx_Done,
input						UART_Tx_Done,
input						tx_send,

output	reg [31:0]	UART_Reg,
output					Parity,
output		 [7:0]	UART_Tx_Data,
output					Tx_Start
);

wire [31:0]		Reg_Data_UART_Rx_w;
wire				neg_rst_w;
wire [31:0]		UART_Rx_Reg_w;
wire				Parity_w;
wire [7:0]		UART_Tx_Data_w;
wire				Tx_Start_w;
wire [31:0]		Reg_Data_UART_Tx_w;
wire [31:0]		UART_Tx_Reg_W;
//Rx Registers Out
assign neg_rst_w = ~reset;
assign Reg_Data_UART_Rx_w[7:0]		= UART_Rx[7:0]; //Rx_Data
assign Reg_Data_UART_Rx_w[8]			= UART_Rx[8];	//Rx_Parity
assign Reg_Data_UART_Rx_w[9]			= RX_Parity;
assign Reg_Data_UART_Rx_w[10]		= UART_Rx_Done;
assign Reg_Data_UART_Rx_w[31:11]	= 1'b0;

//Tx In Registers
assign Parity							= Parity_w;
assign UART_Tx_Data					= UART_Tx_Data_w;
assign Tx_Start						= Tx_Start_w;		

//Tx Register Out
assign Reg_Data_UART_Tx_w[7:0]		= UART_Tx_Data_w;
assign Reg_Data_UART_Tx_w[8]			= tx_send;
assign Reg_Data_UART_Tx_w[31:9]			= 1'b0;


//UART_Rx_Reg_Out
Rx_Register_Decoder Rx_Decoder (
											.clk(clk),
											.rst(neg_rst_w),
											.reg_enable(UART_Rx_Done),
											.Reg_UART_Rx(Reg_Data_UART_Rx_w),
							
											.UART_Rx_Reg(UART_Rx_Reg_w)

); 
 
//UART_Tx_Reg_In
Tx_Register_Encoder Tx_Encoder (
											//inputs
											.UART_TX_Reg_In(UART_TX_Reg_In),
											.Tx_Sel_In(Tx_Sel),
											//outputs
											.Tx_Data(UART_Tx_Data_w),
											.Parity_sel(Parity_w),
											.Tx_Sel_Out(Tx_Start_w)
);

Tx_Register_Decoder Tx_Decoder (
											.clk(clk),
											.rst(neg_rst_w),
											.reg_enable(tx_send),
											.Reg_UART_Tx(Reg_Data_UART_Tx_w),
							
											.UART_Tx_Reg(UART_Tx_Reg_W)

); 


//UART Case ParameterRs
wire [2:0]	UART_Reg_Select;
assign UART_Reg_Select = {1'b0,Tx_Sel,Rx_Sel};

localparam	UART_Rx_Reg_Out 	= 3'b001,
				UART_Tx_Reg_In		= 3'b010,
				UART_Tx_Reg_Out	= 3'b100;
				
//UART Select Reg Output
always @(*) begin
	case(UART_Reg_Select)
		UART_Rx_Reg_Out: 
			begin
				UART_Reg = UART_Rx_Reg_w;
			end
		UART_Tx_Reg_In:
			begin
				UART_Reg = 32'b0;
			end
		UART_Tx_Reg_Out:
			begin
				UART_Reg = UART_Tx_Reg_W;
			end
		default:	UART_Reg = 32'b0;
	endcase
	
	
end


endmodule 