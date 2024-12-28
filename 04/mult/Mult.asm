// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// Psuedo code
// r1 = 2 and r2 = 3
// while -> r1 != 0
// r2 = r2 + r2;
// end loop

// initialize R2 = 0
@R2
M=0

// if R1 is 0 then end
@R1
D=M
@END
D;JEQ 

(LOOP)     // perform addition until R1 reaches 0
    @R0
    D=M
    @R2
    M=M+D   // adding R0 to the sum at R2

    @R1
    M=M-1   // decrement R1 value
    D=M

    @LOOP
    D;JGT       // check whether R1>0 otherwise jump to the end

(END)
    @END
    0;JMP