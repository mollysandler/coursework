val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_NUM 2,guard=EXP_NONE,thenExp=EXP_NUM 1}}]}
  : program
;
