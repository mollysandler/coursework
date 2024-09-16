val prog =
  PROGRAM
    {classes=[],decls=["a","b"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_ID "a",opr=BOP_MINUS,rht=EXP_ID "b"}}]}
  : program
;
