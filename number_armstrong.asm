		.data
str1:	.asciiz "Write the number you wish to check if its Armstrong: "
str2:	.asciiz "Number you provided is Armstrong!"
str3:	.asciiz "Number you provided is NOT Armstrong!"
		.globl main
		.text

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s0, $v0
	move $s2, $s0

	count_numbers:
		bgtz $s2, calculate_values
		move $s2, $s0
		move $s4, $s3
		j verify_armstrong

	calculate_values:
		addi $s3, $s3, 1
		div $s2, $s2, 10
		j count_numbers

	verify_armstrong:
		li $s6, 1
		bgtz $s2, calculate_armstrong
		j end_armstrong

	calculate_armstrong:
		div $s2, $s2, 10
		mfhi $s5
		move $s3, $s4
		j head_armstrong

	head_armstrong:
		bgtz $s3, multiply_armstrong
		j keep_armstrong

	multiply_armstrong:
		addi $s3, $s3, -1
		mul $s6, $s6, $s5

		j head_armstrong

	keep_armstrong:
		add $s7, $s7, $s6

		j verify_armstrong

	end_armstrong:
		beq $s0, $s7, number_its_armstrong
		j number_isnt_armstrong

	number_its_armstrong:
		la $a0, str2
		li $v0, 4
		syscall

		j end_program

	number_isnt_armstrong:
		la $a0, str3
		li $v0, 4
		syscall

		j end_program

	end_program:
    	li $v0, 10
	    syscall