        .data
array:  .word 5, 1, 2, 7, 3, 4, 0 # Type your array here
number: .word 7 # Type which number you want to be found
        .text
        .globl main

main:
    la $t0, array
    li $t1, 0

loop:
    lw $t2, 0($t0)
    lw $t3, number

    beq $t2, $t3, index_found

    addi $t1, $t1, 1
    addi $t0, $t0, 4
    blt $t1, 7, loop

index_not_found:
    li $v0, 1
    li $a0, -1
    syscall

    j end_program 

index_found:
    li $v0, 1
    move $a0, $t1
    syscall

end_program:
    li $v0, 10
    syscall
