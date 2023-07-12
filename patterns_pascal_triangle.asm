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
    move $t0, $v0
    
    li $t1, 1
    li $t2, 0

    main_loop:
        bge $t2, $t0, end_program
        sub $t3, $t0, $t2

        calculate_space:
            bgt $t1, $t3, end_calculate_space

            li $a0, ' '
            li $v0, 11
            syscall

            addi $t1, $t1, 1
            j calculate_space

        end_calculate_space:
            li $t4, 1

            move $a0, $t4
            li $v0, 1
            syscall

            li $a0, ' '
            li $v0, 11
            syscall

            li $t5, 1
            calculate_number:
                bgt $t5, $t2, end_calculate_number

                sub $t6, $t2, $t5
                addi $t6, $t6, 1
                mul $t4, $t4, $t6
                div $t4, $t5
                mflo $t4

                move $a0, $t4
                li $v0, 1
                syscall

                li $a0, ' '
                li $v0, 11
                syscall

                addi $t5, $t5, 1

                j calculate_number

            end_calculate_number:
                li $a0, 10
                li $v0, 11
                syscall

        addi $t2, $t2, 1
        li $t1, 1

        j main_loop

    end_program:
        li $v0, 10
        syscall
