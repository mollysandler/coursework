val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[EXP_NUM 1,EXP_NUM 1],
                      func=EXP_ANON
                             {body=[],decls=[("a",TY_INT),("a",TY_INT)],
                              params=[("c",TY_INT),("b",TY_INT)],
                              ret_type=TY_INT}}}]} : program
;
