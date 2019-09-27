## $t0 is the location of the char we are looking at
## $t1 is the char at that location
## $t2 is the counter  
## $t4 is the 1 char address the we are parsing for
## $t5 is the 1 char at that location

.text 

main: 
	la $a0, User_Input #message sent to user for input
	li $v0, 4 # Loads the print call
	syscall 
	la $a0, string # loads space for users string
	li $a1, 1024 # Loads the allocated number of bytes
	li $v0, 8 # Loads the read string call
	syscall
	la $a0, One_Char # Loads message for user to enter 1 char
	li $v0,4 #loads call
	syscall
	la $a0, char # loads space for users string
	li $a1, 8 # Loads the allocated number of bytes
	li $v0, 8 # Loads the read string call
	syscall 
	la $t0, string #Loads input string address
	li $t2, 0 #sets counter to 0
	la $t4, char #loads char address 
	lb $t5, ($t4) #loads char at the address
	

	
loop1:
	lb $t1, ($t0) # Loads the character at the address
	beqz  $t1, print1 #checks to see if the string is at the end
	beq $t1, $t5, count1 #if char equals string spot count increases
	b increment1
count1: 
	add $t2, $t2, 1 #increment count when char is found
	
increment1:
	add $t0, $t0, 1 #move to next char
	b loop1 #check thaqt char
	
print1: 	
	la $a0 exit_mess #Prints results
	li $v0, 4  
	syscall	
	la $a0 char #Prints results
	li $v0, 4 
	syscall	
	la $a0 equal #Prints results
	li $v0, 4 
	syscall	 
	li $v0, 1	#prints number of occurences		
	move $a0, $t2	
	syscall	
	la $a0, newline # Load the string for the newline
        li $v0, 4 # Load the call to print the string
       syscall # Prints one more newline
	
	la $t0, string #Loads input string address
	move $t2, $zero
	la $a0, Two_Char # Loads message for user to enter 2 char
	li $v0,4 #loads call
	syscall
	la $a0, char2 # loads space for users string
	li $a1, 8 # Loads the allocated number of bytes
	li $v0, 8 # Loads the read string call
	la $t4, char2 #loads char address 
	lb $t5, ($t4) #loads 1st char at the address
	lb $t7, 1($t4) # loads 2nd char
	syscall 
	
	
		
loop2:
	lb $t1, ($t0) # Loads the character at the address 
	lb $t6, 1($t0)
	beqz $t1, print2 #checks to see if the string is at the end
	beq $t1, $t5, next
next:	beq $t6, $t7, count2
	b increment2
	
count2: 
	add $t2, $t2, 1 #increment count when char is found
	
increment2:
	add $t0, $t0, 1 #move to next char
	b loop2 #check thaqt char
print2:
 	la $a0 exit_mess #Prints results
	li $v0, 4 
	syscall	
	la $a0 char2 #Prints results
	li $v0, 4
	syscall	
	la $a0 equal #Prints results
	li $v0, 4
	syscall	
	li $v0, 1	#prints number of occurences		
	move $a0, $t2	
	syscall	
	la $a0, newline # Load the string for the newline
        li $v0, 4 # Load the call to print the string
       syscall # Prints one more newlin
	
Restart:
	la $a0, reset #message sent to user for input
	li $v0, 4 # Loads the print call
	syscall 
	la $a0, reply # loads space for users string
	li $a1, 4 # Loads the allocated number of bytes
	li $v0, 8 # Loads the read string call
	syscall
	la $t8, reply #Loads input string address
	lb $t9, ($t8)
	beq $t9, 'Y', main
	beq $t9, 'y', main
.data 
equal: .asciiz "= "
User_Input: .asciiz "Enter a string of at most 100 characters: "
One_Char: .asciiz  "Enter a character(Lower Case): "
Two_Char: .asciiz "Enter a string of two characters(Lower Case): "
 string: .space 1024 # Space for the string to be entered
 reset: .asciiz "Repeat (Y/N)? "
 reply: .space 8
  char2: .space 8
  char:  .space 8
exit_mess: .asciiz "Number of occurrences of "
newline: .asciiz "\n"