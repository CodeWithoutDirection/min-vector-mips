.data
vec: .word 3, 5, 6, -3, 10, -6, 2, 4
.text
.globl main

main:
	la $a0, vec # valor en memoria del vector v[0]
	addi $a1, $zero, 8 # tamaño del vector

	jal min_vector
	j exit

min_vector:
	lw $s0, 0($a0) # almacena el valor en posicion de memoria x
	j incr_vector

comp:
	lw $s1, 0($a0) # almacena el valor del vector
	bgt $s1, $s0, incr_vector # si s1 > s0 -> incrementa la posicion del vector
	move $s0, $s1
	j incr_vector

incr_vector:
	addi, $a1, $a1, -1
	beq $a1, $zero, return # si el valor incrementado es igual al tamaño del vector, return
	addi $a0, $a0, 4 # incrementa el valor en memoria del vector
	j comp
	
return:
	jr $ra

exit:
	li $v0, 10
	syscall

