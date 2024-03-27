module RISC_V_Multi_Cycle_TB

RISC_V_Multi_Cycle RISC_V_Multi_Cycle_UUT(
	.clk(clk_r),
	.reset(reset_r),
	.GPIO_In(GPIO_In_r),
	.GPIO_Out(GPIO_Out_w),
	.Device_Out(Device_Out_w)
);

reg 				clk_r;
reg 				reset_r;
reg 	[7:0]		GPIO_IN_r;
wire	[7:0]		GPIO_Out_w;
wire	[7:0]		Device_Out_w;

initial begin
	forever #2 clk_r = !clk_r;
end

initial begin
	#0 reset_r = 0;
	GPIO_IN_r = 00010010;
	#1 reset_r = 1;
end

endmodule
