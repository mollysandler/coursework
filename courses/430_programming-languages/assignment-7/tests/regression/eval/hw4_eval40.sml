val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_NUM 4,opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_COND
                                   {elseExp=EXP_NUM 3,
                                    guard=EXP_BINARY
                                            {lft=EXP_NUM 2,opr=BOP_GT,
                                             rht=EXP_NUM 3},thenExp=EXP_NUM 0},
                             opr=BOP_TIMES,rht=EXP_NUM 2}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 99,
                      guard=EXP_BINARY
                              {lft=EXP_BINARY
                                     {lft=EXP_NUM 4,opr=BOP_GT,rht=EXP_NUM 2},
                               opr=BOP_OR,
                               rht=EXP_BINARY
                                     {lft=EXP_NUM 1,opr=BOP_LT,rht=EXP_NUM 0}},
                      thenExp=EXP_STRING "Hello"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 99,
                      guard=EXP_UNARY
                              {opnd=EXP_BINARY
                                      {lft=EXP_BINARY
                                             {lft=EXP_NUM 4,opr=BOP_GT,
                                              rht=EXP_NUM 2},opr=BOP_OR,
                                       rht=EXP_BINARY
                                             {lft=EXP_NUM 1,opr=BOP_LT,
                                              rht=EXP_NUM 0}},opr=UOP_NOT},
                      thenExp=EXP_STRING "Hello"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
