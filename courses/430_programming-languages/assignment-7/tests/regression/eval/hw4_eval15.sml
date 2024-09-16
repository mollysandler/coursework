val prog =
  PROGRAM
    {classes=[],decls=["a","b","c"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 1}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 2}},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "a",opr=BOP_PLUS,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "b",opr=BOP_MINUS,rht=EXP_NUM 7}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "a",opr=BOP_PLUS,rht=EXP_ID "b"},
                      opr=BOP_MINUS,rht=EXP_NUM 7}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_NUM 3,opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_ID "b",opr=BOP_TIMES,rht=EXP_NUM 4}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 8}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 6}},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "a",opr=BOP_MINUS,rht=EXP_NUM 7},
                      opr=BOP_MINUS,rht=EXP_ID "b"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_ID "a",opr=BOP_MINUS,
                      rht=EXP_BINARY
                            {lft=EXP_NUM 7,opr=BOP_MINUS,rht=EXP_ID "b"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "a",opr=BOP_MINUS,rht=EXP_NUM 7},
                      opr=BOP_MINUS,rht=EXP_ID "b"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 2}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 3}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 4}},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_ID "a",opr=BOP_TIMES,
                                    rht=EXP_ID "b"}},opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_NUM 7,opr=BOP_TIMES,
                                           rht=EXP_ID "c"},opr=BOP_DIVIDE,
                                    rht=EXP_ID "a"},opr=BOP_TIMES,
                             rht=EXP_NUM 5}}},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_ASSIGN
                            {lhs=EXP_ID "b",
                             rhs=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 4}}}},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_ID "a",opr=BOP_TIMES,
                                    rht=EXP_ID "b"}},opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_NUM 7,opr=BOP_TIMES,
                                           rht=EXP_ID "c"},opr=BOP_DIVIDE,
                                    rht=EXP_ID "a"},opr=BOP_TIMES,
                             rht=EXP_NUM 5}}},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
