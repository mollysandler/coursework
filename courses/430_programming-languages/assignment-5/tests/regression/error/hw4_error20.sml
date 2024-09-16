val prog =
  PROGRAM
    {decls=["a","b"],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_ID "a",opr=BOP_MINUS,rht=EXP_ID "b"}}]}
  : program
;
