.data
str:
	.space 16
.text
main:
	li $v0, 8
	la $a0, str	
	li $a0, 16
	syscall

	li $v0, 10
	syscall
