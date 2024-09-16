val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_COND
                            {elseExp=EXP_STRING "bob",
                             guard=EXP_BINARY
                                     {lft=EXP_NUM 1,opr=BOP_GT,rht=EXP_NUM 2},
                             thenExp=EXP_BOOL false},opr=BOP_PLUS,
                      rht=EXP_NUM 3}}]} : program
;
