val prog =
  PROGRAM
    {decls=[("i",TY_INT),("j",TY_INT)],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 3}},
                         ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 4}},
                         ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "i",
                                   rhs=EXP_BINARY
                                         {lft=EXP_ID "j",opr=BOP_GT,
                                          rht=EXP_BOOL false}}}],decls=[],
                   params=[],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "i",rhs=EXP_CALL {args=[],func=EXP_ID "f"}}}]}
  : program
;
