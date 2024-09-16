val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_BINARY {lft=EXP_NUM 3,opr=BOP_TIMES,rht=EXP_NUM 4}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_NUM 4,opr=BOP_DIVIDE,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_NUM 5,opr=BOP_MOD,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 3,opr=BOP_TIMES,rht=EXP_NUM 4},
                      opr=BOP_TIMES,rht=EXP_NUM 5}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
