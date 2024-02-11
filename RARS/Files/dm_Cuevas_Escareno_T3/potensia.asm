.data

.text
	#a0 = int m
	#a1 = int n
	#t0 = int potencia
	#t1 = temp 1
	#t2 = temp sp recursive funct
	#s0 = output
	main:
		addi t1,zero, 1
		addi a0,zero, 6
		addi a1,zero, 6
		addi t0, a0, 0
		jal ra, potencia
		addi s0,t0,0
		jal ra, exit
	
	potencia:
		sub a1,a1,t1
		if:
			bge a1,t1,else
			addi s0,zero,1
			jalr zero,ra,0
			
		else:
			mul t0,t0,a0
			jal t2,potencia
	exit:
		nop