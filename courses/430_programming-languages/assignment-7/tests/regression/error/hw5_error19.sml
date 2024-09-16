val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_CALL
                     {args=[EXP_NUM 1,EXP_NUM 1],
                      func=EXP_ANON {body=[],decls=[],params=["a","a"]}}}]}
  : program
;
