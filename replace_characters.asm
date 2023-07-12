        .data
str1:   .asciiz "Type a sentence: "
str2:   .asciiz "Type a character you wish to replace: "
str3:   .asciiz "Type a character you want to replace the character you mentioned above: "
space1: .space 128
space2: .space 1
space3: .space 1
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

    li $v0, 4
    la $a0, str2
    syscall
    
    li $v0, 8
    la $a0, space2
    li $a1, 64
    syscall
    move $t1, $a0

    li $v0, 4
    la $a0, str3
    syscall
    
    li $v0, 8
    la $a0, space3
    li $a1, 64
    syscall
    move $t2, $a0

    check_letters:
        lb $s0, ($t0)
        beqz $s0, end_program

        lb $s1, ($t1)
        beq $s0, $s1, replace_character

        lb $a0, ($t0)
        li $v0, 11
        syscall

        addi $t0, $t0, 1
        j check_letters

    replace_character:
        lb $a0, ($t2)
        li $v0, 11
        syscall

        addi $t0, $t0, 1
        j check_letters

    end_program:
        li $v0, 10
        syscall