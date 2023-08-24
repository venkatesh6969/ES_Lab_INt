ADD , CODE, READONLY
ENTRY	;mark first instruction to execute

START
MOV R1, #6400	; store first number in R1
MOV R2, #3200	; store second number in R2
ADD R3, R1, R2	; addition

NOP
END
