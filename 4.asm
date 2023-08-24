AREA ASCENDING , CODE, READONLY
ENTRY	; mark first instruction to execute

START
MOV R8,#4	; initialize counter to 4(i.e. N=4) LDR R2,=CVALUE	; address of code region
LDR R3,=DVALUE	; address of data region LOOP0
LDR R1,[R2],#4	; loading values from code region
STR R1,[R3],#4	; storing values to data region

SUBS R8,R8,#1	; decrement counter
CMP R8,#0
BNE LOOP0	; loop back till array ends
START1
MOV R5,#3	; initialize counter to 3(i.e. N=4)
MOV R7,#0		; flag to denote exchange has occured LDR R1,=DVALUE	; loads the address of first value
LOOP
LDR R2,[R1],#4	; word align to array element
LDR R3,[R1]	; load second number
CMP R2,R3	; compare numbers
BLT LOOP2	; if the first number is < then goto LOOP2
STR R2,[R1],#-4	; interchange number R2 & R3
STR R3,[R1]	; interchange number R2 & R3
MOV R7,#1	; flag denoting exchange has taken place
ADD R1,#4	; restore the ptr
LOOP2
SUBS R5,R5,#1	; decrement counter
CMP R5,#0	; compare counter to 0
BNE LOOP	; loop back till array ends
CMP R7,#0	; comparing flag
BNE START1	; if flag is not zero then go to START1 loop

BACK B BACK
CVALUE	; array of 32 bit numbers(N=4) in code region

DCD 0X44444444 DCD 0X11111111 DCD 0X33333333 DCD 0X22222222

AREA DATA1,DATA,READWRITE; array of 32 bit numbers in data region DVALUE
DCD 0X0000000
END	; mark end of file
