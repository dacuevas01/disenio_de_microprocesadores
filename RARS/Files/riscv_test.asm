.data
TX: .word 0
RX: .word 0
TX_i: .word 0

.text
la s10,TX
la s11,RX
la s9, TX_i

test:
	addi s0, zero, 0x200
	addi s1, zero, 0x1
#	addi t0, zero, 0x208 #test prupouse
#	sw t0,44(s11) #test prupouse

loop_UART_Rx:
	lw a0,44(s11)
	andi t1, a0, 0x200  
	beq s0, t1, exit_UART_Rx_loop
	jal ra, loop_UART_Rx

exit_UART_Rx_loop:
	andi a2,a0,0xff
	jal factorial # Calling procedure
	j exit_factorial	# Jump to Main label
	
factorial:
	slti t0, a2, 1 # if n < 1
	beq t0, zero, loop_factorial # Branch to Loop
	addi a0, zero, 1 # Loading 1
	jr ra # Return to the caller	
loop_factorial:	
	addi sp, sp,-8 # Decreasing the stack pointer
	sw ra, 4(sp) # Storing n
	sw a2, 0(sp) #  Storing the resturn address
	addi a2, a2, -1 # Decreasing n
	jal factorial # recursive function
	lw a2, 0(sp) # Loading values from stak
	lw ra, 4(sp) # Loading values from stak
	addi sp, sp, 8 # Increasing stack pointer
	mul a0, a2, a0 # Multiplying n*Factorial(n-1)
	jr ra  # Return to the caller

exit_factorial:
#	addi t0,zero,32
	srli a1,a0,24
	andi a1,a1,0xff
	srli a2,a0,16
	andi a2,a2,0xff
	srli a3,a0,8
	andi a3,a3,0xff
	andi a4,a0,0xff
	
#Primer Tx
	ori a1,a1,0x100
	sw a1,44(s10)
loop_tx1_send:
	  #test prupouse
#	sw a1,32(s9)  #test prupouse
	lw a5,32(s9)
	andi t2,a5,0x100
	addi s0,zero,0x100
	beq s0,t2,exit_loop_tx1_send
	jal loop_tx1_send
exit_loop_tx1_send:

#Segundo Tx
	ori a2,a2,0x100
	sw a2,44(s10)
loop_tx2_send:
	  #test prupouse
#	sw a2,32(s9)  #test prupouse
	lw a5,32(s9)
	andi t2,a5,0x100
	addi s0,zero,0x100
	beq s0,t2,exit_loop_tx2_send
	jal loop_tx2_send
exit_loop_tx2_send:

#Tercer Tx
	ori a3,a3,0x100
	sw a3,44(s10)
loop_tx3_send:
	  #test prupouse
#	sw a3,32(s9)  #test prupouse
	lw a5,32(s9)
	andi t2,a5,0x100
	addi s0,zero,0x100
	beq s0,t2,exit_loop_tx3_send
	jal loop_tx3_send
exit_loop_tx3_send:

#Cuarto Tx
	ori a4,a4,0x100
	sw a4,44(s10)
loop_tx4_send:
	  #test prupouse
#	sw a4,32(s9)  #test prupouse
	lw a5,32(s9)
	andi t2,a5,0x100
	addi s0,zero,0x100
	beq s0,t2,exit_loop_tx4_send
	jal loop_tx4_send
exit_loop_tx4_send:

