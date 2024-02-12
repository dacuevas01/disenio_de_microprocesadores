module Shift_Left_2
#
(
	parameter DATA_WIDTH = 32
)
(
	input		[DATA_WIDTH-1:0]	Ext_Imm,
	
	output	[DATA_WIDTH-1:0]	Shifted_Imm
);

	assign Shifted_Imm = Ext_Imm << 2;
	
endmodule
