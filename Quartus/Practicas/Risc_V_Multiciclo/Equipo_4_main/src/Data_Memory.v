module Data_Memory
#
(
	parameter	MEMORY_DEPTH = 64,
	parameter 	DATA_WIDTH = 32
)
(
	input 								clk,
	input 								Write_Enable,
	input 	[(DATA_WIDTH-1):0]	Write_Data,
	input		[(DATA_WIDTH-1):0] 	Address,
	
	output	[(DATA_WIDTH-1):0] 	Read_Data
);

	reg 	[DATA_WIDTH-1:0] 	ram[MEMORY_DEPTH-1:0];
	reg 	[DATA_WIDTH-1:0] 	Address_reg;

	always @ (posedge clk) begin
		if (Write_Enable) begin
			ram[Address] <= Write_Data;
		end
		Address_reg <= Address;
	end

	assign Read_Data = ram[Address_reg];

endmodule
