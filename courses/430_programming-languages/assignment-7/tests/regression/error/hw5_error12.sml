val prog =
  PROGRAM
    {classes=[],decls=["f"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_BINARY
                            {lft=EXP_ANON {body=[],decls=[],params=[]},
                             opr=BOP_PLUS,rht=EXP_NUM 1}}}]} : program
;
