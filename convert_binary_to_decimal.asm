        .data
str1:   .asciiz "Write a binary number: "
str2:   .asciiz "You didn't write a binary number! Try again. "
str3:   .asciiz " is your decimal number. Type 1 if you want to continue converting: "
space1: .space 16
        .text
        .globl main

main:
    li $v0, 4
    la $a0, str1
    syscall

    la $a0, space1
    li $a1, 16
    li $v0, 8
    syscall

    li $t0, 0
    la $t1, space1
    li $t2, 16

    move $s3, $t1
    li $s1, -1
    li $s2, '1'

    check_binary:
        lb $s0, ($s3)
        beqz $s0, loop_binaries
        bgt $s0, $s2, invalid_binary
        blt $s0, $zero, invalid_binary
        
        addi $s3, $s3, 1
        addi $s1, $s1, 1
        j check_binary
    
    invalid_binary:
        li $v0, 4
        la $a0, str2
        syscall
    
        j main

    loop_binaries:
        lb $a0, ($t1)
        blt $a0, 48, finish_converting
        addi $t1, $t1, 1
        sub $a0, $a0, 48
        sub $t2, $t2, 1
        beq $a0, 0, loop_binaries
        beq $a0, 1, one_byte
        j convert

    one_byte:
        li $t3, 1
        sllv $t4, $t3, $t2
        add $t0, $t0, $t4
        j loop_binaries

finish_converting:
    srlv $t0, $t0, $t2

    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, str3
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
