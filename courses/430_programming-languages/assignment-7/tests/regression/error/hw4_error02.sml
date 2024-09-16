val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BOOL false,opr=BOP_PLUS,rht=EXP_STRING "Hi"}}]}
  : program
;
