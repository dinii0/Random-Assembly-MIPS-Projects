        .data
array:  .word 1, 3, 5, 6, 8, 9, 10 # Type your array here
number: .word 10 # Type which number you want to be found
str1:   .asciiz "Element is found at index: "
str2:   .asciiz "Element is not found!"
        .text
        .globl main

main:
    la $t0, array
    lw $t1, number
    li $t2, 0
    la $t3, array
    lw $t4, array + 24

element_search:
    bgt $t2, $t4, element_not_found
    add $t5, $t2, $t4
    sra $t5, $t5, 1
    sll $t6, $t5, 2
    add $t6, $t6, $t3
    lw $t7, 0($t6)

    blt $t7, $t1, move_right
    beq $t7, $t1, element_found

    sub $t4, $t5, 1
    j element_search

move_right:
    addi $t2, $t5, 1
    j element_search

element_found:
    li $v0, 4
    la $a0, str1
    syscall

    move $a0, $t5
    li $v0, 1
    syscall

    j end_program

element_not_found:
    li $v0, 4
    la $a0, str2
    syscall

end_program:
    li $v0, 10
    syscall
