val prog =
  PROGRAM
    {decls=[("x",TY_NONE)],
     func_decls=[("j",
                  {body=[],decls=[],params=[("b",TY_BOOL)],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "x",
                      rhs=EXP_CALL
                            {args=[EXP_BINARY
                                     {lft=EXP_BOOL true,opr=BOP_GT,
                                      rht=EXP_NUM 3}],func=EXP_ID "j"}}}]}
  : program
;
