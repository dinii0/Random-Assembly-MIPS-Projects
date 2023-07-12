        .data
str1:   .asciiz "Write a word so we can check if it's a Palindrome: "
str2:   .asciiz "Your word is a Palindrome1"
str3:   .asciiz "Your word is NOT a Palindrome!"
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
    move $t1, $a0

    li $s2, -1

    reach_last_letter:
        lb $s0, ($t0)
        beqz $s0, establish_characters

        addi $t0, $t0, 1
        addi $s2, $s2, 1

        j reach_last_letter

    establish_characters:
        sub $t0, $t0, 2 # We don't count newlines
        sub $s2, $s2, 2 # We don't count newlines

    check_characters:
        lb $s0, ($t0)
        lb $s1, ($t1)

        bne $s0, $s1, not_palindrome

        sub $s2, $s2, 1
        bltz $s2, palindrome

        sub $t0, $t0, 1
        addi $t1, $t1, 1

        j check_characters

    palindrome:
        li $v0, 4
        la $a0, str2
        syscall

        j end_program

    not_palindrome:
        li $v0, 4
        la $a0, str3
        syscall

        j end_program

    end_program:
        li $v0, 10
        syscall