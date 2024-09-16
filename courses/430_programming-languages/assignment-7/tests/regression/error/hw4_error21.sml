val prog =
  PROGRAM
    {classes=[],decls=["j","i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_BOOL true}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 5}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_IF
                                {el=NONE,
                                 guard=EXP_BINARY
                                         {lft=EXP_ID "j",opr=BOP_LT,
                                          rht=EXP_NUM 0},
                                 th=ST_BLOCK
                                      {stmts=[ST_EXP
                                                {exp=EXP_ASSIGN
                                                       {lhs=EXP_ID "i",
                                                        rhs=EXP_NONE}}]}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "j",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "j",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}},
                              ST_PRINT {exp=EXP_ID "j"},
                              ST_PRINT {exp=EXP_STRING "\n"}]},
               guard=EXP_ID "i"}]} : program
;
