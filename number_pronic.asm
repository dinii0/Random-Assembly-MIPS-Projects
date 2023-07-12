		.data
str1:	.asciiz "Write a number you would like to check if the number is Pronic: "
str2:	.asciiz "The number you wrote is Pronic!"
str3:	.asciiz "The number you wrote is NOT Pronic!"
		.globl main
		.text

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $s0, $v0
	li $s1, 0

	find_number:
		addi $s2, $s1, 1
		mul $s2, $s1, $s2

		addi $s1, $s1, 1
		beq $s2, $s0, number_its_perfect
		bgt $s2, $s0, number_isnt_perfect
		j find_number

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
