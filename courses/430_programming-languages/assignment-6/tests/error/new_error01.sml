val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",
                  {body=[ST_RETURN {exp=SOME (EXP_NUM 0)}],decls=[],
                   params=[("i",TY_INT),("b",TY_BOOL),("s",TY_STRING)],
                   ret_type=TY_INT}),
                 ("g",
                  {body=[],decls=[],
                   params=[("func",
                            TY_FUNC
                              {in_types=[TY_INT,TY_INT,TY_STRING],
                               ret_type=TY_INT})],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP {exp=EXP_CALL {args=[EXP_ID "f"],func=EXP_ID "g"}}]}
  : program
;
