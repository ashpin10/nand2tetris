// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

@INIT

(KEY_PRESS_CHECK)
    @KBD
    D=M
    @TURN_OFF
    D;JGT
    @TURN_ON
    0;JMP

(TURN_ON)
    // Initialize counter i to 0
    @counter
    M=0
    (RESET_SCREEN_LOOP)
        @8192
        D=A
        @counter
        D=M-D
        @KEY_PRESS_CHECK
        D;JEQ

        @counter
        D=M
        @SCREEN
        A=A+D
        M=0

        @counter
        M=M+1

        @RESET_SCREEN_LOOP
        0;JMP

(TURN_OFF)
    @counter
    M=0
    (SET_SCREEN_LOOP)
        @8192
        D=A
        @counter
        D=M-D
        @KEY_PRESS_CHECK
        D;JEQ

        @counter
        D=M
        @SCREEN
        A=A+D
        M=-1

        @counter
        M=M+1

        @SET_SCREEN_LOOP
        0;JMP
