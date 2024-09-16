val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_EQ,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_EQ,rht=EXP_NUM 1}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_EQ,rht=EXP_NONE}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_STRING "Hello",opr=BOP_EQ,rht=EXP_BOOL true}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_STRING "Hello",opr=BOP_EQ,
                      rht=EXP_STRING "Hello"}},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_NE,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_NE,rht=EXP_NUM 1}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_NE,rht=EXP_NONE}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_STRING "Hello",opr=BOP_NE,rht=EXP_BOOL true}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_STRING "Hello",opr=BOP_NE,
                      rht=EXP_STRING "Hello"}},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
