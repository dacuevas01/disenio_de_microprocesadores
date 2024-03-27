`timescale 1ns / 1ps
module Uart_Tx_Fsm (
	input clk,
	input start,
	input rst,
	input end_bit_time_i,
	input [3:0] Tx_bit_Count,
	output reg bit_count_enable,
   output reg rst_BR,
   output reg rst_bit_counter,
	output reg [2:0]out_sel,
	output reg tx_done
);

localparam INIT_S = 	3'b000;
localparam START_S = 3'b001;
localparam TX_S = 	3'b010;
//localparam TX_W_S =	3'b011;
localparam PARITY_S =3'b011;
localparam STOP_S  = 3'b100;
reg [2:0] State;

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
							State <= INIT_S;
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