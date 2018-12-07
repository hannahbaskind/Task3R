; Main.asm
; Name: Hannah Baskind, Hasanain Manesia
; UTEid: hlb872, hsm623
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer

	LD R6, STACK ;load stack


; set up the keyboard interrupt vector table entry

	LD R0, KBISR
	STI R0, KBIVE 


; enable keyboard interrupts

	LD R0, KBIEN
	STI R0, KBSR


; start of actual program
	
	LD R1, LETTER
	AND R2, R2, 0
	STR R2, R1, #0
HERE	LDR R0, R1, 0
	BRz HERE
	TRAP x21
	STR R2, R1, 0

	LD R3, ACHECK
	ADD R3, R0, R3
	BRnp HERE

NOTU	LDR R0, R1, 0
	BRz NOTU
	TRAP x21
	STR R2, R1, 0

	LD R3, UCHECK
	ADD R3, R0, R3
	BRnp ISITA
	BRz NOTG

ISITA	LD R3, ACHECK
	ADD R3, R0, R3
	BRnp HERE
	BRz NOTU

NOTG	LDR R0, R1, 0
	BRz NOTG
	TRAP x21
	STR R2, R1, 0

	LD R3, GCHECK
	ADD R3, R0, R3
	BRnp HERE

	LD R0, DASH

	TRAP x21

NEW	LDR R0, R1, 0
	BRz NEW
	TRAP x21
	STR R2, R1, 0

	LD R3, UCHECK
	ADD R3, R0, R3
	BRnp NEW

AVAL	LDR R0, R1, 0
	BRz AVAL
	TRAP x21
	STR R2, R1, 0
	
	LD R3, ACHECK
	ADD R3, R0, R3
	BRz lastletter
	
	LD R3, GCHECK
	ADD R3, R0, R3
	BRz lastletterA
	BRnp NEW

	
lastletter 
	LDR R0, R1, 0
	BRz lastletter
	TRAP x21
	STR R2, R1, 0

	LD R3, ACHECK
	ADD R3, R0, R3
	BRz DONE
	
	LD R3, GCHECK
	ADD R3, R0, R3
	BRz DONE
	BRnp NEW

lastletterA

	LDR R0, R1, 0
	BRz lastletterA
	TRAP x21
	STR R2, R1, 0

	LD R3, ACHECK
	ADD R3, R0, R3
	BRz DONE

	LD R3, UCHECK
	ADD R3, R0, R3
	BRz AVAL
	BRnp NEW


	
DONE 
	TRAP x25	


	

STACK	.FILL x4000
KBIEN .FILL x4000
KBSR  .FILL xFE00
KBIVE .FILL x0180
KBISR .FILL x2600
LETTER .FILL x4600
ACHECK	.FILL x-41
UCHECK	.FILL x-55
GCHECK	.FILL x-47
DASH 	.FILL x7C
		.END
