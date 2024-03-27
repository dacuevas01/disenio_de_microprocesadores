
.text
main:
	li a2,15 # Loading constant
	jal factorial # Calling procedure
	j exit	# Jump to Main label
	
factorial:
	slti t0, a2, 1 # if n < 1
	beq t0, zero, loop # Branch to Loop
	addi a0, zero, 1 # Loading 1
	jr ra # Return to the caller	
loop:	
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

