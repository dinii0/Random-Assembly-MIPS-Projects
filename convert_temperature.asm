        .data
info1:  .asciiz "Write the value of temperature in Celcius: "
info2:  .asciiz "The value you provided in Fahrenheit is: "
num1:   .float 1.8 # (9 / 5) = 1.8
num2:   .float 32.0
        .globl main
        .text

main:
    li $v0, 4
    la $a0, info1
    syscall

    li $v0, 6
    syscall
    mov.s $f1, $f0

    l.s $f4, num1
    mul.s $f2, $f1, $f4
    l.s $f5, num2
    add.s $f3, $f2, $f5

    li $v0, 4
    la $a0, info2
    syscall

    mov.s $f12, $f3
    li $v0, 2
    syscall

    li $v0, 10
    syscall
