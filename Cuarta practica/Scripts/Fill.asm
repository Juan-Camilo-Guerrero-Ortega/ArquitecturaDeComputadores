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
(READ_INPUT)

	@KBD

	D=M



	@color

	M=0



	@FILL_SCREEN

	D;JEQ  // si la entrada del teclado = 0 nada



	@MAKE_COLOR_BLACK

	0;JMP // de lo contrario pintar de negro

@READ_INPUT

0;JMP



(MAKE_COLOR_BLACK)

@color

M=-1



(FILL_SCREEN)

	// si @color = -1, hacer la pantalla negra,

	// de lo contrario @color = 0, hacerla blanca



	@SCREEN

	D=A

	@screen

	M=D // screen = SCREEN



	(FILL_LOOP)

		@color

		D=M

		@screen

		A=M

		M=D // MEM[MEM[screen]] = color



		@screen

		M=M+1 // MEM[screen] += 1



		@24576 // SCREEN + (512*256) // SCREEN = 16384

		D=A

		@screen

		D=D-M // D = 24576 - screen

	@FILL_LOOP

	D;JGT // if D > 0 goto FILL_LOOP



@READ_INPUT

0;JMP