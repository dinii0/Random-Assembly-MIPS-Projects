        .data
str1:   .asciiz "Write a decimal number: "
str2:   .asciiz " it's your binary number, type 1 if you want to continue converting: "
space1: .space 64
        .globl main
        .text

main: 
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0
    la $t0, space1
    li $s2, 0

divide_number:
    beqz $s0, print_binary

    div $s0, $s0, 2
    mfhi $s1

    sb $s1, ($t0)

    addi $t0, $t0, 1
    addi $s2, $s2, 1
    j divide_number

print_binary:
    sub $t0, $t0, 1
    blez $s2, end_division

    lb $a0, ($t0)
    li $v0, 1
    syscall

    sub $s2, $s2, 1
    j print_binary

end_division:
    li $v0, 4
    la $a0, str2
    syscall

    li $v0, 5
    syscall

    move $s0, $v0
    li $s1, 1

    beq $s0, $s1, main
    j end_program

end_program:
    li $v0, 10
    syscall