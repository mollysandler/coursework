val prog =
  PROGRAM
    {decls=[("a",TY_INT),("b",TY_STRING),
            ("f",TY_FUNC {in_types=[TY_INT],ret_type=TY_NONE})],func_decls=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 7}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_ANON
                            {body=[ST_PRINT {exp=EXP_ID "a"},
                                   ST_PRINT {exp=EXP_STRING ":n"}],decls=[],
                             params=[("a",TY_INT)],ret_type=TY_NONE}}},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 2],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
