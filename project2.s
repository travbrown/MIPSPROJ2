.data
	emptyInput: .asciiz "Input is empty"
	invalidNum: .asciiz "Invalid base-31 number"
	user_input:	.space 1000
	longInput:	.asciiz "Input is too long."	
.text
main:
	li $v0, 8
	la $a0, user_input
	li $a1, 16
	syscall
	
	li $t0, 0 #initialize count to zero	


	li $v0, 10
	syscall
