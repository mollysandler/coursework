val prog =
  PROGRAM
    {decls=[("f",TY_FUNC {in_types=[TY_INT,TY_INT],ret_type=TY_NONE})],
     func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_ANON
                            {body=[ST_PRINT
                                     {exp=EXP_BINARY
                                            {lft=EXP_ID "a",opr=BOP_PLUS,
                                             rht=EXP_ID "b"}},
                                   ST_PRINT {exp=EXP_STRING ":n"}],decls=[],
                             params=[("a",TY_INT),("b",TY_INT)],
                             ret_type=TY_NONE}}},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 1,EXP_NUM 2],func=EXP_ID "f"}}]}
  : program
;
