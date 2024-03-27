`timescale 1ns / 1ps
module RISC_V_Multi_Cycle_Processor_TB();

reg 				clk_r;
reg 				reset_r;
reg				rx;

//wire	[7:0]		GPIO_Out_w;
wire				tx;

RISC_V_Multi_Cycle_Processor UUT(
	.clk(clk_r),
	.reset(reset_r),
	.rx(rx),
	//.GPIO_Out(GPIO_Out_w),
	.tx(tx)
);

initial begin
	clk_r = 0;
	reset_r = 0;
	rx 	= 1;
	#1 reset_r = 1;
end

always 
		begin
				#1 clk_r = !clk_r;
		end

always
		begin
				#9600 rx = 0;
				#9600 rx = 0;
				#9600 rx = 0;
				#9600 rx = 1;
				#9600 rx = 0;
				#9600 rx = 0;
				#9600 rx = 0;
		end

endmodule 