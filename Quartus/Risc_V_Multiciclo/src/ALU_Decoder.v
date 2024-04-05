module ALU_Decoder
(
	input 		[1:0]	ALU_Op,
	input 		[2:0]	Funct3,
	input			[6:0]	Funct7,
	
	output reg	[3:0]	ALUControl
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
					slti		= 12'b11_010_xxxxxxx,
					sll		= 12'b10_001_0000000,
					slli		= 12'b11_001_xxxxxxx,
					slr		= 12'b10_101_0000000,
					slri		= 12'b11_101_xxxxxxx;
	
	
	always@(Control) begin
		casex(Control)
			lwsw  	:	ALUControl = 4'b0000;
			
			beq		:	ALUControl = 4'b0001;
			
			add		:	ALUControl = 4'b0000;
			
			addi		:	ALUControl = 4'b0000;
	
			sub		:	ALUControl = 4'b0001;
			
			opand		: 	ALUControl = 4'b0011;
			
			opandi	: 	ALUControl = 4'b0011;
			
			opor		:	ALUControl = 4'b0100;
			
			opori		:	ALUControl = 4'b0100;
			
			mul		: 	ALUControl = 4'b0010;
			
			slti		:	ALUControl = 4'b0111;
			
			sll		:	ALUControl = 4'b0110;
			
			slli		:	ALUControl = 4'b0110;
			
			slr		:	ALUControl = 4'b1000;
			
			slri		:	ALUControl = 4'b1000;
			
			default	:	ALUControl = 4'b0000;
		endcase
	end
endmodule
