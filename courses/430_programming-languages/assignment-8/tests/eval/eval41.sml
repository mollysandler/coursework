val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_PRINT {exp=EXP_ID "j"},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "j",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "j",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_ID "j",opr=BOP_NE,rht=EXP_NUM 0}}]}
  : program
;
