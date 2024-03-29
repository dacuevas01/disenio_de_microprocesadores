module ALU_Decoder
(
	input 		[1:0]	ALU_Op,
	input 		[2:0]	Funct3,
	input			[6:0]	Funct7,
	
	output reg	[2:0]	ALUControl
);

wire [11:0] Control;

assign Control = {ALU_Op,Funct3,Funct7};

	localparam	lwsw 		= 12'b00_xxx_xxxxxxx,
					beq		= 12'b01_xxx_xxxxxxx,
					add		= 12'b10_000_0000000,
					addi		= 12'b11_000_xxxxxxx,
					sub		= 12'b10_000_0100000,
					opor		= 12'b10_110_0000000,
					opori		= 12'b11_110_xxxxxxx,
					opand		= 12'b10_111_0000000,
					opandi	= 12'b11_111_xxxxxxx,
					mul		= 12'b10_000_0000001,
					slti		= 12'b11_010_xxxxxxx;
	
	
	always@(Control) begin
		casex(Control)
			lwsw  	:	ALUControl = 3'b000;
			
			beq		:	ALUControl = 3'b001;
			
			add		:	ALUControl = 3'b000;
			
			addi		:	ALUControl = 3'b000;
	
			sub		:	ALUControl = 3'b001;
			
			opand		: 	ALUControl = 3'b011;
			
			opandi	: 	ALUControl = 3'b011;
			
			opor		:	ALUControl = 3'b100;
			
			opori		:	ALUControl = 3'b100;
			
			mul		: 	ALUControl = 3'b010;
			
			slti		:	ALUControl = 3'b111;
			
			default	:	ALUControl = 3'b000;
		endcase
	end
endmodule
