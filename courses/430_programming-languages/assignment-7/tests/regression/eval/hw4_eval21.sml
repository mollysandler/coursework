val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_LT,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_LT,rht=EXP_NUM 3}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_GT,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 9,opr=BOP_GT,rht=EXP_NUM 4}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_LE,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_LE,rht=EXP_NUM 3}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_LE,rht=EXP_NUM 1}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_GE,rht=EXP_NUM 2}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_GE,rht=EXP_NUM 3}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BINARY {lft=EXP_NUM 2,opr=BOP_GE,rht=EXP_NUM 1}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
