        .data
array:  .word 7, 3, 1, 4, 2, 8, 3 # Type your array here
length: .word 7 # Array's length, keep this updated every time you re-write the array
str1:   .asciiz "Your sorted array looks like this: "
        .text
        .globl main

main:
    la $t0, array
    lw $t1, length
    li $t2, 1

loop_outside:
    bge $t2, $t1, exit_outside

    sll $t3, $t2, 2
    add $t3, $t3, $t0
    lw $t4, 0($t3)
    sub $t5, $t2, 1

loop_inside:
    blt $t5, $zero, exit_inside

    sll $t6, $t5, 2
    add $t6, $t6, $t0
    lw $t7, 0($t6)
    slt $t8, $t4, $t7
    beqz $t8, exit_inside

    sw $t7, 0($t3)
    sw $t4, 0($t6)

    sub $t5, $t5, 1
    sub $t3, $t3, 4

    j loop_inside

exit_inside:
    addi $t2, $t2, 1
    j loop_outside

exit_outside:
    la $t9, array
    li $t8, 0

    li $v0, 4
    la $a0, str1
    syscall

print_array:
    lw $a0, 0($t9)
    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    addi $t9, $t9, 4
    addi $t8, $t8, 1
    blt $t8, $t1, print_array

    li $v0, 10
    syscall
