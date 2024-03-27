`timescale 1ns / 1ps
module Serializer (
	input [7:0] A,
	input clk,
	input rst,
	input [2:0]out_sel,
	input [2:0]counter_i,
	input end_bit_time,
	input parity,
	output reg data_out
);



always @(posedge clk, posedge rst) begin
	if(rst) begin
		data_out = 1'b0;
	end
	else begin
		if(end_bit_time) begin
			case(out_sel)
				3'b000: data_out = 1;
				3'b001: data_out = 0;
				3'b010: data_out = A[counter_i];
				3'b011: data_out = parity;
				3'b100: data_out = 1;
				default: data_out = 0;
			endcase
		end
	end	
end

endmodule 