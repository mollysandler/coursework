val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BOOL true,opr=BOP_AND,rht=EXP_BOOL false}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BOOL true,opr=BOP_AND,rht=EXP_BOOL true}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BOOL false,opr=BOP_AND,rht=EXP_BOOL false}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BOOL false,opr=BOP_AND,rht=EXP_BOOL true}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
