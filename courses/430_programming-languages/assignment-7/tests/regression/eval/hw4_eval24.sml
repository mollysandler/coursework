val prog =
  PROGRAM
    {classes=[],decls=["i"],funcs=[],
     stmts=[ST_BLOCK
              {stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 0}},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_ID "i",opr=BOP_GT,rht=EXP_NUM 0}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_LT,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_GT,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_EQ,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_NE,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_GE,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 3,opr=BOP_LE,rht=EXP_NUM 5}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_BINARY
                                      {lft=EXP_NUM 3,opr=BOP_LE,rht=EXP_NUM 5},
                                opr=BOP_AND,
                                rht=EXP_BINARY
                                      {lft=EXP_NUM 5,opr=BOP_LE,
                                       rht=EXP_NUM 22}}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_BINARY
                                      {lft=EXP_NUM 3,opr=BOP_LE,rht=EXP_NUM 5},
                                opr=BOP_AND,
                                rht=EXP_BINARY
                                      {lft=EXP_NUM 5,opr=BOP_GT,
                                       rht=EXP_NUM 22}}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_BINARY
                                      {lft=EXP_NUM 3,opr=BOP_LT,rht=EXP_NUM 5},
                                opr=BOP_OR,
                                rht=EXP_BINARY
                                      {lft=EXP_NUM 5,opr=BOP_GT,
                                       rht=EXP_NUM 10}}},
                      ST_PRINT {exp=EXP_STRING "\n"}]}]} : program
;
