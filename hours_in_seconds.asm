		.data
str1:	.asciiz "Write the amount of hours you wish to convert: "
str2:	.asciiz "h in second is "
		.globl main
		.text

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	li $s1, 60
	mul $s1, $s1, $s0

	move $a0, $s0
    li $v0, 1
    syscall

	la $a0, str2
	li $v0, 4
	syscall

	move $a0, $s1
    li $v0, 1
    syscall

    li $v0, 10
    syscall