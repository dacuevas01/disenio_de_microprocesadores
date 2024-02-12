onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_TB/DUT/DataPath/clk
add wave -noupdate /MIPS_TB/DUT/DataPath/reset
add wave -noupdate -radix unsigned /MIPS_TB/DUT/DataPath/GPIO_i
add wave -noupdate -radix decimal /MIPS_TB/DUT/DataPath/GPIO_o
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/PC_En
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/I_or_D
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/Mem_Write
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/IR_Write
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/Reg_Dst
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/Mem_to_Reg
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/Reg_Write
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/ALU_Src_A
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/ALU_Src_B
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/ALU_Control
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/PC_Src
add wave -noupdate -group {Control Signals} /MIPS_TB/DUT/DataPath/Zero
add wave -noupdate -radix unsigned /MIPS_TB/DUT/Control/State_and_Signals/state
add wave -noupdate /MIPS_TB/DUT/DataPath/Op
add wave -noupdate /MIPS_TB/DUT/DataPath/Funct
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/PC_Next
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/PC
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Adr
add wave -noupdate -radix hexadecimal -childformat {{{/MIPS_TB/DUT/DataPath/Read_Data[31]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[30]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[29]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[28]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[27]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[26]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[25]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[24]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[23]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[22]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[21]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[20]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[19]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[18]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[17]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[16]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[15]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[14]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[13]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[12]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[11]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[10]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[9]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[8]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[7]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[6]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[5]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[4]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[3]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[2]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[1]} -radix hexadecimal} {{/MIPS_TB/DUT/DataPath/Read_Data[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_TB/DUT/DataPath/Read_Data[31]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[30]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[29]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[28]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[27]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[26]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[25]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[24]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[23]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[22]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[21]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[20]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[19]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[18]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[17]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[16]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[15]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[14]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[13]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[12]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[11]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[10]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[9]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[8]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[7]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[6]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[5]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[4]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[3]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[2]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[1]} {-height 15 -radix hexadecimal} {/MIPS_TB/DUT/DataPath/Read_Data[0]} {-height 15 -radix hexadecimal}} /MIPS_TB/DUT/DataPath/Read_Data
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Instr
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Data
add wave -noupdate -radix unsigned /MIPS_TB/DUT/DataPath/Write_Register
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Write_Data
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/RD1
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/RD2
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/A
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/B
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Sign_Imm
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Shifted_Imm
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Src_A
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/Src_B
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/ALU_Result
add wave -noupdate -radix hexadecimal /MIPS_TB/DUT/DataPath/ALU_Out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 258
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
WaveRestoreZoom {28 ps} {80 ps}
