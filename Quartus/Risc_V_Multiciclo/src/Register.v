module Register
#(
	parameter DATA_WIDTH = 32,
	parameter RESET_VALUE = 0
)
(
	input 								clk,
	input 								reset,
	input									enable,
	input			[DATA_WIDTH-1:0]	d,
	
	output reg	[DATA_WIDTH-1:0]	q	
);

	always@(posedge clk, negedge reset) begin
		if (!reset)
			q <= RESET_VALUE;
		else if (enable)
			q <= d;
	end
endmodule
