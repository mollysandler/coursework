val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_STRING "bob",opr=BOP_GE,rht=EXP_NONE}}]}
  : program
;
