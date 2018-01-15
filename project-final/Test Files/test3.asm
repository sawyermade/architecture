addi $t1, $zero, 1
addi $t2, $zero, 1
bne $t1, $t2, iloop
slti $t3, $t1, 2
bne $t1, $t3, iloop
slti $t3, $t1, 0
bne $zero, $t3, iloop
bne $zero, $t1, branch1
j iloop
branch1: j jump1
j iloop
jump1: andi $t3, $t1, 2
bne $zero, $t3, iloop
ori $t3, $t1, 2
addi $t2, $t2, 2
bne $t2, $t3, iloop
xori $t3, $t1, 3
addi $t2, $zero, 2
bne $t2, $t3, iloop
addi $t3, $zero, 3
xor $t4, $t1, $t3
bne $t2, $t4, iloop
end: beq $zero, $zero, end
iloop: addi $t1, $t1, 1 
j iloop
