val prog =
  PROGRAM
    {classes=[],decls=["r","pi1000","area"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "pi1000",rhs=EXP_NUM 3141}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "r",rhs=EXP_NUM 9}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "area",
                      rhs=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_ID "r",opr=BOP_TIMES,
                                           rht=EXP_ID "r"},opr=BOP_TIMES,
                                    rht=EXP_ID "pi1000"},opr=BOP_DIVIDE,
                             rht=EXP_NUM 1000}}},ST_PRINT {exp=EXP_ID "area"},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
