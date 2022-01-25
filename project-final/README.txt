YouTube Video: https://www.youtube.com/watch?v=I6fKkwPYaUg

Readme with processor:

The instruction memory and data memory are ram modules. In order to load the proper tests:

before starting the simulation, be sure to restart the simulation

for test 1 and test 2:
	in instruction memory, right click it and select “load image”. from there browse to the test files and select either “prog1.txt” or “prog2.txt”, and then in the data memory, right click, “load image”, and from test files, find either “mem1.txt” or “mem2.txt” respectively (note, be sure that you are doing either a set of “prog1.txt” and “mem1.txt” or “prog2.txt” and “mem2.txt”)
	
	expected result test 1: 0x37 in first memory byte in the data memory
	expected result test 2: 2 hex inputs in the data memory and gives 2 hex outputs, 1st of which is the AND result, the 2nd is the OR result

for test 3: 
	in instruction memory, right click and select load image, from there browse to test files and select “test3.txt”.

	expected result 3: PC should constantly loop at 0x16, and if it doesnt work, it should go to 0x17
	

When the tests are properly loaded, simply press CTRL+T (or CMD+T on mac) to cycle through the processor. 

Readme with processor:

The instruction memory and data memory are ram modules. In order to load the proper tests:

before starting the simulation, be sure to restart the simulation

for test 1 and test 2:
	in instruction memory, right click it and select “load image”. from there browse to the test files and select either “prog1.txt” or “prog2.txt”, and then in the data memory, right click, “load image”, and from test files, find either “mem1.txt” or “mem2.txt” respectively (note, be sure that you are doing either a set of “prog1.txt” and “mem1.txt” or “prog2.txt” and “mem2.txt”)
	
	expected result test 1: 0x37 in first memory byte in the data memory
	expected result test 2: 2 hex inputs in the data memory and gives 2 hex outputs, 1st of which is the AND result, the 2nd is the OR result

for test 3: 
	in instruction memory, right click and select load image, from there browse to test files and select “test3.txt”.

	expected result 3: PC should constantly loop at 0x16, and if it doesnt work, it should go to 0x17
	

When the tests are properly loaded, simply press CTRL+T (or CMD+T on mac) to cycle through the processor. 


note: for each file, the appropriate source code will be called either prog1.asm, prog2.asm, or test3.asm

by: conner, jay, tj, and dan
