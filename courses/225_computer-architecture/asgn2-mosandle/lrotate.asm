0011 0000 0000 0000  ;start at x3000
0010 001 000110010   ; Load number from x3050 into R1
0001 002 001 000 001 ;add the number to itself and put it into R0
000 001 000000002    ;branch if positive
0001 002 001 1 00001 ;if not positive, add a one
0011 000 000001101   ;store value in x3051
1111 0000 00100101   ;Halt
