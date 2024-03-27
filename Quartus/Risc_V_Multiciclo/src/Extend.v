module Extend (
	input 	[31:0]Instr,
	input		[1:0]ImmSrc,
	output	[31:0]ImmExt					
);

reg [31:0] ImmExt_r;

always @(ImmSrc) begin
	case(ImmSrc)
	
	2'b00: ImmExt_r = {{20{Instr[31]}},Instr[31:20]};
	2'b10: ImmExt_r = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0};
	2'b11: ImmExt_r = {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0};
	default: ImmExt_r = {32{1'b0}};
	endcase

end

assign ImmExt = ImmExt_r;

endmodule 