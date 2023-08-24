AREA LARGEST , CODE, READONLY
ENTRY	; mark first instruction to execute START
MOV R5,#6	; initialize counter to 6(i.e. N=7) LDR R1,=VALUE1	; loads the address of first value LDR R2,[R1],#4	; word align to array element
 
LOOP
 

LDR R4,[R1],#4	; word align to array element
CMP R2,R4	; compare numbers
BHI LOOP1	; if the first number is > then goto LOOP1
 

MOV R2,R4	; if the first number is < then move content R4 to R2 LOOP1
SUBS R5,R5,#1	; decrement counter
CMP R5,#0	; compare counter to 0
BNE LOOP	; loop back till array ends BACK B BACK
VALUE1 ; Array of 32 bit numbers(N=7)
DCD	0X44444444
DCD	0X22222222
DCD	0X11111111
DCD	0X33333333
DCD	0XAAAAAAAA
DCD	0X88888888
DCD	0X99999999
END
