		.data
str1:	.asciiz "Write the number you wish to check if its Perfect: "
str2:	.asciiz "Number you provided is Perfect!"
str3:	.asciiz "Number you provided is NOT Perfect!"
		.globl main
		.text

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $s0, $v0
	move $s1, $s0

    li $t0, 1
    li $s2, 0

	verify_number:
		bgt $s1, $t0, divide_number
		j end_algorithm

	divide_number:
		div $s2, $s0, $s1
		mfhi $s3

		addi $s1, $s1, -1
		bgtz $s3, verify_number

		add $s4, $s4, $s2
		j verify_number

	end_algorithm:
		beq $s0, $s4, number_its_perfect
		j number_isnt_perfect

	number_its_perfect:
		la $a0, str2
		li $v0, 4
		syscall

		j end_program

	number_isnt_perfect:
		la $a0, str3
		li $v0, 4
		syscall

		j end_program

	end_program:
    	li $v0, 10
	    syscall