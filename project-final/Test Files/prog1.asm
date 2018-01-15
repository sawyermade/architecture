;courtesy of the following website: https://cs.nyu.edu/courses/fall14/CSCI-UA.0436-001/MIPS_Test_Programs.html
sub r0,r0,r0     ; set reg[0] to 0, use as base  
lw  r1,0(r0)     ; reg[1] <- mem[0] (= 1)  
lw  r2,4(r0)     ; reg[2] <- mem[4] (= A)  
lw  r3,8(r0)     ; reg[3] <- mem[8] (= B) 
sub r4,r4,r4     ; reg[4] <- 0, running total  
add r4,r2,r4     ; reg[4]+ = A  
slt r5,r2,r3     ; reg[5] <- A < B  
beq r5,r0,2      ; if reg[5] = FALSE, go forward 2 instructions  
add r2,r1,r2     ; A++  
beq r0,r0,-5     ; go back 5 instructions  
sw  r4,0(r0)     ; mem[0] <- reg[4]  
beq r0,r0,-1     ; program is over, keep looping back to here 