val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[("f",{body=[],decls=[],params=[]})],
     stmts=[ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
