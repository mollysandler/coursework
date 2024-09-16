val prog =
  PROGRAM
    {classes=[],decls=["i","s","k"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 1}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_PRINT {exp=EXP_ID "i"},
                              ST_PRINT {exp=EXP_STRING " "},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "i",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "i",opr=BOP_PLUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_LT,rht=EXP_NUM 10}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 20}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=NONE,
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "i",opr=BOP_EQ,
                                           rht=EXP_NUM 20},
                                  th=ST_BLOCK
                                       {stmts=[ST_EXP
                                                 {exp=EXP_ASSIGN
                                                        {lhs=EXP_ID "i",
                                                         rhs=EXP_NUM 5}}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
               th=ST_BLOCK
                    {stmts=[ST_EXP
                              {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}]}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 10}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=NONE,
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "i",opr=BOP_EQ,
                                           rht=EXP_NUM 20},
                                  th=ST_BLOCK
                                       {stmts=[ST_EXP
                                                 {exp=EXP_ASSIGN
                                                        {lhs=EXP_ID "i",
                                                         rhs=EXP_NUM 5}}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
               th=ST_BLOCK
                    {stmts=[ST_EXP
                              {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}]}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 40}},
            ST_IF
              {el=SOME
                    (ST_BLOCK
                       {stmts=[ST_IF
                                 {el=NONE,
                                  guard=EXP_BINARY
                                          {lft=EXP_ID "i",opr=BOP_EQ,
                                           rht=EXP_NUM 20},
                                  th=ST_BLOCK
                                       {stmts=[ST_EXP
                                                 {exp=EXP_ASSIGN
                                                        {lhs=EXP_ID "i",
                                                         rhs=EXP_NUM 5}}]}}]}),
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
               th=ST_BLOCK
                    {stmts=[ST_EXP
                              {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}]}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "s",rhs=EXP_NUM 0}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "k",rhs=EXP_NUM 10}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "s",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "s",opr=BOP_PLUS,
                                               rht=EXP_ID "k"}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "k",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "k",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_ID "k",opr=BOP_GE,rht=EXP_NUM 0}},
            ST_PRINT {exp=EXP_ID "k"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "s"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
