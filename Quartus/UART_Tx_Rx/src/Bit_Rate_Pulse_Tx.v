`timescale 1ns / 1ps

module Bit_Rate_Pulse_Tx (
    
	 // Inputs
	 input [31:0] limit,
	 input rst,
    input enable,
    input clk,
	 
	 // Outputs
    //output reg [31:0] Q,
    output end_bit_time
	 
);


reg [31:0] Q;
assign end_bit_time = (Q==limit)? 1'b1 : 1'b0;

always @(posedge rst, posedge clk)
  begin
    if(rst)
        Q <= {32{1'b0}};
    else
        if (enable)
            if (Q==limit)
                Q <= {32{1'b0}};
            else
                Q <= Q + 1'b1;
        else
            Q <= Q;
  end 
endmodule