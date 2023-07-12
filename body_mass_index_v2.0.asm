        .data
str1:   .asciiz "Write the value of your weight (kilogram): "
str2:   .asciiz "Jepni gjatësin tuaj (meter): "
str3:   .asciiz "Your BMI is: "
        .globl main
        .text

main:
        la $a0, str1
        li $v0, 4
        syscall

        li $v0, 6
        syscall
        mov.s $f1, $f0

        la $a0, str2
        li $v0, 4
        syscall

        li $v0, 6
        syscall
        mov.s $f2, $f0

        mul.s $f3, $f2, $f2
        div.s $f4, $f1, $f3

        mov.s $f12, $f4
        li $v0, 2
        syscall

        li $v0, 10
        syscall