.data

.text
	#a0 = int m
	#a1 = int n
	#a3 = int potencia
	#a4 = int first 
	#t1 = temp 1
	#t2 = temp sp recursive funct
	#s0 = output
	main:
		addi t1,zero, 1
		addi a0,zero, 6
		addi a1,zero, 3
		addi a3, a0, 0
		jal ra, potencia
		addi s0,t0,0
		jal ra, exit
	
	potencia:
		slti t0,a1,1 #if(n<1)
		beq t0,zero,if #if(n<1)
		addi a3,zero,1 #potencia = 1
		jr ra #exit potencia function
		if:
			addi sp,sp,-8 #reserving 2 memory spaces
			sw ra,4(sp) #storing sp in one reserved memory space
			sw a0,0(sp) #storing n in other reserved memory space
			addi a1,a1,-1 #resting 1 to n
			jal ra,potencia #recurisve function return
			lw ra, 4(sp) #loading ra
			lw a0, 0(sp) #loading n
			addi sp,sp, 8 #freeing the memory
			mul a3,a3,a0
			jr ra
	exit:
		nop