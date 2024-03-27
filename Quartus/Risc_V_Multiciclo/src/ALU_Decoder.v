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
					add		= 12'b10_000_xxxxxxx,
					sub		= 12'b10_000_0100000,
					opor		= 12'b10_110_xxxxxxx,
					opand		= 12'b10_111_xxxxxxx,
					slti		= 12'b10_010_xxxxxxx;
	
	
	always@(ALU_Op,Funct3,Funct7) begin
		casex(Control)
			lwsw  	:	ALUControl = 3'b000;
			
			beq		:	ALUControl = 3'b001;
			
			add		:	ALUControl = 3'b000;
	
			sub		:	ALUControl = 3'b001;
			
			opor		:	ALUControl = 3'b100;
			
			opand		: 	ALUControl = 3'b011;
			
			slti		:	ALUControl = 3'b111;
			
			default	:	ALUControl = 3'b000;
		endcase
	end
endmodule
