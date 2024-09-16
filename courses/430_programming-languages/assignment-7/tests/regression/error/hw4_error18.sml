val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_NONE,
                      guard=EXP_BINARY
                              {lft=EXP_NUM 1,opr=BOP_LT,
                               rht=EXP_BINARY
                                     {lft=EXP_NUM 2,opr=BOP_TIMES,
                                      rht=EXP_NUM 3}},
                      thenExp=EXP_BINARY
                                {lft=EXP_STRING "bob",opr=BOP_MINUS,
                                 rht=EXP_STRING "bo"}}}]} : program
;
