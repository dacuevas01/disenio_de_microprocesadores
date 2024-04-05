`timescale 1ns / 1ps
module Uart_Tx_Fsm (
	input 				clk,
	input 				start,
	input 				rst,
	input 				end_bit_time_i,
	input 	[3:0] 	Tx_bit_Count,
	output reg 				bit_count_enable,
   output reg				rst_BR,
   output reg 				rst_bit_counter,
	output reg 	[2:0]		out_sel,
	output reg			 	tx_done
);

localparam 	INIT_S 	= 	3'b000,
				START_S 	= 	3'b001,
				TX_S 		= 	3'b010,
				PARITY_S =	3'b011,
				STOP_S  	= 	3'b100,
				TX_Done	=	3'b101;

//control signals
reg	[2:0] State;
reg	[2:0] Next_State;
reg	[6:0]	UART_control_bus;

//solving Tx_Fsm
/*
always @(posedge rst, posedge clk) begin
	if(rst) begin
			State <= INIT_S;
			//UART_control_bus <= 7'b000_0_0_0_0;
	end
	else begin
			State <= Next_State;
	end
end

always @(posedge State, posedge clk) begin
UART_control_bus = 7'b000_0_0_0_0;
		case(State)
			INIT_S: 	
					if(start) begin
						UART_control_bus 	= 	7'b000_0_1_1_0;
						Next_State			=	START_S;
					end
				
			START_S:	
					if(end_bit_time_i) begin
						UART_control_bus	=	7'b001_1_0_1_0;
						Next_State			=	TX_S;
					end
				
			TX_S:	 	
					if(Tx_bit_Count == 4'b1001) begin
						UART_control_bus	=	7'b010_1_0_0_0;
						Next_State			=	PARITY_S;
					end
				
			PARITY_S:
					if(end_bit_time_i) begin
						UART_control_bus	=	7'b011_1_0_1_0;
						Next_State			=	STOP_S;
					end
				
			STOP_S:	
					if(end_bit_time_i) begin
						UART_control_bus	=	7'b100_0_0_1_1;
						Next_State			=	INIT_S;
					end
				
			default:	begin
						UART_control_bus	=	7'b000_0_0_0_0;
						Next_State			=	INIT_S;
				end
		endcase
end
//assign buss data
assign out_sel 			= 	UART_control_bus[6:4];
assign bit_count_enable	=	UART_control_bus[3];
assign rst_BR				=	UART_control_bus[2];
assign rst_bit_counter	=	UART_control_bus[1];
assign tx_done				=	UART_control_bus[0];
*/


always@(posedge rst, posedge clk) begin
	if(rst)
		State <= INIT_S;
	else
		case (State)
			INIT_S: 	if(start)
							State <= START_S;
			START_S: if(end_bit_time_i)
							State <= TX_S;
			TX_S:		if(Tx_bit_Count == 4'b1001)
							State <= PARITY_S;
			PARITY_S: if(end_bit_time_i)
							State <= STOP_S;
			STOP_S:	if(end_bit_time_i)
							State <= TX_Done;
			TX_Done:		
							State	<= INIT_S;
			default:		State <= INIT_S;
		endcase
end

always @(State)
	begin
		case(State)
			INIT_S: begin
				out_sel <= 3'b000;
				bit_count_enable <= 1'b0;
				rst_BR <= 1'b1;
				rst_bit_counter <= 1'b1;
				tx_done <= 1'b0;
			end
			START_S: begin
				out_sel <= 3'b001;
				bit_count_enable <= 1'b1;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b1;
				tx_done <= 1'b0;
			end
			TX_S: begin
				out_sel <= 3'b010;
				bit_count_enable <= 1'b1;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b0;
				tx_done <= 1'b0;
			end
			PARITY_S: begin
				out_sel <= 3'b011;
				bit_count_enable <= 1'b1;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b1;
				tx_done <= 1'b0;
			end
			STOP_S: begin
				out_sel <= 3'b100;
				bit_count_enable <= 1'b0;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b1;
				tx_done <= 1'b0;
			end
			TX_Done: begin
				out_sel <= 3'b000;
				bit_count_enable <= 1'b0;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b0;
				tx_done <= 1'b1;
			end
			default: begin
				out_sel <= 3'b000;
				bit_count_enable <= 1'b0;
				rst_BR <= 1'b0;
				rst_bit_counter <= 1'b0;
				tx_done <= 1'b0;
			end
		endcase
	end

endmodule 