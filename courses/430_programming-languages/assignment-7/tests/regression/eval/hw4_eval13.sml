val prog =
  PROGRAM
    {classes=[],decls=["a"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 1}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
