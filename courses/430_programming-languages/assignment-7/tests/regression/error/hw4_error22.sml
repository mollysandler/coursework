val prog =
  PROGRAM
    {classes=[],decls=["i","j","b"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NONE}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 3}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "b",
                      rhs=EXP_BINARY
                            {lft=EXP_ID "j",opr=BOP_GT,rht=EXP_ID "i"}}}]}
  : program
;
