val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_NUM 2,opr=BOP_DIVIDE,rht=EXP_BOOL false}}]}
  : program
;
