; Decrypts a string using a Caesar cipher.
; CSC 225, Assignment 3
; Given code, Spring '22

            .ORIG x3000

            ; Prompt for the key.
            LEA R0, KEY_PROMPT  ; Load the prompt.
            PUTS                ; Print the prompt.
START       GETC
            OUT                 ; echo to the console
            LD R1, NEW_OFFSET   ; makes enter key 
            ADD R5, R1, R0
            BRz FIRST
        

            ADD R3, R0, #-16    ; get the key as an integer and store it in R3 
            ADD R3, R3, #-16    ; run three times to subtract 48
            ADD R3, R3, #-16    ;
            
            ; TODO: Read the encryption key from the keyboard, echo it, and
            ;       convert it into an integer. Save the encryption key in R3.
        
            BRnzp START
        
            ; Prompt for the string.
FIRST       LEA R0, STR_PROMPT  ; Load the prompt.
            LD  R1, NEW_OFFSET  ; Load a "negative newline" into R1.
            LEA R2, STRING      ; Load the address of the string into R2.
            PUTS                ; Print the prompt.

            ; Get and encrypt the string.
LOOP        GETC                ; While the user types characters...
            OUT                 ; ...echo the character...
            ADD R4, R0, R1      ; ...and the character...
            BRz DONE            ; ...is not the newline...

            ; TODO: Apply the encryption key, which is in R3, to the character,
            ;       which is in R0. Replace unprintable characters with '?'.
            
            ADD R0, R0, R3      ; add R3 to R0
            AND R5, R5, #0      ; make sure R5 is clear
            ADD R5, R0, #0      ; store R0 contents in R5
            AND R7, R7, #0      ; make sure R7 is clear
            ADD R7, R5, #-16    ; add negative 16 and store in R7
            ADD R7, R7, #-16    ; add negative 16 and store in R7
            BRn #7              ; br if number < 0 
            
            ADD R7, R7, #-16    ; add negative 126 and store in R7
            ADD R7, R7, #-16    ; add negative 126 and store in R7
            ADD R7, R7, #-16    ; add negative 126 and store in R7
            ADD R7, R7, #-16    ; add negative 126 and store in R7
            ADD R7, R7, #-16    ; add negative 126 and store in R7
            ADD R7, R7, #-14    ; add negative 126 and store in R7


            BRnz #1             ; br if number <= 0
            LD R0, QUES         ; use ? ascii value 

            STR R0, R2, #0      ; ...store the character...
            ADD R2, R2, #1      ; ...increment the address...
            BRnzp LOOP          ; ...loop back.

            ; Print the result.
DONE        AND R4, R4, #0      ; Get the null char.
            STR R4, R2, #0      ; Store the null char.
            LEA R0, RES_PROMPT  ; Load the prompt.
            PUTS                ; Print the prompt.
            LEA R0, STRING      ; Load the string.
            PUTS                ; Print the string.
            HALT                ; Halt.

            ; TODO: Add any additional required constants below this point.

QUES        .FILL x3F

NEW_OFFSET  .FILL x-0A
KEY_PROMPT  .STRINGZ "Encryption key (0-9): "
STR_PROMPT  .STRINGZ "Unencrypted string: "
RES_PROMPT  .STRINGZ "Encrypted string: "
STRING      .BLKW #33


STRING2     .BLKW #33
            .END
            
            