val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BOOL true,opr=BOP_GT,rht=EXP_BOOL false}}]}
  : program
;
