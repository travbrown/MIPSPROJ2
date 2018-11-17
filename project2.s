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

	                                # empty input check
        la $t1, user_input              # set pointer
        lb $t7, 0($t1)                  # load first element of string into register
        beq $t7, 10, empty_error        # Check for new line
        beq $t7, 0, empty_error
	
	addi $s2, $0, 31                # Set Base number
        addi $t5, $0, 0
        addi $t4, $0, 1
        addi $t6, $0, 0

space_processing:
	lb $t7,0($t1)
	addi $t1, $t1, 1
        addi $t3, $t3, 1
        beq $t7, 32, space_processing   # loop and move forward if space detected
        beq $t7, 10, empty_error        # branches to Empty_error label if new line found
        beq $t7, $0, empty_error
                                        # if a character is next, it will move on to next label automatically

char_processing:
        lb $t7,0($t1)
	
exit:
	move $a0, $t6                   # moves sum to a0
        li $v0, 1                       # prints contents of a0
        syscall
        li $v0,10                       # Successfully ends program
        syscall

# Error Branches

too_long_error:
	la $a0, longInput
        li $v0, 4
        syscall

        li $v0, 10
        syscall
