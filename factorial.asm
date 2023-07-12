		.data
str1:	.asciiz "Write a number you wish to calculate factorial with: "
str2:	.asciiz "Total it's: "
		.globl main
		.text


main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s0, $v0
	li $s1, 1

	loop:
		bgtz $s0, multiply
		j exit

multiply:
	mul $s1, $s1, $s0
   	sub $s0, $s0, 1
    j loop

exit:
	la $a0, str2
	li $v0, 4
	syscall

	move $a0, $s1
    li $v0, 1
    syscall

	li $v0, 10
    syscall