val prog =
  PROGRAM
    {classes=[],decls=["i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 10}},
            ST_IF
              {el=NONE,
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_GT,rht=EXP_NUM 5},
               th=ST_BLOCK
                    {stmts=[ST_IF
                              {el=SOME
                                    (ST_BLOCK
                                       {stmts=[ST_PRINT {exp=EXP_NUM 31},
                                               ST_PRINT {exp=EXP_STRING "\n"}]}),
                               guard=EXP_BINARY
                                       {lft=EXP_ID "i",opr=BOP_GT,
                                        rht=EXP_NUM 20},
                               th=ST_BLOCK
                                    {stmts=[ST_PRINT {exp=EXP_NUM 32},
                                            ST_PRINT {exp=EXP_STRING "\n"}]}}]}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_PRINT {exp=EXP_NUM 31},
                               ST_PRINT {exp=EXP_STRING "\n"}]}),
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_GT,rht=EXP_NUM 5},
               th=ST_BLOCK
                    {stmts=[ST_IF
                              {el=NONE,
                               guard=EXP_BINARY
                                       {lft=EXP_ID "i",opr=BOP_GT,
                                        rht=EXP_NUM 20},
                               th=ST_BLOCK
                                    {stmts=[ST_PRINT {exp=EXP_NUM 32},
                                            ST_PRINT {exp=EXP_STRING "\n"}]}}]}}]}
  : program
;
