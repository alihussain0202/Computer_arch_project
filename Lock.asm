.MODEL SMALL
.STACK 100H

.DATA

msg1 DB 10,13,"ENTER 4 DIGIT PIN: $"
msg2 DB 10,13,"ACCESS GRANTED $"
msg3 DB 10,13,"WRONG PIN $"
msg4 DB 10,13,"SYSTEM LOCKED $"

pin DB '1234'
input DB 4 DUP(?)

attempt DB 3

.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX

START:

; Check attempts
CMP attempt,0
JE LOCKED

; Display message
LEA DX,msg1
MOV AH,09H
INT 21H

; Take 4 digit input
MOV SI,0

INPUT_LOOP:

MOV AH,01H
INT 21H

MOV input[SI],AL

INC SI

CMP SI,4
JNE INPUT_LOOP

; Compare PIN
MOV SI,0
MOV CX,4

COMPARE:

MOV AL,input[SI]
CMP AL,pin[SI]

JNE WRONG

INC SI
LOOP COMPARE

; Correct PIN
LEA DX,msg2
MOV AH,09H
INT 21H

JMP EXIT

WRONG:

DEC attempt

LEA DX,msg3
MOV AH,09H
INT 21H

JMP START

LOCKED:

LEA DX,msg4
MOV AH,09H
INT 21H

EXIT:

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN