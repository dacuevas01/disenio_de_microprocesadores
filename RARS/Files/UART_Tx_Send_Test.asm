.data
TX: .word 0
RX: .word 0
TX_i: .word 0

.text
la s10,TX
la s11,RX
la s9, TX_i

addi t0,zero,0x2FF
sw t0,44(s10)

loop_tx_send:
	#addi t0,zero,0x112  #test prupouse
	#sw t0,40(s9)  #test prupouse
	lw t1,32(s9)
	andi t2,t1,0x100
	addi s0,zero,0x100
	beq s0,t2,exit_loop_tx_send
	jal loop_tx_send
exit_loop_tx_send:
	nop
