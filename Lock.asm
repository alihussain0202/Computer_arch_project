.MODEL SMALL
.STACK 100H

.DATA
    ; messages
    msg1 DB 10,13,"Enter 4 digit PIN: $"
    msg2 DB 10,13,"Access Granted! $"
    msg3 DB 10,13,"Wrong PIN! $"
    msg4 DB 10,13,"LOCKED OUT $"

    correct DB '6969'    ; the actual pin
    userinput DB 4 DUP(?)
    tries DB 3           ; 3 attempts only

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX           ; setup data segment

TRY_AGAIN:
    CMP tries, 0
    JE  ALARM            ; no more tries left

    ; show the prompt
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    ; read 4 chars one by one
    MOV SI, 0
GETCHAR:
    MOV AH, 01H
    INT 21H
    MOV userinput[SI], AL
    INC SI
    CMP SI, 4
    JNE GETCHAR          ; keep going till we got 4

    ; now check each digit
    MOV SI, 0
    MOV CX, 4
CHECK:
    MOV AL, userinput[SI]
    CMP AL, correct[SI]
    JNE  BAD             ; mismatch, bail out
    INC SI
    LOOP CHECK

    ; if we made it here pin is correct
    LEA DX, msg2
    MOV AH, 09H
    INT 21H
    JMP DONE

BAD:
    DEC tries
    LEA DX, msg3
    MOV AH, 09H
    INT 21H
    JMP TRY_AGAIN        ; go back and ask again

ALARM:
    LEA DX, msg4
    MOV AH, 09H
    INT 21H

DONE:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
