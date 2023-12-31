DATA SEGMENT
 MSG1 DB "ENTER THE 1ST NUMBER : $",0AH,0DH
 MSG2 DB 0AH,0DH,"ENTER THE 2ND NUMBER : $",0AH,0DH
 MSG3 DB 0AH,0DH,"DIFFERENCE IS : $",0AH,0DH
 MSG4 DB 0AH,0DH,"DIFFERENCE IS : -$",0AH,0DH
DATA ENDS

CODE SEGMENT
 ASSUME DS:DATA,CS:CODE
START:
 MOV AX,DATA
 MOV DS,AX

 LEA DX,MSG1
 MOV AH,09H
 INT 21H
 MOV AH,01H
 INT 21H
 MOV BH,AL
 MOV AH,01H
 INT 21H
 MOV BL,AL

 LEA DX,MSG2
 MOV AH,09H
 INT 21H
 MOV AH,01H
 INT 21H
 MOV CH,AL
 MOV AH,01H
 INT 21H
 MOV CL,AL 


 CMP CX,BX
 JZ ZERO
 JNC NEGATIVE

 CLC
 MOV AL,BL
 XOR AH,AH
 SUB AL,CL
 AAS
 MOV CL,AH
 ADD AL,30H
 MOV BL,AL
 XOR AH,AH
 SUB BH,CH
 MOV AL,BH
 AAS
 ADD AL,CL 
 ADD AL,30H
 MOV BH,AL
 JMP DISPO

ZERO:
 MOV AX,BX
 SUB AX,CX
 AAS
 ADD AX,3030H
 MOV BX,AX
 JMP DISPO

NEGATIVE:
 MOV AL,CL
 XOR AH,AH
 SUB AL,BL
 AAS
 MOV BL,AH
 ADD AL,30H
 MOV CL,AL
 XOR AH,AH
 SUB CH,BH
 MOV AL,CH
 AAS
 ADD AL,BL 
 ADD AL,30H
 MOV CH,AL

 LEA DX,MSG4
 MOV AH,09H
 INT 21H
 MOV DL,CH
 MOV AH,02H
 INT 21H
 MOV DL,CL
 MOV AH,02H
 INT 21H
 JMP FULL

DISPO:
 LEA DX,MSG3
 MOV AH,09H
 INT 21H
 MOV DL,BH
 MOV AH,02H
 INT 21H
 MOV DL,BL
 MOV AH,02H
 INT 21H

FULL:
 MOV AH,4CH
 INT 21H
CODE ENDS
END START
