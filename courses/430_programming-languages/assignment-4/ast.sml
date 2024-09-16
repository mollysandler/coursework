datatype binaryOperator = (*done*)
     BOP_PLUS 
   | BOP_MINUS
   | BOP_TIMES
   | BOP_DIVIDE
   | BOP_MOD
   | BOP_EQ
   | BOP_NE
   | BOP_LT
   | BOP_GT
   | BOP_LE
   | BOP_GE
   | BOP_AND
   | BOP_OR
;

datatype unaryOperator = (*done*)
     UOP_NOT
   | UOP_MINUS
;

datatype expression = (*done*)
     EXP_ID of string
   | EXP_NUM of int
   | EXP_STRING of string
   | EXP_BOOL of bool
   | EXP_NONE
   | EXP_BINARY of {opr: binaryOperator, lft: expression, rht: expression}
   | EXP_UNARY of {opr: unaryOperator, opnd: expression}
   | EXP_COND of {guard: expression, thenExp: expression, elseExp: expression}
   | EXP_ASSIGN of {lhs: expression, rhs: expression}
;

datatype statement =
   ST_EXP of {exp: expression} (*done*)
 | ST_BLOCK of {stmts: statement list} (*done*)
 | ST_IF of {guard: expression, th: statement, el: statement option} (*done maybe*)
 | ST_PRINT of {exp: expression} (*done*)
 | ST_WHILE of {guard: expression, body: statement} (*recursive with my setup*)
;

(*given to the evaluate function*)
datatype program =
   PROGRAM of {decls: string list, stmts: statement list}
;

(*written by me*)
datatype value  =
   ERROR_VAL (*to remove later*)
   | INT_VAL of int
   | BOOL_VAL of bool
   | STRING_VAL of string
   | NONE_VAL
;