module Memory_System
#
(
	parameter 	MEMORY_DEPTH = 64,
	parameter 	DATA_WIDTH = 32
)
(
	input									clk,
	input 								Write_Enable_i,
	input 	[(DATA_WIDTH-1):0] 	Write_Data_i,
	input 	[(DATA_WIDTH-1):0] 	Address_i,
	input		[(DATA_WIDTH-1):0]	Register_i,
	
	output 	[(DATA_WIDTH-1):0] 	Instruction_o,
	output 	[(DATA_WIDTH-1):0]	GPIO_o,
	output	[1:0]						Device_o									
);

	

	wire	[(DATA_WIDTH-1):0]	rom_out;
	wire 	[(DATA_WIDTH-1):0]	ram_out;
	wire	[(DATA_WIDTH-1):0]	Write_Data_w;
	wire	[(DATA_WIDTH-1):0]	Data_Out_Write_w;
	wire	[(DATA_WIDTH-1):0]	Data_Out_Read_w;
	wire	[1:0]						Device_o_w;

	
	Mux2x1	MEM_OUT	(
								.Selector	(Address_i>=32'h10010000),
								.I_0			(rom_out),
								.I_1			(Data_Out_Read_w),
								.Mux_Out		(Instruction_o)
							);
	
	Program_Memory	ROM	(
									.Address			((Address_i-32'h400000)>>2),
									.Instruction	(rom_out)
								);
	
	Data_Memory		RAM 	(
									.clk				(clk),
									.Write_Enable	(Write_Enable_i),
									.Write_Data		(Write_Data_i),
									.Address			((Address_i-32'h10010000)>>2),
									.Read_Data		(ram_out)
								);
	/*Device_Select DEV_SEL  (
									.Address_i	(Address_i),
									.Device_sel	(Device_o_w)
								);	*/
				
	Device_Select #(
							.DATA_WIDTH(32)
						)
						DEV_SEL

							(
								.Address_i(Address_i),
								.Write_Data_i(Write_Data_i),
								.Register_i(Register_i),
								.RAM_i(ram_out),
	
								.Device_sel(Device_o_w),
								.Data_Out_Write(Data_Out_Write_w),
								.Data_Out_Read(Data_Out_Read_w)
							);				

assign Device_o = Device_o_w;

assign GPIO_o = Data_Out_Write_w;
								
endmodule
