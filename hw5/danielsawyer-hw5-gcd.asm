.data
inputx: .asciiz "\nEnter input x: "
inputy: .asciiz "\nEnter input y: "
printgcd: .asciiz "\nGCD = "
repeat: .asciiz "\nEnter 0 to run again: "
.text

main:
#gets x value
li $v0, 4 #loads syscall print_string
la $a0, inputx #gets string
syscall #prints string
li $v0, 5 #loads syscall read int
syscall #reads x into $v0
move $t0, $v0 #$t0=x
#get absolute value
slt $t2, $t0, $zero
beq $t2, $zero, gety
sub $t0, $zero, $t0

#gets y value
gety:
li $v0, 4 #loads print_string syscall
la $a0, inputy #loads string inputy
syscall #prints string
li $v0, 5
syscall
move $t1, $v0
#get absolute value
slt $t2, $t1, $zero
beq $t2, $zero, gcd
sub $t1, $zero, $t1

#find gcd
gcd:
divu $t0, $t1
mfhi $t2
move $t0, $t1
move $t1, $t2
bgt $t1, $zero, gcd

#print gcd
li $v0, 4
la $a0, printgcd
syscall
li $v0, 1
move $a0, $t0
syscall

#ask to repeat
li $v0, 4
la $a0, repeat
syscall
li $v0, 5
syscall
beq $v0, $zero, main

#quits program
li $v0, 10
syscall