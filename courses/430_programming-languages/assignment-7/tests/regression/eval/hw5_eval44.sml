val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[("f",{body=[],decls=[],params=[]})],
     stmts=[ST_PRINT {exp=EXP_ID "f"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ANON {body=[],decls=[],params=[]}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
