val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_PLUS,rht=EXP_NUM 3}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_NUM 3,opr=BOP_MINUS,rht=EXP_NUM 4}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_PLUS,rht=EXP_NUM 3},
                             opr=BOP_PLUS,
                             rht=EXP_UNARY {opnd=EXP_NUM 4,opr=UOP_MINUS}},
                      opr=BOP_PLUS,rht=EXP_NUM 5}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_MINUS,rht=EXP_NUM 2},
                      opr=BOP_MINUS,rht=EXP_NUM 3}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_STRING "Hello",opr=BOP_PLUS,
                             rht=EXP_STRING ", "},opr=BOP_PLUS,
                      rht=EXP_STRING "World."}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
