val prog =
  PROGRAM
    {decls=[("a",TY_INT),("b",TY_INT),
            ("f",TY_FUNC {in_types=[TY_INT],ret_type=TY_INT})],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_ANON
                            {body=[ST_RETURN
                                     {exp=SOME
                                            (EXP_BINARY
                                               {lft=EXP_ID "x",opr=BOP_PLUS,
                                                rht=EXP_NUM 1})}],decls=[],
                             params=[("x",TY_INT)],ret_type=TY_INT}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_CALL {args=[EXP_NUM 2],func=EXP_ID "f"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "b",
                      rhs=EXP_CALL {args=[EXP_NUM 3],func=EXP_ID "f"}}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "b"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
