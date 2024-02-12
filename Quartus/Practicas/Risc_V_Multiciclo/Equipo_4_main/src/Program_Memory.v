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
		$readmemh("C:Users/dace_/Downloads/Equipo_4-main (1)/Equipo_4-main/assembly_code/factorial.txt", rom);
	end

	always @ (Address) begin
		Instruction = rom[Address];
	end
	
endmodule


