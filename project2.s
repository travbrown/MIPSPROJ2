.data
	input_too_long: .asciiz "Input is too long."
	user_input: .space 1000
	input_empty: .asciiz "Input is empty."
	wrong_base: .asciiz "Invalid base-31 number."	
.text
main:
	# getting user input
	
	li $v0, 8
	la $a0, user_input
	li $a1, 1000
	syscall
		
	add $t7, $0, 0 			# Initializing registers
	add $t3, $0, 0 

	la $t4, user_input
	lb $t3, 0($t4)
	
# Checking for empty input
	beq $t3, 10, empty_error
	beq $t3, 0, empty_error
	
		
exit:
		la $a0, 
		li $v0, 1
		syscall

		li $v0, 10
		syscall
# Error Branches

too_long_error:
	la $a0, longInput
        li $v0, 4
        syscall

        li $v0, 10
        syscall
