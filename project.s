.data
str:
	.space 16
.text
main:
	li $v0, 8
	la $a0, str	

	li $v0, 10
	syscall
