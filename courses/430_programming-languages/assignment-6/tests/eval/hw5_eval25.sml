val prog =
  PROGRAM
    {decls=[("f",TY_FUNC {in_types=[],ret_type=TY_NONE})],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_ANON
                            {body=[ST_PRINT {exp=EXP_NUM 1},
                                   ST_PRINT {exp=EXP_STRING ":n"}],decls=[],
                             params=[],ret_type=TY_NONE}}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
