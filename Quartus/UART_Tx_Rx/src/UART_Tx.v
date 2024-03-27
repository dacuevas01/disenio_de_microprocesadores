module UART_Tx (
	input clk,
	input tx_send,
	input rst,
	input parity_sel,
	input [7:0]Tx_data,
	output tx,
	output tx_done
	//output [31:0]Q
);

wire [2:0]out_sel_w;
wire end_bit_time_w, rst_bit_counter_w, rst_BR_w, bit_count_enable_w; 
wire [3:0]Tx_bit_Count_w;
wire data_out_w;
wire neg_rest;
wire tx_done_w;
//wire [31:0] Q_w;
localparam freq = 50000000;
localparam baud = 9600;

wire [31:0] bit_rate_w;
assign bit_rate_w = freq / baud;
//assign Q=Q_w; 

wire parity_w;
assign tx_done = tx_done_w;

//if the parity bit is 1, means that is an od parity
assign parity_w = parity_sel?^Tx_data:~(^Tx_data);

assign neg_rest = ~rst;

Counter_Param_Tx #(
							.n(4)
						) 
						Counter_Param_Tx_i (
													.clk(clk),
													.rst(rst_bit_counter_w),
													.enable(bit_count_enable_w & end_bit_time_w),
													.Q(Tx_bit_Count_w)
						);
						
Bit_Rate_Pulse_Tx Bit_Rate_Pulse_Tx_i (
													.limit(bit_rate_w), 
													.clk(clk),
													.rst(rst_BR_w),
													.enable(1'b1),
													.end_bit_time(end_bit_time_w)
													);
													
Uart_Tx_Fsm Uart_Tx_Fsm_i (
									.clk(clk),
									.start(tx_send),
									.rst(neg_rest),
									.end_bit_time_i(end_bit_time_w),
									.Tx_bit_Count(Tx_bit_Count_w),
									.bit_count_enable(bit_count_enable_w),
									.rst_BR(rst_BR_w),
									.rst_bit_counter(rst_bit_counter_w),
									.out_sel(out_sel_w),
									.tx_done(tx_done_w)
									);
									
Serializer Serializer_i (
								 .A(Tx_data),
								 .clk(clk),
								 .rst(neg_rest),
								 .out_sel(out_sel_w),
								 .counter_i(Tx_bit_Count_w),
								 .end_bit_time(end_bit_time_w),
								 .parity(parity_w),
								 .data_out(data_out_w)
								 );

assign tx = data_out_w;

endmodule 