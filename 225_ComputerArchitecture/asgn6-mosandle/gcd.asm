; Defines functions for computing greatest common divisors.
; CSC 225, Assignment 6
; Given code, Spring '21
; TODO: Complete this file.

            .ORIG x4000
            
; R7, R5, R6, 
; int gcd(int, int)
GCDFN           ; from slideshow posted
                ADD R6, R6, #-1  ; Push space for ret. val.
                ADD R6, R6, #-1  ; Push the return address.
                STR R7, R6, #0
                ADD R6, R6, #-1  ; Push the dynamic link.
                STR R5, R6, #0
                ADD R5, R6, #-1  ; Set the frame pointer
                ADD R6, R6, #-1  ; makes space for the temp 
               
                LDR R2, R5, #4   ; Load "a" into R2
                LDR R3, R5, #5   ; Load "b" into R3
                
                NOT R4, R3       ; negate b and put into r4
                ADD R4, R4, #1  
                
                ADD R4, R4, R2   ; R4 holds a - b
                BRn ELSEIF       ; if negative, b is larger
                BRp ELSE         ; if positive, a is larger
                                 ; if 0, they are the same and continue to the IF
                
                
IF              STR R2, R6, #0   ; put a into temp
                BRnzp TEAR       ; go to tear unconditionally
                LDR R0, R6, #0   ; do the teardown for recursion
                STR R0, R5, #0
                ADD R6, R6, #1
                ADD R6, R6, #2
                

ELSEIF          ; a, b-a
                NOT R4, R2       ; negate a held in R4
                ADD R4, R4, #1 
                ADD R4, R4, R3   ; holds b - a
    
    
                ADD R6, R6, #-1  ; change r6
                STR R4, R6, #0   ; store b - a onto the stack
                ADD R6, R6, #-1  ; increment r6
                STR R2, R6, #0   ; store a onto the stack

                
                AND R0, R0, #0   ; clear R0 just in case 
                STR R0, R5, #0   ; clear the temp before each call 
                STR R0, R5, #3   ; clear the return value
                JSR GCDFN        ; call the actual recursion
                
                LDR R0, R6, #0   ; do the teardown 
                ADD R6, R6, #3
                LDR R1, R5, #3
                ADD R0, R0, R1
                STR R0, R5, #0
                BRnzp TEAR       ; branch to tear unconditionally 
                

ELSE            ADD R6, R6, #-1  ; change r6
                STR R3, R6, #0   ; store b onto the stack
                ADD R6, R6, #-1  ; change r6
                STR R4, R6, #0   ; store a - b onto the stack
                
                AND R0, R0, #0 
                STR R0, R5, #0   ; clear the temp before each call 
                STR R0, R5, #3   ; clear the return value
                JSR GCDFN        ; call the actual recursion 
                
                LDR R0, R6, #0   ; do the teardown 
                ADD R6, R6, #3

                LDR R1, R5, #3
                ADD R0, R0, R1   ; idk if this is needed

                STR R0, R5, #0
                BRnzp TEAR       ; unconditional branch to tear
            
                ; some from the slides
TEAR            LDR R1, R5, #0   ; get the return value
                STR R1, R5, #3   ; store at the return value 
                ADD R6, R6, #1   ; remove the temp 
                LDR R5, R6, #0   ; Pop the dynamic link.
                ADD R6, R6, #1   ; decrement r6
                LDR R7, R6, #0   ; Pop the return address.
                ADD R6, R6, #1   ; decrement r6
                RET              ; ret subroutine
                
 
;needed filler content
PROMPT      .STRINGZ "Enter two positive integers: "
GCD         .STRINGZ "gcd("
COMMA       .STRINGZ ","
EQUALS      .STRINGZ ") = "

            .END
