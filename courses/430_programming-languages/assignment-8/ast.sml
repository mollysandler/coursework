datatype binaryOperator =
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

datatype unaryOperator =
     UOP_NOT
   | UOP_MINUS
;

datatype expression =
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
   ST_EXP of {exp: expression}
 | ST_BLOCK of {stmts: statement list}
 | ST_IF of {guard: expression, th: statement, el: statement option}
 | ST_PRINT of {exp: expression}
 | ST_WHILE of {guard: expression, body: statement}
 | ST_DO of {block: statement, body: statement}
;

datatype program =
   PROGRAM of {decls: string list, stmts: statement list}
;
