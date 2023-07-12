		.data
str1: 	.asciiz "Enter a number: "
str2: 	.asciiz "The number is automorphic."
str3: 	.asciiz "The number is not automorphic."
		.text
		.globl main

main:
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blez $t0, make_positive 

    move $t1, $t0
    mul $t1, $t1, $t0

calculate_loop:
    blez $t0, number_its_automorphic

    div $t0, $t0, 10
    mfhi $t2 

    div $t1, $t1, 10
    mfhi $t3
    bne $t2, $t3, number_isnt_automorphic

    j calculate_loop

number_its_automorphic:
    li $v0, 4
    la $a0, str2
    syscall

    j end_program

number_isnt_automorphic:
    li $v0, 4
    la $a0, str3
    syscall

    j end_program

make_positive:
    neg $t0, $t0 
    mul $t1, $t0, $t0
    j calculate_loop

end_program:
    li $v0, 10
    syscall
