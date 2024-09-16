val prog =
  PROGRAM
    {decls=[("a",TY_NONE),("b",TY_INT),("c",TY_INT)],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 100}},
                         ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 200}},
                         ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "a",
                                   rhs=EXP_CALL {args=[],func=EXP_ID "g"}}}],
                   decls=[("b",TY_INT),("c",TY_INT)],
                   params=[("g",TY_FUNC {in_types=[],ret_type=TY_NONE})],
                   ret_type=TY_NONE})],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 1}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 2}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_CALL
                            {args=[EXP_ANON
                                     {body=[ST_PRINT {exp=EXP_ID "b"},
                                            ST_PRINT {exp=EXP_STRING ":n"},
                                            ST_PRINT {exp=EXP_ID "c"},
                                            ST_PRINT {exp=EXP_STRING ":n"}],
                                      decls=[],params=[],ret_type=TY_NONE}],
                             func=EXP_ID "f"}}}]} : program
;
