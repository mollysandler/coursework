; Verifies the balance of string delimiters.
; CSC 225, Assignment 4
; Given code, Spring '22

            .ORIG x3000

MAIN        LEA R1, STACK   ; Initialize R1, the stack pointer.
            LEA R0, PROMPT  ; Print the prompt.
            PUTS

            ; TODO: Complete this program:
            ;       If an opening delimiter is typed, push it onto the stack.
            ;       If a closing delimiter is typed, pop an opening delimiter
            ;        off of the stack and ensure that they match.
            ;       When the expression ends, ensure that the stack is empty.


LOOP        GETC                ; get the character typed by the user STORED IN R0
            OUT
            
            LD R4, ENT
            ADD R4, R0, R4
            BRz CHECK
            
            ; check for open parentheses
            LD R4, OPENP
            ADD R4, R0, R4      ; check if value is (
            BRz STARTP          ; JSR if it is to PUSH and push the )
            
            ; check for open square brackets
            LD R4, OPENB
            ADD R4, R0, R4      ; check if value is [
            BRz STARTB          ; JSR if it is to PUSH and push the ]
            
            ; check for open curly braces
            LD R4, OPENC
            ADD R4, R0, R4      ; check if value is {
            BRz STARTC          ; JSR if it is to PUSH and push the } 
            
            ; check for closed parentheses
            LD R4, CLOSEP
            ADD R3, R0, R4       ; check if value is )
            BRz ENDP
                     
            ;check for closed square brackets
            LD R4, CLOSEB
            ADD R3, R0, R4       ; check if value is ]
            BRz ENDB
           
            ; check for closed curly braces
            LD R4, CLOSEC
            ADD R3, R0, R4       ; check if value is }
            BRz ENDC
            
            BRnzp LOOP            ; else, call to halt
            

                                ; if pop is closing, it must match the given open delimeter
                                ; if pop is opening, continue going
            

            ; pushes a closed parentheses
STARTP      LD R2, CLOSEP
            JSR NEGATE
            JSR PUSH
            BRnzp LOOP
            
            ; pushes a closed square bracket
STARTB      LD R2, CLOSEB   
            JSR NEGATE
            JSR PUSH
            BRnzp LOOP

            ; pushes a closed curly brace
STARTC      LD R2, CLOSEC
            JSR NEGATE
            JSR PUSH
            BRnzp LOOP
            
            ; checks with a closed parentheses
ENDP        LD R4, CLOSEP    
            JSR POP
            ADD R2, R2, #0
            BRnp #4
            JSR NEWLINE
            LD R2, OPENP
            JSR NEGATE
            BRnzp UNPRINT
            ADD R5, R2, R4
            BRz LOOP
            JSR NEWLINE
            BRnp UNPRINT

            ; checks with a closed square bracket
ENDB        LD R4, CLOSEB    
            JSR POP
            ADD R2, R2, #0
            BRnp #4
            JSR NEWLINE
            LD R2, OPENB
            JSR NEGATE
            BRnzp UNPRINT
            ADD R5, R2, R4
            BRz LOOP
            JSR NEWLINE
            BRnp UNPRINT

            
            ; checks with a closed curly brace
ENDC        LD R4, CLOSEC    
            JSR POP
            ADD R2, R2, #0
            BRnp #4
            JSR NEWLINE
            LD R2, OPENC
            JSR NEGATE
            BRnzp UNPRINT
            ADD R5, R2, R4
            BRz LOOP
            JSR NEWLINE
            BRnp UNPRINT
 
 
;check if anything is still in the stack, and gives given errors 
CHECK       JSR POP
            ADD R2, R2, #0
            BRz SUC
            BRnp UNPRINT
  
SUC         LEA R0, BAL
            PUTS

FIN         HALT            ; Halt

; subroutine makes my negative parentheses values positive 
NEGATE      NOT R2, R2
            ADD R2, R2, #1
            RET
;subrutine that prints new line
NEWLINE     LD R0, LINE
            OUT
            RET

;stuff to print unbalanced            
UNPRINT     LEA R0, UNBAL   ; loads prompt and first quote
            PUTS
            ADD R0, R2, #0  ; loads the character
            OUT
            LEA R0, PERIOD  ; loads period and end quote 
            PUTS
            BRnzp FIN

; Space for a stack with capacity 16:
            .BLKW #16
STACK       .FILL x00

; TODO: Add any additional required constants or subroutines below this point.
PROMPT      .STRINGZ "Enter a string: "


BAL         .STRINGZ "Delimiters are balanced."
UNBAL       .STRINGZ "Delimiters are not balanced. Expected '"
PERIOD      .STRINGZ "'."


LINE        .FILL x0A

ENT         .FILL x-0A
OPENP       .FILL #-40
CLOSEP      .Fill #-41 
OPENB       .Fill #-91
CLOSEB      .Fill #-93
OPENC       .Fill #-123
CLOSEC      .Fill #-125

; NOTE: Do not alter the following lines. They allow the subroutines in other
;       files to be called without manually calculating their offsets.

PUSH        ST  R6, PUSHR6
            ST  R7, PUSHR7
            LDI R6, PUSHADDR
            JSRR R6
            LD  R7, PUSHR7
            LD  R6, PUSHR6
            RET

PUSHR6      .FILL x0000
PUSHR7      .FILL x0000
PUSHADDR    .FILL x4000

POP         ST  R6, POPR6
            ST  R7, POPR7
            LDI R6, POPADDR
            JSRR R6
            LD  R7, POPR7
            LD  R6, POPR6
            RET

POPR6       .FILL x0000
POPR7       .FILL x0000
POPADDR     .FILL x4001

PEEK        ST  R6, PEEKR6
            ST  R7, PEEKR7
            LDI R6, PEEKADDR
            JSRR R6
            LD  R7, PEEKR7
            LD  R6, PEEKR6
            RET

PEEKR6      .FILL x0000
PEEKR7      .FILL x0000
PEEKADDR    .FILL x4002

            .END
