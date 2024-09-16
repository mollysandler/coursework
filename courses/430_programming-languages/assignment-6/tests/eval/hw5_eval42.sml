val prog =
  PROGRAM
    {decls=[("a",TY_STRING)],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "a",rhs=EXP_STRING "in f:n"}},
                         ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "h",
                                   rhs=EXP_ANON
                                         {body=[ST_EXP
                                                  {exp=EXP_ASSIGN
                                                         {lhs=EXP_ID "a",
                                                          rhs=EXP_STRING
                                                                "in h:n"}},
                                                ST_EXP
                                                  {exp=EXP_CALL
                                                         {args=[],
                                                          func=EXP_ID "g"}},
                                                ST_PRINT {exp=EXP_ID "a"}],
                                          decls=[("a",TY_STRING)],params=[],
                                          ret_type=TY_NONE}}},
                         ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "g",
                                   rhs=EXP_ANON
                                         {body=[ST_EXP
                                                  {exp=EXP_ASSIGN
                                                         {lhs=EXP_ID "a",
                                                          rhs=EXP_STRING
                                                                "in g:n"}},
                                                ST_PRINT {exp=EXP_ID "a"}],
                                          decls=[("a",TY_STRING)],params=[],
                                          ret_type=TY_NONE}}},
                         ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "h"}},
                         ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "g"}},
                         ST_PRINT {exp=EXP_ID "a"}],
                   decls=[("a",TY_STRING),
                          ("h",TY_FUNC {in_types=[],ret_type=TY_NONE}),
                          ("g",TY_FUNC {in_types=[],ret_type=TY_NONE})],
                   params=[],ret_type=TY_NONE})],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_STRING "global:n"}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_ID "a"}]} : program
;
