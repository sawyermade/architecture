;courtesy of the following website: https://cs.nyu.edu/courses/fall14/CSCI-UA.0436-001/MIPS_Test_Programs.html
sub r0,r0,r0      ; set reg[0] to 0 
lw  r1,0(r0)      ; reg[1] <- mem[0] (= 20)  
lw  r2,0(r1)      ; reg[2] <- mem[20]  
lw  r3,4(r1)      ; reg[3] <- mem[24] 
and r4,r2,r3      ; reg[4] <- reg[2] AND reg[3]  
or  r5,r2,r3      ; reg[5] <- reg[2] OR reg[3]  
sw  r4,4(r0)      ; mem[4] <- reg[4]  
sw  r5,8(r0)      ; mem[8] <- reg[5]  
beq r0,r0,-1      ; program is over, loop back here  