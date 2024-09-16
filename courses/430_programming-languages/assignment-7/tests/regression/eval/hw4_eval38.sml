val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 2,guard=EXP_BOOL true,thenExp=EXP_NUM 1}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 2,guard=EXP_BOOL false,
                      thenExp=EXP_NUM 1}},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 3,guard=EXP_BOOL true,
                      thenExp=EXP_COND
                                {elseExp=EXP_NUM 2,guard=EXP_BOOL false,
                                 thenExp=EXP_NUM 1}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 3,guard=EXP_BOOL true,
                      thenExp=EXP_COND
                                {elseExp=EXP_NUM 2,guard=EXP_BOOL true,
                                 thenExp=EXP_NUM 1}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 3,guard=EXP_BOOL false,
                      thenExp=EXP_COND
                                {elseExp=EXP_NUM 2,guard=EXP_BOOL true,
                                 thenExp=EXP_NUM 1}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_COND
                     {elseExp=EXP_NUM 3,guard=EXP_BOOL false,
                      thenExp=EXP_COND
                                {elseExp=EXP_NUM 2,guard=EXP_BOOL false,
                                 thenExp=EXP_NUM 1}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
