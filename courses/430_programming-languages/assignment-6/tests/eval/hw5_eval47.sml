val prog =
  PROGRAM
    {decls=[("factory",
             TY_FUNC
               {in_types=[TY_INT],
                ret_type=TY_FUNC {in_types=[],ret_type=TY_INT}}),
            ("plus1",TY_FUNC {in_types=[],ret_type=TY_INT}),
            ("plus10",TY_FUNC {in_types=[],ret_type=TY_INT})],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "shared",rhs=EXP_NUM 0}},
                         ST_RETURN
                           {exp=SOME
                                  (EXP_ANON
                                     {body=[ST_RETURN
                                              {exp=SOME
                                                     (EXP_ANON
                                                        {body=[ST_EXP
                                                                 {exp=EXP_ASSIGN
                                                                        {lhs=EXP_ID
                                                                               "shared",
                                                                         rhs=EXP_BINARY
                                                                               {lft=EXP_ID
                                                                                      "shared",
                                                                                opr=BOP_PLUS,
                                                                                rht=EXP_ID
                                                                                      "x"}}},
                                                               ST_RETURN
                                                                 {exp=SOME
                                                                        (EXP_ID
                                                                           "shared")}],
                                                         decls=[],params=[],
                                                         ret_type=TY_INT})}],
                                      decls=[],params=[("x",TY_INT)],
                                      ret_type=TY_FUNC
                                                 {in_types=[],ret_type=TY_INT}})}],
                   decls=[("shared",TY_INT)],params=[],
                   ret_type=TY_FUNC
                              {in_types=[TY_INT],
                               ret_type=TY_FUNC {in_types=[],ret_type=TY_INT}}})],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "factory",
                      rhs=EXP_CALL {args=[],func=EXP_ID "f"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "plus1",
                      rhs=EXP_CALL {args=[EXP_NUM 1],func=EXP_ID "factory"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "plus10",
                      rhs=EXP_CALL {args=[EXP_NUM 10],func=EXP_ID "factory"}}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "plus1"}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "plus1"}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "plus10"}},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "plus1"}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
