.data
	emptyInput:	.asciiz "Input is empty"
	invalidNum:	.asciiz "Invalid base-31 number"
	user_input:	.space 1000
	longInput:	.asciiz "Input is too long."	
.text
main:
	#getting user input
	
	li $v0, 8
	la $a0, user_input
	li $a1, 1000
	syscall

	la $t4, user_input
	lb $t3, 0($t4)
	
#Checking for empty input
	beq $t3, 10, empty_error
	beq $t3, 0, empty_error
	
		
exit:
		la $a0, 
		li $v0, 1
		syscall

		li $v0, 10
		syscall
#Error Branches

too_long_error:
	la $a0, longInput
        li $v0, 4
        syscall

        li $v0, 10
        syscall
