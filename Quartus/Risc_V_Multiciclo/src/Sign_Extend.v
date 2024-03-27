module Sign_Extend (
	input 	[31:0]Instr,
	input		[2:0]ImmSrc,
	output reg	[31:0]ImmExt					
);

always @(ImmSrc, Instr) begin
	case(ImmSrc)
	
	3'b000: begin ImmExt <= {{20{Instr[31]}},Instr[31:20]}; end
	3'b001: begin ImmExt <= {{20{Instr[31]}},Instr[31:25],Instr[11:7]}; end
	3'b010: begin ImmExt <= {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0}; end
	3'b011: begin ImmExt <= {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0}; end
	3'b100: begin ImmExt <= {{Instr[31:12]},{12{1'b0}}}; end
	default: begin ImmExt <= {31{1'b0}}; end
	endcase

end

endmodule 