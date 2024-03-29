onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/clk
add wave -noupdate -radix binary /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/Op
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/Control/State_and_Signals/state
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/PC
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/SrcA
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/SrcB
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ALUResult
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Reg_File/Write_Data_i
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Reg_File/ra/enable
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Reg_File/sp/enable
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Reg_File/a2/enable
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/Reg_File/a0/enable
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ROM_RAM/RAM/Write_Enable
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ROM_RAM/RAM/Write_Data
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ROM_RAM/RAM/Address
add wave -noupdate -radix hexadecimal /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ROM_RAM/RAM/Read_Data
add wave -noupdate /RISC_V_Multi_Cycle_Processor_TB/UUT/RISC_V/DataPath/ROM_RAM/MEM_OUT/Selector
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 534
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
WaveRestoreZoom {206241 ps} {237065 ps}
