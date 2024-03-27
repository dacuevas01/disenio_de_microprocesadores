module Mux32x1
#(
	parameter DATA_WIDTH = 32
)
(
	input			[4:0]					Selector,
	input			[DATA_WIDTH-1:0]	I_0,
	input			[DATA_WIDTH-1:0]	I_1,
	input			[DATA_WIDTH-1:0]	I_2,
	input			[DATA_WIDTH-1:0]	I_3,
	input			[DATA_WIDTH-1:0]	I_4,
	input			[DATA_WIDTH-1:0]	I_5,
	input			[DATA_WIDTH-1:0]	I_6,
	input			[DATA_WIDTH-1:0]	I_7,
	input			[DATA_WIDTH-1:0]	I_8,
	input			[DATA_WIDTH-1:0]	I_9,
	input			[DATA_WIDTH-1:0]	I_10,
	input			[DATA_WIDTH-1:0]	I_11,
	input			[DATA_WIDTH-1:0]	I_12,
	input			[DATA_WIDTH-1:0]	I_13,
	input			[DATA_WIDTH-1:0]	I_14,
	input			[DATA_WIDTH-1:0]	I_15,
	input			[DATA_WIDTH-1:0]	I_16,
	input			[DATA_WIDTH-1:0]	I_17,
	input			[DATA_WIDTH-1:0]	I_18,
	input			[DATA_WIDTH-1:0]	I_19,
	input			[DATA_WIDTH-1:0]	I_20,
	input			[DATA_WIDTH-1:0]	I_21,
	input			[DATA_WIDTH-1:0]	I_22,
	input			[DATA_WIDTH-1:0]	I_23,
	input			[DATA_WIDTH-1:0]	I_24,
	input			[DATA_WIDTH-1:0]	I_25,
	input			[DATA_WIDTH-1:0]	I_26,
	input			[DATA_WIDTH-1:0]	I_27,
	input			[DATA_WIDTH-1:0]	I_28,
	input			[DATA_WIDTH-1:0]	I_29,
	input			[DATA_WIDTH-1:0]	I_30,
	input			[DATA_WIDTH-1:0]	I_31,
	
	output reg 	[DATA_WIDTH-1:0]	Mux_Out
);
	
	always@(*) begin
		case (Selector)
			0	:	Mux_Out = I_0;
			1	:	Mux_Out = I_1;
			2	:	Mux_Out = I_2;
			3	:	Mux_Out = I_3;
			4	:	Mux_Out = I_4;
			5	:	Mux_Out = I_5;
			6	:	Mux_Out = I_6;
			7	:	Mux_Out = I_7;
			8	:	Mux_Out = I_8;
			9	:	Mux_Out = I_9;
			10	:	Mux_Out = I_10;
			11	:	Mux_Out = I_11;
			12	:	Mux_Out = I_12;
			13	:	Mux_Out = I_13;
			14	:	Mux_Out = I_14;
			15	:	Mux_Out = I_15;
			16	:	Mux_Out = I_16;
			17	:	Mux_Out = I_17;
			18	:	Mux_Out = I_18;
			19	:	Mux_Out = I_19;
			20	:	Mux_Out = I_20;
			21	:	Mux_Out = I_21;
			22	:	Mux_Out = I_22;
			23	:	Mux_Out = I_23;
			24	:	Mux_Out = I_24;
			25	:	Mux_Out = I_25;
			26	:	Mux_Out = I_26;
			27	:	Mux_Out = I_27;
			28	:	Mux_Out = I_28;
			29	:	Mux_Out = I_29;
			30	:	Mux_Out = I_30;
			31	:	Mux_Out = I_31;
		endcase	
	end	
endmodule
