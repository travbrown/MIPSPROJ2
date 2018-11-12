.data
	emptyInput:	.asciiz "Input is empty."
	invalidNUm:	.asciiz "Invalid base-31 number."
	user_input:	.space 1000
	longInput:	.asciiz "Input is too long."
	
.text
main:
	li $v0, 8
	la $a0, user_input
	li $a1, 1000
	syscall
	
	loop:
		bgt $t0, 3, exit

	li $v0, 10
	syscall
