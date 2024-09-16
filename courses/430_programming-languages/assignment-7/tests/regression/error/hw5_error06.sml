val prog =
  PROGRAM
    {classes=[],decls=[],
     funcs=[("f",
             {body=[ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}],
              decls=["f"],params=[]})],
     stmts=[ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
