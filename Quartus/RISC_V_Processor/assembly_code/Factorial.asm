# Author: Luis Pizano, modified by Roberto Vazquez and Luis Almonte
# Date: Dec 23, 2021

.text
Main:
	li $sp, 0x10010100 #stack top limit
	ori $a0,$a0, 3 # Loading constant 
	jal Factorial # Calling Factorial procedure
	add $s7, $zero, $v0 #Saving result
	j Exit	# Jump to Exit label
	
Factorial:
	slti $t0, $a0, 1 # if n < 1
	beq $t0, $zero, Loop # Branch to Loop
	addi $v0, $zero, 1 # Loading 1
	jr $ra # Return to the caller	
Loop:	
	addi $sp, $sp,-8 # Decreasing the stack pointer
	sw $ra 4($sp) # Storing return address
	sw $a0, 0($sp) #  Storing n
	addi $a0, $a0, -1 # Decreasing n
	jal Factorial # Recursive function
	lw $a0, 0($sp) # Loading n from stack
	lw $ra, 4($sp) # Loading return address from stack
	addi $sp, $sp, 8 # Increasing stack pointer
	mul $v0, $a0, $v0 # Multiplying n*Factorial(n-1)
	jr $ra  # Return to the caller
Exit:
nop
nop
nop
	
