val prog =
  PROGRAM
    {classes=[],decls=[],
     funcs=[("f",
             {body=[ST_EXP
                      {exp=EXP_ASSIGN
                             {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                              rhs=EXP_BOOL true}}],decls=[],params=[]})],
     stmts=[ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
