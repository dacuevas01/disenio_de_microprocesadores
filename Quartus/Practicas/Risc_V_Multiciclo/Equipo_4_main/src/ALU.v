module ALU
#
(
	parameter DATA_WIDTH = 32
)
(
	input			[2: 0]					Control,
	input			[DATA_WIDTH-1: 0]		A,
	input			[DATA_WIDTH-1: 0]		B,
	
	output reg 	[DATA_WIDTH-1: 0] 	Result
);

	
	always @ (*) begin
		Result = 32'b0;
		case (Control)
			3'b000	:	Result = A + B;
			3'b001	:	Result = A - B;
			3'b010	:	Result = A * B;
			3'b011	:	Result = A & B;
			3'b100	:	Result = A | B;
			3'b101	: 	Result = A ^ B;
			3'b110	: 	Result = B << 16;
			3'b111	:	Result = (A < B) ? 32'd1 : 32'd0;
			
			default:		Result = 32'b0;
		endcase
	end
endmodule
