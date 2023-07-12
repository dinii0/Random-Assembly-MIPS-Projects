		.data
str1: 	.asciiz "Write the value of side a: "
str2: 	.asciiz "Write the value of side b: "
str3: 	.asciiz "Write the value of side c: "
str4:	.asciiz "Sides you provided can build a Pythagorian Triangle!"
str5:	.asciiz "Sides you provided can NOT build a Pythagorian Triangle!"
		.globl main
		.text

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	la $a0, str2
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	la $a0, str3
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s2, $v0

	mul $s0, $s0, $s0
	mul $s1, $s1, $s1
	mul $s2, $s2, $s2

	add $s3, $s1, $s0
	beq $s3, $s2, equal

	add $s3, $s1, $s2
	beq $s3, $s0, equal

	add $s3, $s2, $s0
	beq $s3, $s1, equal

	la $a0, str5
	li $v0, 4
	syscall

	j exit

equal: 
	la $a0, str4
	li $v0, 4
	syscall

	j exit

exit:
	li $v0, 10
    syscall