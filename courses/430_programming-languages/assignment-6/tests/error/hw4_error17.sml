val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_COND
                            {elseExp=EXP_STRING "bob",
                             guard=EXP_BINARY
                                     {lft=EXP_NUM 1,opr=BOP_GT,rht=EXP_NUM 2},
                             thenExp=EXP_BOOL false},opr=BOP_PLUS,
                      rht=EXP_NUM 3}}]} : program
;
