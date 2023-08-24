AREA ONEZERO , CODE, READONLY
ENTRY	; mark first instruction to execute START
MOV R2,#0	; counter for ones
MOV R3,#0	; counter for zeros
MOV R7,#2	; counter to get two words
LDR R6,=VALUE	; loads the address of value

 
LOOP
 

MOV R1,#32	; 32 bits counter
LDR R0,[R6],#4	; get the 32 bit value
 

LOOP0
MOVS R0,R0,ROR #1	; right shift to check carry bit (1's/0's)
BHI ONES	; if carry bit is 1 goto ones branch otherwise next zeros ADD R3,R3,#1	; if carry bit is 0 then increment the counter by 1(R3)
B LOOP1	; branch to LOOP1

ONES
ADD R2,R2,#1	; if carry bit is 1 then increment the counter by 1(R2)

LOOP1
SUBS R1,R1,#1	; counter value decremented by 1
BNE LOOP0	; if not equal goto to loop0 checks 32bit
SUBS R7,R7,#1	; counter value decremented by 1
CMP R7,#0	; compare counter R7 to 0
BNE LOOP	; if not equal goto to LOOP BACK B BACK

VALUE DCD 0X11111111,0XAA55AA55 ; two values in an array
END	; mark end of file
