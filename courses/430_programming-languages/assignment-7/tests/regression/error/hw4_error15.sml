val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_NUM 2,opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_NUM 3,opr=BOP_TIMES,rht=EXP_NONE}}}]}
  : program
;
