module RISC_V_Multi_Cycle_TB();

reg 				clk_r;
reg 				reset_r;
reg 	[7:0]		GPIO_IN_r;
wire	[7:0]		GPIO_Out_w;
wire	[7:0]		Device_Out_w;

RISC_V_Multi_Cycle UUT(
	.clk(clk_r),
	.reset(reset_r),
	.GPIO_In(GPIO_In_r),
	.GPIO_Out(GPIO_Out_w),
	.Device_Out(Device_Out_w)
);

initial begin
	clk_r = 0;
	reset_r = 0;
	#10 reset_r = 1;
	#20 GPIO_IN_r = 00010010;
end

always begin
	#40 clk_r = !clk_r;
end

endmodule

