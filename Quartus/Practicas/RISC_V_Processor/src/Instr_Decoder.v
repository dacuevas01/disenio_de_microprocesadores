module Instr_Decoder (
	input 	[5:0] Op,
	output reg	[2:0] ImmSrc
);

localparam LW 		= 	7'b0000011,
			  SW 		= 	7'b0100011,
			  BEQ		= 	7'b1100011,
			  I_ALU	= 	7'b0010011,
			  JAL		=	7'b1101111,
			  JALR	=	7'b1100111,
			  LUI		=	7'b0110111,
			  AUIPC	=	7'b0010111;
			  


always @(Op) begin
	case(Op)
	LW:		begin
					ImmSrc = 2'b000;
				end
	SW:		begin
					ImmSrc = 2'b001;
				end	
	BEQ:		begin
					ImmSrc = 2'b010;
				end
	I_ALU:	begin
					ImmSrc = 2'b000;
				end
	JAL:		begin
					ImmSrc = 2'b011;
				end
	JALR:		begin
					ImmSrc = 2'b000;
				end
	LUI:		begin
					ImmSrc = 2'b100;
				end
	AUIPC:	begin
					ImmSrc = 2'b100;
				end
	default:		ImmSrc = 2'b000;
	endcase
		

end

endmodule 