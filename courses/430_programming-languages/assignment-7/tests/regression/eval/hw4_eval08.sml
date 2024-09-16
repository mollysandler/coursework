val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT {exp=EXP_UNARY {opnd=EXP_BOOL true,opr=UOP_NOT}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_UNARY {opnd=EXP_BOOL false,opr=UOP_NOT}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_UNARY {opnd=EXP_NUM 2,opr=UOP_MINUS}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
