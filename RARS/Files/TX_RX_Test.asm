.data
TX: .word 0
RX: .word 0
TX_i: .word 0
.text
la s10,TX
la s11,RX
la s9, TX_i
#send Tx
addi t0,zero,0x204
sw t0,40(s9)
#rx recive
loop_UART_Rx:
	lw a0,44(s11)
	andi t1, a0, 0x200  
	beq s0, t1, exit_UART_Rx_loop
	jal ra, loop_UART_Rx

exit_UART_Rx_loop:
	andi t0,a0,0xff
	addi t1,zero,0x2
	mul t0,t0,t1
	
