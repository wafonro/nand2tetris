// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(BEGIN)
@8096
D = A
@R0
M = D
@SCREEN
D = A
@R1
M = D

@KBD
D = M
@PRESSED
D,JNE

(RELEASED)
@R0
D = M
@BEGIN
D;JEQ
@R0
M = M-1
@R1
A = M
M = 0
@R1
M = M+1
@RELEASED
0;JMP

@BEGIN
0;JMP

(PRESSED)
@R0
D = M
@BEGIN
D;JEQ
@R0
M = M-1
@R1
A = M
M = -1
@R1
M = M+1
@PRESSED
0;JMP