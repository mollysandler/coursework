val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_BINARY
                                {lft=EXP_NONE,opr=BOP_MINUS,rht=EXP_BOOL true},
                      guard=EXP_BOOL true,
                      thenExp=EXP_BINARY
                                {lft=EXP_NUM 1,opr=BOP_PLUS,
                                 rht=EXP_BOOL false}}}]} : program
;
