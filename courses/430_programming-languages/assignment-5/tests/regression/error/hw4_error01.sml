val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_PLUS,rht=EXP_BOOL true}}]}
  : program
;
