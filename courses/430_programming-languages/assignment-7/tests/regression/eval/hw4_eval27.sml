val prog =
  PROGRAM
    {classes=[],decls=["a"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 999}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=SOME
                                       (ST_BLOCK
                                          {stmts=[ST_IF
                                                    {el=SOME
                                                          (ST_BLOCK
                                                             {stmts=[ST_PRINT
                                                                       {exp=EXP_NUM
                                                                              44},
                                                                     ST_PRINT
                                                                       {exp=EXP_STRING
                                                                              "\n"}]}),
                                                     guard=EXP_BINARY
                                                             {lft=EXP_ID "a",
                                                              opr=BOP_EQ,
                                                              rht=EXP_NUM 8},
                                                     th=ST_BLOCK
                                                          {stmts=[ST_PRINT
                                                                    {exp=EXP_NUM
                                                                           33},
                                                                  ST_PRINT
                                                                    {exp=EXP_STRING
                                                                           "\n"}]}}]}),
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "a",opr=BOP_EQ,
                                           rht=EXP_NUM 99},
                                  th=ST_BLOCK
                                       {stmts=[ST_PRINT {exp=EXP_NUM 22},
                                               ST_PRINT {exp=EXP_STRING "\n"}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "a",opr=BOP_EQ,rht=EXP_NUM 9},
               th=ST_BLOCK
                    {stmts=[ST_PRINT {exp=EXP_NUM 11},
                            ST_PRINT {exp=EXP_STRING "\n"}]}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 99}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=SOME
                                       (ST_BLOCK
                                          {stmts=[ST_IF
                                                    {el=SOME
                                                          (ST_BLOCK
                                                             {stmts=[ST_PRINT
                                                                       {exp=EXP_NUM
                                                                              44},
                                                                     ST_PRINT
                                                                       {exp=EXP_STRING
                                                                              "\n"}]}),
                                                     guard=EXP_BINARY
                                                             {lft=EXP_ID "a",
                                                              opr=BOP_EQ,
                                                              rht=EXP_NUM 8},
                                                     th=ST_BLOCK
                                                          {stmts=[ST_PRINT
                                                                    {exp=EXP_NUM
                                                                           33},
                                                                  ST_PRINT
                                                                    {exp=EXP_STRING
                                                                           "\n"}]}}]}),
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "a",opr=BOP_EQ,
                                           rht=EXP_NUM 99},
                                  th=ST_BLOCK
                                       {stmts=[ST_PRINT {exp=EXP_NUM 22},
                                               ST_PRINT {exp=EXP_STRING "\n"}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "a",opr=BOP_EQ,rht=EXP_NUM 9},
               th=ST_BLOCK
                    {stmts=[ST_PRINT {exp=EXP_NUM 11},
                            ST_PRINT {exp=EXP_STRING "\n"}]}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 88}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=SOME
                                       (ST_BLOCK
                                          {stmts=[ST_IF
                                                    {el=SOME
                                                          (ST_BLOCK
                                                             {stmts=[ST_PRINT
                                                                       {exp=EXP_NUM
                                                                              44},
                                                                     ST_PRINT
                                                                       {exp=EXP_STRING
                                                                              "\n"}]}),
                                                     guard=EXP_BINARY
                                                             {lft=EXP_ID "a",
                                                              opr=BOP_EQ,
                                                              rht=EXP_NUM 8},
                                                     th=ST_BLOCK
                                                          {stmts=[ST_PRINT
                                                                    {exp=EXP_NUM
                                                                           33},
                                                                  ST_PRINT
                                                                    {exp=EXP_STRING
                                                                           "\n"}]}}]}),
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "a",opr=BOP_EQ,
                                           rht=EXP_NUM 99},
                                  th=ST_BLOCK
                                       {stmts=[ST_PRINT {exp=EXP_NUM 22},
                                               ST_PRINT {exp=EXP_STRING "\n"}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "a",opr=BOP_EQ,rht=EXP_NUM 9},
               th=ST_BLOCK
                    {stmts=[ST_PRINT {exp=EXP_NUM 11},
                            ST_PRINT {exp=EXP_STRING "\n"}]}}]} : program
;
