module ALU_Decoder
(
	input 		[1:0]	ALU_Op,
	input 		[2:0]	Funct3,
	input			[6:0]	Funct7,
	
	output reg	[2:0]	ALUControl
);

	localparam	lwsw 		= 12'b00_xxx_xxxxxxx,
					beq		= 12'b01_xxx_xxxxxxx,
					add		= 12'b01_000_0000000,
					sub		= 12'b01_000_0100000,
					opor		= 12'b11_110_0000000,
					opand		= 12'b11_111_0000000;
	
	
	always@({ALU_Op,Funct3,Funct7}) begin
		casex({ALU_Op,Funct3,Funct7})
			lwsw  	:	ALUControl = 3'b000;
			
			beq		:	ALUControl = 3'b001;
			
			add		:	ALUControl = 3'b000;
	
			sub		:	ALUControl = 3'b001;
			
			opor		:	ALUControl = 3'b100;
			
			opand		: 	ALUControl = 3'b011;
			
			default	:	ALUControl = 3'b000;
		endcase
	end
endmodule
