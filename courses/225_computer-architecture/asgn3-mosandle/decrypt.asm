            .ORIG x3000
        
            ; Prompt for the string.
            LEA R0, STR_PROMPT  ; Load the prompt.
            LD  R1, NEW_OFFSET  ; Load a "negative newline" into R1.
            LEA R2, STRING      ; Load the address of the string into R2.
            PUTS                ; Print the prompt.
            
            ; get the string.
LOOP        GETC                ; While the user types characters...
            OUT                 ; ...echo the character...
            ADD R4, R0, R1      ; ...and the character...
            BRz DONE0           ; ...is not the newline...
            
            ; determine ? or not
            AND R7, R7, #0      ; make sure R7 is clear
            ADD R7, R0, #-16    ; add negative 16 and store in R7
            ADD R7, R7, #-16    ; add negative 16 and store in R7
            BRn #7              ; br if number < 0
            
            ADD R7, R7, #-16    ; add negative 16 and store in R7
            ADD R7, R7, #-16    ; add negative 16 and store in R7
            ADD R7, R7, #-16    ; add negative 16 store in R7
            ADD R7, R7, #-16    ; add negative 16 store in R7
            ADD R7, R7, #-16    ; add negative 16 store in R7
            ADD R7, R7, #-14    ; add negative 16 and store in R7 - totaling -126

            BRnz #1             ; br if number <= 0
            LD R0, QUES         ; use ? ascii value 
        
            STR R0, R2, #0      ; ...store the character...
            
            ADD R2, R2, #1     ; ...increment the address...
            BRnzp LOOP          ; ...loop back.
            
DONE0       AND R4, R4, #0      ; Get the null char.
            STR R4, R2, #0      ; Store the null char.
            LEA R0, ZERO        ; Load the prompt.
            LEA R0, STRING      ; Load the string.
            
            LD R1, NUM         ; load counter into R1
            ; NOT R1, R1
            ; ADD R1,R1 #1

            
            
            AND R3, R3, #0      ; clear R3
            ADD R3, R3, #10     ; counter 
            AND R4, R4, #0
            
            
OUTER       LEA R2, STRING      ; LEA to original string 
            LEA R6, STRING2     ; LEA to new string
            AND R7, R7, #0
            LEA R0, ZERO        ; load decrypt statement
            PUTS
            AND R0, R0 #0
            ADD R0, R1, #0      ; wokrks maybe
            OUT
            LEA R0, COLON       ; load colon 
            PUTS
            
            
    ;innerloop start here   
INNER       LDR R7, R2, #0      ; R7 holds letter iTERATING FOR THE STRING 
            ADD R7, R7, R4     ; subtract 1
            
            

            AND R5, R5, #0       ; clear r5
            ADD R5, R7, #-10    
            BRnz DONE            ; if hit null character, you're done
            
            ; determine ? or not
            AND R0, R0, #0      ; make sure R0 is clear
            ADD R0, R7, #-16    ; add negative 16 and store in R7
            ADD R0, R0, #-16    ; add negative 16 and store in R7
            BRn #7              ; br if number < 0
            
            ADD R0, R0, #-16    ; add negative 16 and store in R7
            ADD R0, R0, #-16    ; add negative 16 and store in R7
            ADD R0, R0, #-16    ; add negative 16 store in R7
            ADD R0, R0, #-16    ; add negative 16 store in R7
            ADD R0, R0, #-16    ; add negative 16 store in R7
            ADD R0, R0, #-15    ; add negative 16 and store in R7 - totaling -126

            BRnz #1             ; br if number <= 0
            LD R7, QUES         ; use ? ascii value 
        
            STR R7, R6, #0         ; add R7 to R6

            ADD R2, R2, #1      ; incremeent orig address
            ADD R6, R6, #1      ; increment second address
            BRnzp INNER
            
    
            
DONE       ADD R1, R1, #1
           AND R0, R0, #0
           STR R0, R6, #0
           LEA R0, STRING2      ; load R6 into R0
           PUTS
           LD R0, NEWLINE
           OUT
           ADD R4, R4, #-1
           ADD R3, R3, #-1      ; subtract 1 
           BRp OUTER
            
            
            HALT                ; Halt.


QUES        .FILL x3F
STRING2     .BLKW #34


NEW_OFFSET  .FILL x-0A
NEWLINE     .FILL X0A
STR_PROMPT  .STRINGZ "Encrypted string: "
ZERO        .STRINGZ "Decryption key "
COLON       .STRINGZ ": "
NUM         .FILL x30 
STRING      .BLKW #34
        
            .END
  
