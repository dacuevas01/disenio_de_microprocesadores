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

loop_UART_Rx:
	lw a0,44(s11)
	andi t1, a0, 0x200  
	beq s0, t1, exit_UART_Rx_loop
	jal ra, loop_UART_Rx

exit_UART_Rx_loop:
	jal factorial # Calling procedure
	j exit	# Jump to Main label
	
factorial:
	slti t0, a0, 1 # if n < 1
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

exit:
	nop