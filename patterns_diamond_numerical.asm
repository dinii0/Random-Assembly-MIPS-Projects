        .data
str1:   .asciiz "How many lines should the pattern have: "
        .globl main
        .text

main:
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $t2, 1
    li $t4, 1
    li $t5, 2

upper_loop:
    blt $t2, $t1, print_upper

    move $t3, $t1
    li $t4, 1
    li $t5, 2

lower_loop:
    blt $zero, $t3, print_lower
    j end_program

print_upper:
    move $t6, $t1
    sub $t6, $t6, $t2
    li $t7, 0

space_loop_upper:
    blt $t7, $t6, print_space_upper
    j print_number_upper

print_space_upper:
    li $v0, 11
    li $a0, 32
    syscall

    addi $t7, $t7, 1
    j space_loop_upper

print_number_upper:
    move $t8, $t2

print_descending_upper:
    beq $t8, $zero, print_ascending_upper
    li $v0, 1
    move $a0, $t8
    syscall

    sub $t8, $t8, 1
    j print_descending_upper

print_ascending_upper:
    move $t9, $t5

print_ascending_loop_upper:
    bgt $t9, $t2, newline_upper
    li $v0, 1
    move $a0, $t9
    syscall

    addi $t9, $t9, 1
    j print_ascending_loop_upper

newline_upper:
    li $v0, 11
    li $a0, 10
    syscall

    addi $t2, $t2, 1
    j upper_loop

print_lower:
    move $t6, $t1
    sub $t6, $t6, $t3
    li $t7, 0

space_loop_lower:
    blt $t7, $t6, print_space_lower
    j print_number_lower

print_space_lower:
    li $v0, 11
    li $a0, 32
    syscall

    addi $t7, $t7, 1
    j space_loop_lower

print_number_lower:
    move $t8, $t3

print_descending_lower:
    beq $t8, $zero, print_ascending_lower
    li $v0, 1
    move $a0, $t8
    syscall

    sub $t8, $t8, 1
    j print_descending_lower

print_ascending_lower:
    move $t9, $t5

print_ascending_loop_lower:
    bgt $t9, $t3, newline_lower
    li $v0, 1
    move $a0, $t9
    syscall

    addi $t9, $t9, 1
    j print_ascending_loop_lower

newline_lower:
    li $v0, 11
    li $a0, 10
    syscall

    sub $t3, $t3, 1
    j lower_loop

end_program:
    li $v0, 10
    syscall
