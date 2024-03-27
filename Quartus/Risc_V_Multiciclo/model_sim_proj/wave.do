onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/clk
add wave -noupdate -radix binary /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/Op
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/state
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/tx
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/PC
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/GPIO_o_w
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Device
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/GPIO_Out_w
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/Tx_Sel
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/UART_Register_Tx
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/UART_Register_Tx_w
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/UART/UART_Tx_i/Uart_Tx_Fsm_i/State
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/UART/UART_Tx_i/tx
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/UART/UART_Register_out
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/SrcA
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/SrcB
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ALUResult
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 447
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {196303346 ps} {196333369 ps}
