module Extend (
	input 	[31:0]Instr,
	input		[1:0]ImmSrc,
	output reg	[31:0]ImmExt					
);

always @(ImmSrc) begin
	case(ImmSrc)
	
	2'b00: begin ImmExt = {{20{Instr[31]}},Instr[31:20]}; end
	2'b01: begin ImmExt = {{20{Instr[31]}},Instr[31:25],Instr[11:7]}; end
	2'b10: begin ImmExt = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0}; end
	2'b11: begin ImmExt = {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0}; end
	default: ImmExt = {31{1'b0}};
	endcase

end

endmodule 