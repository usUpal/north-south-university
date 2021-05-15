.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 4 DUP (?), '$' 
    MSG DB "ENTER YOUR NAME: $" 
    NEWLINE DB 0AH, 0DH, '$'     ; NEW LINE STRING
                                  
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    MOV AH, 1
    MOV CX, 4
    MOV BX, 0
    DEC CX    ; UPDATE COUNT REGISTER BECAUSE JMP DOESN'T DO THAT
    CMP CX, 4
    _LP:
    INT 21H
    MOV ARRAY[BX], AL
    INC BX
    
    JNZ _LP       ; JZ = JUMP ZERO
                    ; JNZ = JUMP NOT ZERO
    
    
    
     
    MOV AH, 9 
    LEA DX, NEWLINE            ; PRINTING NEW LINE ARRAY
    INT 21H
    LEA DX, ARRAY 
    INT 21H 
      
    
    
     
    
    
    
    




EXIT:
MOV AH, 4CH
INT 21H