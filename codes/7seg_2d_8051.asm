

	DISP_1 	EQU P3.0
	DISP_2 	EQU P3.1
	DT_PORT	EQU	P2
	VALUE	EQU	030H
	MOV 	P2,#00000000B   ; initializes P1 as output port
	MOV 	P3,#00000000B   ; initializes P3 as output port


	ORG	00H	; reset vector
	MOV	DPTR,#CC_PATTERNS ;  loads  the  adress  of  l i n e  29  to DPTR
	MOV	P1, #0H
	MOV	P3, #0H
;	SJMP	START


START:
	MOV 	R3,#100D ;Register R0 initialized as counte 10
	MOV 	VALUE,#00D 	; initial value of accumulator

MAIN:    
	MOV 	A,VALUE 	; initial value of accumulator
	MOV 	B,#10D    ; load B with 10D
	DIV 	AB        ; divides the content of A with that in B
	MOV 	R6,A      ; moves the quotient to R6
	MOV 	R7,B      ; moves the remainder to R7
	
	MOV	R4, #30D	


X_LOOP:

	MOV	A,R6		;  "1"  i s  moved to  accumulator
	ACALL   DISPLAY 	;  c a l l s  the  display  sub  routine  f o r  getting  the  pattern  f o r  "1"
	SETB	DISP_1		;  a c t i v a t e s  1 st  display
	MOV	DT_PORT ,A		;  moves  the  pattern  f o r  "1"  into  port  1
	ACALL   DELAY    	;  c a l l s  the  1ms delay
	CLR	DISP_1		;  deactivates  the  1 st  display

	MOV	A, R7		;  "2"  i s  moved to  accumulator
	SETB	DISP_2		;  a c t i v a t e s  2nd  display
	ACALL   DISPLAY 		;  c a l l s  the  display  sub  routine  f o r  getting  the  pattern  f o r  "2"
	MOV	DT_PORT ,A		;  moves  the  pattern  f o r  "2"  into  port  1
	ACALL   DELAY    	;  c a l l s  the  1ms delay
	CLR	DISP_2		;  deactivates  the  2nd  display

	DJNZ	R4,X_LOOP
	INC	VALUE
	
	DJNZ	R3,MAIN

	SJMP	START;  jumps back  to  main and  cycle  i s  repeated


DELAY: 
       MOV 	R0, #20H
LP2:   MOV 	R1, #010H
LP1:   MOV 	R2, #010H
LP3:   DJNZ 	R2, LP3 
       DJNZ 	R1, LP1 
       DJNZ 	R0, LP2
       RET



DISPLAY:
	MOVC	A,@A+DPTR ;  adds  the  byte  in A to  the  address  in DPTR and  loads A with  data  present  in  the  r e s u l t a n t  address
	RET


ORG 400H
CC_PATTERNS: ; Lookup table for digits 0 to 9
DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 0

	END