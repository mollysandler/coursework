val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_BLOCK
              {stmts=[ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 1,opr=BOP_PLUS,rht=EXP_NUM 2}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_NUM 2,opr=BOP_MINUS,rht=EXP_NUM 7}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_BINARY
                                      {lft=EXP_NUM 1,opr=BOP_PLUS,
                                       rht=EXP_NUM 2},opr=BOP_MINUS,
                                rht=EXP_NUM 7}},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_BLOCK
                        {stmts=[ST_PRINT
                                  {exp=EXP_BINARY
                                         {lft=EXP_NUM 3,opr=BOP_PLUS,
                                          rht=EXP_BINARY
                                                {lft=EXP_NUM 2,opr=BOP_TIMES,
                                                 rht=EXP_NUM 4}}},
                                ST_PRINT {exp=EXP_STRING "\n"},
                                ST_BLOCK
                                  {stmts=[ST_PRINT
                                            {exp=EXP_BINARY
                                                   {lft=EXP_BINARY
                                                          {lft=EXP_NUM 8,
                                                           opr=BOP_MINUS,
                                                           rht=EXP_NUM 7},
                                                    opr=BOP_MINUS,
                                                    rht=EXP_NUM 6}},
                                          ST_PRINT {exp=EXP_STRING "\n"},
                                          ST_PRINT
                                            {exp=EXP_BINARY
                                                   {lft=EXP_NUM 8,
                                                    opr=BOP_MINUS,
                                                    rht=EXP_BINARY
                                                          {lft=EXP_NUM 7,
                                                           opr=BOP_MINUS,
                                                           rht=EXP_NUM 6}}},
                                          ST_PRINT {exp=EXP_STRING "\n"}]},
                                ST_PRINT
                                  {exp=EXP_BINARY
                                         {lft=EXP_BINARY
                                                {lft=EXP_NUM 8,opr=BOP_MINUS,
                                                 rht=EXP_NUM 7},opr=BOP_MINUS,
                                          rht=EXP_NUM 6}},
                                ST_PRINT {exp=EXP_STRING "\n"}]},
                      ST_PRINT
                        {exp=EXP_BINARY
                               {lft=EXP_BINARY
                                      {lft=EXP_NUM 1,opr=BOP_PLUS,
                                       rht=EXP_BINARY
                                             {lft=EXP_NUM 2,opr=BOP_TIMES,
                                              rht=EXP_NUM 3}},opr=BOP_PLUS,
                                rht=EXP_BINARY
                                      {lft=EXP_BINARY
                                             {lft=EXP_BINARY
                                                    {lft=EXP_NUM 7,
                                                     opr=BOP_TIMES,
                                                     rht=EXP_NUM 4},
                                              opr=BOP_DIVIDE,rht=EXP_NUM 2},
                                       opr=BOP_TIMES,rht=EXP_NUM 5}}},
                      ST_PRINT {exp=EXP_STRING "\n"}]}]} : program
;
