AREA FACTORIAL , CODE, READONLY
ENTRY	;mark first instruction to execute START
MOV r0, #7	; store factorial number in R0
MOV r1,r0	; move the same number in R1

FACT SUBS r1, r1, #1	; subtraction CMP r1, #1	; comparison BEQ STOP
MUL r3,r0,r1	; multiplication
MOV   r0,r3	; Result
BNE FACT	; branch to the loop if not equal
STOP
BACK B BACK
END