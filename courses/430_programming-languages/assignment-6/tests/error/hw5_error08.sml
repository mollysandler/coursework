val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",
                  {body=[ST_RETURN {exp=SOME (EXP_BOOL false)}],decls=[],
                   params=[],ret_type=TY_BOOL})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_CALL {args=[],func=EXP_ID "f"},opr=BOP_PLUS,
                      rht=EXP_NUM 1}}]} : program
;
