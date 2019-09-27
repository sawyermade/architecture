.data
input_integerx: .asciiz "\nEnter input x: "
input_integery: .asciiz "\nEnter input y: "
repeat: .asciiz "\nEnter 0 to repeat:"
.text

main: #Start
li $v0, 4 # Loads integer 4
la $a0, input_integerx # load address for integer x
syscall # calls system
li $v0, 5 # loads interger 5
syscall # call system
add $t1, $v0, $zero #Copy the value in $v0 to $t1 holding x
li $v0, 4 # Loads integer 4
la $a0, input_integery # load address of input y
syscall # system call
li $v0, 5  # loads interger 5
syscall # system call
add $t2, $v0, $zero #Copy the value $v0 to $t2 holding y
loop1: divu $t1, $t2 # division x/y
mfhi $t3 #remainder stored in H register, copied to $t3
add $t1,$t2,$zero #x will be equal to y 
add $t2,$t3,$zero #y will be equal to x%y 
bgtz $t2, loop1 #brach again to loop1  if $t2 > 0
li $v0, 1 
add $a0, $t1, $zero #  GCD of x and y
syscall # system call
li $v0, 4 #  load integer 4
la $a0, repeat # load address of repeat string
syscall # system call 
li $v0, 5 # load interger = 5
syscall # system call
beq $v0,$zero, main #Jump if user input want to repeat
li $v0, 10 # load integer 10
syscall # system call