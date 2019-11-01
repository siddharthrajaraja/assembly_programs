; Assembly language program to find string is palindrome or not

.MODEL SMALL

DATA SEGMENT
    MSG1 DB 10, 13, 'ENTER ANY STRING :- $'
    MSG2 DB 10, 13, 'ENTERED STRING IS :- $'
    MSG3 DB 10, 13, 'LENGTH OF STRING IS :- $'
    MSG4 DB 10, 13, 'REVERSE OF ENTERED STRING IS :- $'
    MSG5 DB 10, 13, 'THE GIVEN STRING IS A PALINDROME $'
    MSG6 DB 10, 13, 'THE GIVEN STRING IS NOT PALINDROME $'
    P1 LABEL BYTE
    M1 DB 0FFH
    L1 DB ?
    P11 DB 0FFH DUP ('$')
    P22 DB 0FFH DUP ('$')
DATA ENDS

DISPLAY1 MACRO MSG
    MOV AH, 09H
    LEA DX, MSG
    INT 21H
ENDM

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX                
               
        DISPLAY1 MSG1
       
        LEA DX, P1
        MOV AH, 0AH    
        INT 21H
       
        DISPLAY1 MSG2
       
        DISPLAY1 P11
       
        DISPLAY1 MSG3
       
        MOV DL, L1
	CMP DL, 09H
	JBE LABEL1
	ADD DL, 07H

LABEL1:	ADD DL, 30H
        MOV AH, 02H
        INT 21H
       
        DISPLAY1 MSG4
               
        LEA SI, P11
        LEA DI, P22
       
        MOV DL, L1
        DEC DL
        MOV DH, 0
        ADD SI, DX
        MOV CL, L1
        MOV CH, 0
       
REVERSE:
        MOV AL, [SI]
        MOV [DI], AL
        INC DI
        DEC SI
        LOOP REVERSE
       
        DISPLAY1 P22
                      
        LEA SI, P11
        LEA DI, P22   
       
        MOV CL, L1
        MOV CH, 0
       
CHECK:
        MOV AL, [SI]
        CMP [DI], AL
        JNE NOTPALIN
        INC DI
        INC SI
        LOOP CHECK

        DISPLAY1 MSG5
        JMP EXIT

NOTPALIN:
        DISPLAY1 MSG6
               
EXIT:   MOV AH, 4CH
        INT 21H

CODE ENDS
END START
