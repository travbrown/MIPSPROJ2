.data
	emptyInput:	.asciiz "Input is empty"
	invalidNUm:	.asciiz "Invalid base-31 number
	user_input:	.space 16
.text
main:
	li $v0, 8
	la $a0, user_input
	li $a1, 16
	syscall
	
	loop:
		bgt $t0, 3, exit

	li $v0, 10
	syscall
