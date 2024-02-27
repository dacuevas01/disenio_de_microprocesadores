module Instr_Decoder (
	input 	[5:0] Op,
	output reg	[1:0] ImmSrc
);

localparam LW 		= 	7'b0000011,
			  SW 		= 	7'b0100011,
			  BEQ		= 	7'b1100011,
			  I_ALU	= 	7'b0010011,
			  JAL		=	7'b1101111;


always @(Op) begin
	case(Op)
	LW:		begin
					ImmSrc = 2'b00;
				end
	SW:		begin
					ImmSrc = 2'b01;
				end	
	BEQ:		begin
					ImmSrc = 2'b10;
				end
	I_ALU:	begin
					ImmSrc = 2'b00;
				end
	JAL:		begin
					ImmSrc = 2'b11;
				end
	default:		ImmSrc = 2'b00;
	endcase
		

end

endmodule 