val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_NUM 2,opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_NUM 3,opr=BOP_TIMES,rht=EXP_NONE}}}]}
  : program
;