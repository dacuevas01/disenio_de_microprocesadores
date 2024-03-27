module ALU_Decoder
(
	input 		[1:0]	ALU_Op,
	input 		[5:0]	Funct,
	
	output reg	[2:0]	ALU_Control
);

	localparam	add 	= 8'b00_100000,
					addi	= 8'b00_xxxxxx,
					sub	= 8'b01_xxxxxx,
					lui	= 8'b10_xxxxxx,
					slti	= 8'b11_xxxxxx,
					mult	= 8'b11_011000;
	
	
	always@({ALU_Op,Funct}) begin
		casex({ALU_Op,Funct})
			add	:	ALU_Control = 3'b000;

			addi	:	ALU_Control = 3'b000;
			
			sub	:	ALU_Control = 3'b001;
			
			lui	:	ALU_Control = 3'b110;
			
			mult	:	ALU_Control = 3'b010;
			
			slti 	: 	ALU_Control = 3'b111;

		endcase
	end
endmodule
