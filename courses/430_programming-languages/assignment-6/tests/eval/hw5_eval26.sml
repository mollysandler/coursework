val prog =
  PROGRAM
    {decls=[("a",TY_INT),("f",TY_FUNC {in_types=[],ret_type=TY_NONE})],
     func_decls=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 7}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_ANON
                            {body=[ST_PRINT {exp=EXP_ID "a"},
                                   ST_PRINT {exp=EXP_STRING ":n"}],decls=[],
                             params=[],ret_type=TY_NONE}}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
