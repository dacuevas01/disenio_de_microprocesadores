 #for (i = 0; i < n; i++) {
 #       for (j = 0; j < n; j++) {
 #               c[i] = c[i]+ a[i][j] * b[j];
 #           }
 #       }

.data
	vector: .word 1 2 3 4
	row_0: .word 1 2 3 4
	row_1: .word 5 6 7 8
	row_2: .word 9 10 11 12
	row_3: .word 13 14 15 16
	result: .word 0
.text
	#a0 = i
	#a1 = j	
	#a2 = Address variable for matrix shift 32 bits
	#a4 = load vector
	#a5 = load Matrix
	#s3 = Store res
	main:
	la s4,vector
	#auipc s4,vector
	#addi s4,s4,0 
	la s0,row_0 #Matrix
	#auipc s0,row_0
	#addi s0,s0,0
	la s5,result
	#auipc s5,result
	#addi s5,s5,0
	
	addi a1,zero,0
	addi a2,zero,0
	addi s3,zero,0
	addi a0,zero,0
	loop_i:
		#reset result
		addi s3,zero,0
		slti t0,a0,4
		beq t0,zero,exit_loop_i
		addi a1,zero,0
		loop_j:
			slti t0,a1,4
			beq t0,zero,exit_loop_j
			#access vector memory
			slli t0,a1,2
			add t0,t0,s4
			lw a4,0(t0)
			#access matrix memory		
			slli t1,a1,2
			add t1,t1,s0
			add t1,t1,a2
			lw a5,0(t1)
			#mult
			mul t0,a4,a5
			add s3,s3,t0
			#sum j variable
			addi a1,a1,1
			jal zero, loop_j
		exit_loop_j:
		#store value
		slli t2,a0,2
		add t2,t2,s5
		sw s3,0(t2)
		#sum i variable
		addi a0,a0,1
		#shift register matrix
		slli a2,a0,4
		jal zero, loop_i
	exit_loop_i:
	nop 
			
			