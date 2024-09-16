val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_NONE,opr=BOP_OR,rht=EXP_BOOL false}}]}
  : program
;
