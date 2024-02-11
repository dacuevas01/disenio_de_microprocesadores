#include <stdio.h>
#int Vector_1[9] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
#int Vector_2[9] = { -1,2,-3,4,-5,6,-7,8,-9 };
#int i = 0;
#int resultado = 0;
#int Producto(int, int);
#int main(void) {
#for (i = 0; i < 9; i++)
#	{
#		result = result + ProductFunction(Vector_1[i], Vector_2[i]);
#	}
#}
#int ProductFunction(int a, int b)
#{
	#return(a*b);
#}
.data
	Vector_1: .word 1 2 3 4 5 6 7 8 9
	Vector_2: .word -1 -2 -3 -4 -5 -6 -7 -8 -9
	
.text
#s1 = Vector1
#s2 = Vector2
#s0 = i
#s3 = result
#a0 = bge constant
#a1 = result
#a2 = result from function
#a3 = load Vector 1
#a4 = load Vector 2
main:
	la s1, Vector_1 #Map Vector1
	la s2, Vector_2 #Map Vector2
	addi s0, zero, 0 #Init i
	addi a0, zero, 9 #Init for comparator = 9
	addi a1, zero, 0 #Init resutl = 0
for_i:
	jal ra, ProductoFunction
	add s3, s3, a2
	slt t2, s0, a0
	beq t2, zero, exit_for_i
	addi s0, s0, 1
	j for_i

ProductoFunction:
#loading Vector1
	slli t1, s0, 2
	add t1, t1 , s1
	lw a3, 0(t1)
#Loading Vector2
	slli t1, s0, 2
	add t1, t1 , s2
	lw a4, 0(t1)
	mul a2, a3, a4
	ret
	
exit_for_i:
	nop
	
	
	
	
	
