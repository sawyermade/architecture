# Compute and factorial number of n (n!)
# Two functions: main and fact

	.text
	.globl main
main: 
	# Register assignments
	# $a0 = n

	# input argument for parameter n	
	la	$a0, msg0
	li 	$v0, 4
	syscall
	li $v0, 5			# Read integer
	syscall			# $v0 = value read
	
	# Passing parameter and call the procedure fact routine
	move $s0, $v0		# Backup input argument in a2
	move $a0, $v0		# put argument in $a0
	jal  fact			# call factorial function

	# After fact returns, then calls the library routine printf and pass it both a format string and the result returned from fact.
	move	$s1, $v0
	la	$a0, msg1
	li 	$v0, 4
	syscall

	move	$a0, $s0
	li	$v0, 1		# print_string syscall code = 1
	syscall

	la	$a0, msg2
	li 	$v0, 4
	syscall
	
	move	$a0, $s1
	li	$v0, 1		# print_string syscall code = 1
	syscall

	la	$a0, msg3
	li 	$v0, 4
	syscall

	li	$v0, 10		# exit
	syscall

	.data
msg0: .asciiz	"Please input parameter n: \n"
msg1: .asciiz	"The factorial of \000"
msg2: .asciiz	" is \000"
msg3: .ascii	".\n"

	# Function fact (n)
	.text
fact:
	addi	$sp, $sp, -12			# Stack frame is 12 bytes long
	sw	$a0, 8($sp)			# Save argument (n)
	sw 	$ra, 4($sp)			# Save return address
	sw	$fp, 0($sp)			# Save frame pointer
	addi	$fp, $sp, 8			# Set up frame pointer

	slti $t0, $a0, 1			# test for n < 1
	beq	$t0, $zero, L1
	addi	$v0, $zero, 1			# if so, result is 1
	lw 	$fp, 0($sp)			# Restore $fp
	addi $sp, $sp, 12			# Pop Stack and return
	jr	$ra

L1:	addi $a0, $a0, -1
	jal  fact
	lw	$a0, 8($sp)			# Restore $ra
	lw	$ra, 4($sp)			# Restore $ra
	lw 	$fp, 0($sp)			# Restore $fp
	addi $sp, $sp, 12		 	# Pop Stack
     mul	$v0, $v0, $a0			# Compute fact (n-1) * n
	jr	$ra					# Return to caller
