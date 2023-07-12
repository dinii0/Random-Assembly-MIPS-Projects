        .data
str1:   .asciiz "Write a random sentence you would like to mirror it: "
str2:   .asciiz "Your mirrored word looks like this: "
space1: .space 64
        .globl main
        .text

main: 
    li $v0, 4
    la $a0, str1
    syscall
    
    li $v0, 8
    la $a0, space1
    li $a1, 64
    syscall

    move $t0, $a0
    li $s1, -1
    li $s2, -1

    check_number_letters:
        lb $s0, ($t0)
        beqz $s0, establish_characters
        addi $t0, $t0, 1
        addi $s1, $s1, 1
        j check_number_letters
    
    establish_characters:
        sub $t0, $t0, 2  # We don't count newlines

        li $v0, 4
        la $a0, str2
        syscall

    mirror_characters:
        beq $s1, $s2, end_program
        
        lb $a0, ($t0)
        li $v0, 11
        syscall

        sub $t0, $t0, 1
        sub $s1, $s1, 1
        j mirror_characters
    
    end_program:
        li $v0, 10
        syscall
