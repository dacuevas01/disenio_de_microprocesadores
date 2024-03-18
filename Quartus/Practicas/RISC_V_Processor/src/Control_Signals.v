module Control_Signals
(
	input 			clk,
	input 			reset,
	input		[6:0]	Op,
	
	output			Branch,	
	output  			PC_Update,
	output 			Reg_Write,
	output 			Mem_Write,
	output 			IR_Write,
	output	[1:0]	Result_Src,
	output 	[1:0]	ALU_Src_B,
	output 	[1:0]	ALU_Src_A,
	output			AdrSrc,
	output 	[1:0]	ALU_Op
);

	localparam	IF 		= 5'b00000,
					ID 		= 5'b00001,
					EX_R 		= 5'b00010,
					EX_I 		= 5'b00011,
					ALU_WB 	= 5'b00100,
					BEQ 		= 5'b00101,
					JAL 		= 5'b00110,
					LWSW		= 5'b00111,
					LW			= 5'b01000,
					M_WB		= 5'b01001,
					SW			= 5'b01010,
					MULT		= 5'b01011;
							
	reg	[4:0]		state;
	reg	[4:0]		next_state;
	reg	[13:0]	control_bus;
	
	always@(posedge clk) begin
		if(!reset) state <= IF; 
		else state <= next_state;
	end
	
	always@(state or Op) begin
		control_bus = 14'b0_0_0_0_0_00_00_00_0_00;
		case (state)
			IF	:	begin
						control_bus = 14'b0_1_0_0_1_10_10_00_0_00;
						
						next_state = ID;
					end
						
			
			ID		:	begin
							control_bus = 14'b0_0_0_0_0_00_01_01_0_00;
							
							next_state = 	(Op == 7'b0110011) ? EX_R : 
												(Op == 7'b0010011) ? EX_I : 
												(Op == 7'b1100011) ? BEQ  :
												(Op == 7'b1101111) ? JAL  : 
												(Op == 7'b0000011) ? LWSW :
												(Op == 7'b0100011) ? LWSW :EX_I;
						end
			
			EX_R	:	begin
							control_bus = 14'b0_0_0_0_0_00_00_10_0_10; //add
							
							next_state = ALU_WB;
						end

			EX_I	: 	begin
							control_bus = 14'b0_0_0_0_0_00_01_10_0_10; //addi

							next_state = ALU_WB;
						end

			ALU_WB:	begin
							control_bus = 14'b0_0_1_0_0_00_00_00_0_00;
							
							next_state = IF;
						end
						
			BEQ	 :	begin
							control_bus = 14'b1_0_0_0_0_00_00_10_0_01;
							
							next_state = IF;
						end
			
			JAL	:	begin
							control_bus = 14'b0_1_0_0_0_00_10_01_0_00;
							
							next_state = ALU_WB;
						end
			
						
			/*JR	:		begin
							control_bus = 17'b1_0_0_0_00_00_0_0_00_00_01_0;
							
							next_state = IF;
						end*/
			
			LWSW	:	begin
							control_bus = 14'b0_0_0_0_0_00_01_10_0_00;
							
							next_state = (Op == 7'b0000011) ? LW : SW;
						end
			
			LW		:	begin
							control_bus = 14'b0_0_0_0_0_00_00_00_1_00;
							
							next_state = M_WB;
						end
			
			M_WB	:	begin
							control_bus = 14'b0_0_1_0_0_01_00_00_0_00;
							
							next_state = IF;
						end
						
			SW		:	begin
							control_bus = 14'b0_0_0_1_0_00_00_00_1_00;
							
							next_state = IF;
						end
						
			default	:	next_state = IF;
		endcase
	end
	
	assign Branch		= control_bus[13];
	assign PC_Update	= control_bus[12];
	assign Reg_Write	= control_bus[11];
	assign Mem_Write	= control_bus[10];
	assign IR_Write	= control_bus[9];
	assign Result_Src	= control_bus[8:7];
	assign ALU_Src_B	= control_bus[6:5];
	assign ALU_Src_A	= control_bus[4:3];
	assign AdrSrc 		= control_bus[2];
	assign ALU_Op 		= control_bus[1:0];
	
	//reg	[12:0]	control_bus;
	//control_bus = 14'b0_0_0_0_0_00_00_00_0_00
	//Fetch 		  = 14'b0_1_0_0_1_10_10_00_0_00
	//Decode		  = 14'b0_0_0_0_0_00_01_01_0_00
	//Execute_R	  = 14'b0_0_0_0_0_00_00_10_0_10
	//Execute_I	  = 14'b0_0_0_0_0_00_01_10_0_10
	//ALU_WB		  = 14'b0_0_1_0_0_00_00_00_0_00
	//Beq			  = 14'b1_0_0_0_0_00_00_10_0_01
	//Jal			  = 14'b0_1_0_0_0_00_10_01_0_00
	//LwSw		  = 14'b0_0_0_0_0_00_01_10_0_00
	//Lw			  = 14'b0_0_0_0_0_00_00_00_1_00
	//M_WB		  = 14'b0_0_1_0_0_01_00_00_0_00
	//SW			  = 14'b0_0_0_1_0_00_00_00_1_00
endmodule
