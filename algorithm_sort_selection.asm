        .data
array:  .word 7, 3, 1, 4, 2, 8, 3 # Type your array here
length: .word 7 # Array's length, keep this updated every time you re-write the array
str1:   .asciiz "Your sorted array looks like this: "
        .text
        .globl main

main:
    la $t0, array
    lw $t1, length
    li $t2, 0

loop_outer:

    bge $t2, $t1, exit_outer
    move $t3, $t2
    addi $t4, $t2, 1

loop_inner:
    bge $t4, $t1, exit_inner

    sll $t5, $t4, 2
    add $t5, $t5, $t0
    lw $t6, 0($t5)

    sll $t7, $t3, 2
    add $t7, $t7, $t0
    lw $t8, 0($t7)

    slt $t9, $t6, $t8
    beqz $t9, increment_inner
    move $t3, $t4

increment_inner:
    addi $t4, $t4, 1
    j loop_inner

exit_inner:
    move $t5, $t2
    sll $t5, $t5, 2
    add $t5, $t5, $t0
    lw $t6, 0($t5)

    move $t7, $t3
    sll $t7, $t7, 2
    add $t7, $t7, $t0

    lw $t8, 0($t7)
    sw $t6, 0($t7)
    sw $t8, 0($t5)

    addi $t2, $t2, 1
    j loop_outer

exit_outer:
    la $t0, array
    lw $t1, length
    li $v0, 4
    li $t2, 0
    
    li $v0, 4
    la $a0, str1
    syscall

loop_print:
    bge $t2, $t1, exit_print

    lw $a0, 0($t0)
    move $a1, $t2

    jal print_int

    li $a0, 32
    li $v0, 11
    syscall

    addi $t0, $t0, 4
    addi $t2, $t2, 1
    j loop_print

exit_print:
    li $v0, 10
    syscall

print_int:
    sub $sp, $sp, 4
    sw $ra, 0($sp)

    move $t3, $a0

    li $v0, 1
    move $a0, $t3

    syscall

    lw $ra, 0($sp)
    add $sp, $sp, 4

    jr $ra
