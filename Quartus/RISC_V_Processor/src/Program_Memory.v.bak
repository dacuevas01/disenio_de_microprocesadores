module Program_Memory
#
(
	parameter	MEMORY_DEPTH = 64,
	parameter	DATA_WIDTH = 32
)
(
	input 		[(DATA_WIDTH-1):0] 	Address,
	output reg 	[(DATA_WIDTH-1):0] 	Instruction
);

	reg 	[DATA_WIDTH-1:0] 	rom[MEMORY_DEPTH-1:0];

	initial begin
		$readmemh("C:/PROJECTS/Equipo_4/assembly_code/factorial.txt", rom);
	end

	always @ (Address) begin
		Instruction = rom[Address];
	end
	
endmodule


