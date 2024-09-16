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

type decl = string;

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
   | EXP_CALL of {func: expression, args: expression list}
   | EXP_DOT of {obj: expression, field: string}
   | EXP_ANON of function
   | EXP_THIS
   | EXP_NEW of {class: string}

and statement =
   ST_EXP of {exp: expression}
 | ST_BLOCK of {stmts: statement list}
 | ST_IF of {guard: expression, th: statement, el: statement option}
 | ST_PRINT of {exp: expression}
 | ST_WHILE of {guard: expression, body: statement}
 | ST_RETURN of {exp: expression option}

withtype function = {params: decl list, decls: decl list, body: statement list};

type class = {name: string, super: string option, decls: decl list, funcs: (string * function) list};

datatype program =
   PROGRAM of {classes: class list, decls: decl list, funcs: (string * function) list, stmts: statement list};

(*written by me*)
datatype value  =
   ERROR_VAL (*to use as a placeholder*)
   | INT_VAL of int
   | BOOL_VAL of bool
   | STRING_VAL of string
   | METHOD_VAL of {object: value, closure: value}
   | OBJECT_VAL of {class: (string, value) HashTable.hash_table, uniqueRef: unit ref}
   | CLOSURE_VAL of {tbl: (string, value) HashTable.hash_table list, code: function, uniqueRef: unit ref}
   | NONE_VAL
;