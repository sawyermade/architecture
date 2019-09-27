.data
getstr: .asciiz "\nEnter a string of at most 100 chars: "
getchar: .asciiz "\nEnter a char: "
get2char: .asciiz "\nEnter a string of two chars: "
printo1: .asciiz "\nNumber of occurrences of "
printo2: .asciiz " = "
repeatstr: .asciiz "\nRepeat (Y/N): "
str: .space 101
char: .space 2
char2: .space 3
.text

main:
#prints getstr
li $v0, 4
la $a0, getstr
syscall

#stores string
li $v0, 8
la $a0, str
li $a1, 101
syscall

#gets char
li $v0, 4
la $a0, getchar
syscall
li $v0, 8
la $a0, char
li $a1, 2
syscall

#single occurance
la $t0, str
la $t2, char
lb $t2, ($t2)
li $t3, 0
li $t4, 32

loop1:
lb $t1, ($t0)
beq $t1, $zero, print1
beq $t1, $t2, count1
sub $t5, $t1, $t4
beq $t5, $t2, count1
add $t5, $t1, $t4
beq $t5, $t2, count1
addi $t0, $t0, 1
b loop1

count1:
addi $t3, $t3, 1
addi $t0, $t0, 1
b loop1

print1:
li $v0, 4
la $a0, printo1
syscall
li $v0, 4
la $a0, char
syscall
li $v0, 4
la $a0, printo2
syscall
li $v0, 1
move $a0, $t3
syscall

#2 chars
li $v0, 4
la $a0, get2char
syscall
li $v0, 8
la $a0, char2
li $a1, 3
syscall

#2char occurance
la $t0, str
la $t2, char2
lb $t3, 1($t2)
lb $t2, ($t2)
li $t4, 0
li $t5, 32

loop2:
lb $t1, ($t0)
beq $t1, $zero, print2
beq $t1, $t2, nextchar
sub $t6, $t1, $t5
beq $t6, $t2, nextchar
add $t6, $t1, $t5
beq $t6, $t2, nextchar
addi $t0, $t0, 1
b loop2

nextchar:
lb $t1, 1($t0)
beq $t1, $zero, print2
beq $t1, $t3, count2
sub $t6, $t1, $t5
beq $t6, $t3, count2
add $t6, $t1, $t5
beq $t6, $t3, count2
addi $t0, $t0, 1
b loop2

count2:
addi $t4, $t4, 1
addi $t0, $t0, 1
b loop2

print2:
li $v0, 4
la $a0, printo1
syscall
li $v0, 4
la $a0, char2
syscall
li $v0, 4
la $a0, printo2
syscall
li $v0, 1
move $a0, $t4
syscall

repeat:
li $v0, 4
la $a0, repeatstr
syscall
li $v0, 8
la $a0, char
li $a1, 2
syscall
la $t0, char
lb $t0, ($t0)
li $t1, 89
li $t2, 121
beq $t0, $t1, main
beq $t0, $t2, main

end:
li $v0, 10
syscall