val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_PRINT {exp=EXP_NUM 1},
                              ST_PRINT {exp=EXP_STRING "\n"}]},
               guard=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_GT,rht=EXP_NUM 2}}]}
  : program
;
