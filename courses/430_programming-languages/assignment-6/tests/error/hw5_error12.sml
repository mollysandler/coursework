val prog =
  PROGRAM
    {decls=[("f",TY_INT)],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_BINARY
                            {lft=EXP_ANON
                                   {body=[],decls=[],params=[],
                                    ret_type=TY_NONE},opr=BOP_PLUS,
                             rht=EXP_NUM 1}}}]} : program
;
