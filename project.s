.data
str:
	.space 16
.text
main:
	li $v0, 8
	la $a0, str	
	li $a1, 16
	syscall
	
	loop:
		bgt $t0, 3, exit

	li $v0, 10
	syscall
