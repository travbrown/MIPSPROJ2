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
	addi $t1, $t1, 1
        addi $t3, $t3, 1
        beq $t7, 10, return_to_start    # If string is finished branch to return to start
        beq $t7, 0, return_to_start
        bne $t7, 32, char_processing    # If it is NOT a space is found, then it  loops	
	beq $t7, 0, return_to_start
        bne $t7, 32, incorrect_base_error
        j char_space_processing         # loops until it branches to one of the above mentioned labels

return_to_start:
        sub $t1, $t1, $t3               # restart the pointer in character array
        la $t3, 0                       # restart the counter

move_forward:
        lb $t7, 0($t1)
        addi $t1, $t1, 1
        beq $t7, 32, move_forward

addi $t1, $t1, -1

find_length:                            # determine if the length of the string is valid
        lb $t7, ($t1)
        addi $t1, $t1, 1
        addi $t3, $t3, 1
	beq $t7, 10, reset_ptr
        beq $t7, 0, reset_ptr
        beq $t7, 32, reset_ptr
        beq $t3, 5, too_long_error
        j find_length

reset_ptr:                              # resetting the  pointer to the start of the string
        sub $t1, $t1, $t3
        sub $t3, $t3, $t4
        lb $t7, ($t1)
        sub $s4, $t3, $t4	

find_highest_power:
	beq $s4, 0, conversion          # Determing the highest power
        mult $t4, $s2
        mflo $t4
        sub $s4, $s4, 1
        j find_highest_power


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
