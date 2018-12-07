; ISR.asm
; Name: Hannah Baskind, Hasanain Manesia
; UTEid: hlb872, hsm623
; Keyboard ISR runs when a key is struck
; Checks for a valid RNA symbol and places it at x4600
               .ORIG x2600
ST R1, SAVE 
ST R2, SAVE2
LDI R1, character 
LD R2, letterA 
ADD R2, R1, R2
BRz VALID
LD R2, letterU
ADD R2, R1, R2
BRz VALID
LD R2, letterC
ADD R2, R1, R2
BRz VALID
LD R2, letterG
ADD R2, R1, R2
BRz VALID
BRnzp DONE 



VALID
LD R2, GLOBAL
STR R1, R2, #0
BRnzp DONE 



DONE 


LD R1, SAVE
LD R2, SAVE2

RTI

character .FILL xFE02
SAVE .BLKW 1
SAVE2 .BLKW 1
letterA	.FILL x-41
letterU	.FILL x-55
letterC	.FILL x-43
letterG .FILL x-47
GLOBAL 	.FILL x4600
		.END
