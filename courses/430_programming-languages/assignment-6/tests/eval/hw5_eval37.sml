val prog =
  PROGRAM
    {decls=[("add",
             TY_FUNC
               {in_types=[TY_INT],
                ret_type=TY_FUNC {in_types=[TY_INT],ret_type=TY_INT}}),
            ("add1",TY_FUNC {in_types=[TY_INT],ret_type=TY_INT})],
     func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "add",
                      rhs=EXP_ANON
                            {body=[ST_RETURN
                                     {exp=SOME
                                            (EXP_ANON
                                               {body=[ST_RETURN
                                                        {exp=SOME
                                                               (EXP_BINARY
                                                                  {lft=EXP_ID
                                                                         "x",
                                                                   opr=BOP_PLUS,
                                                                   rht=EXP_ID
                                                                         "y"})}],
                                                decls=[],
                                                params=[("y",TY_INT)],
                                                ret_type=TY_INT})}],decls=[],
                             params=[("x",TY_INT)],
                             ret_type=TY_FUNC
                                        {in_types=[TY_INT],ret_type=TY_INT}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "add1",
                      rhs=EXP_CALL {args=[EXP_NUM 1],func=EXP_ID "add"}}},
            ST_PRINT {exp=EXP_CALL {args=[EXP_NUM 2],func=EXP_ID "add1"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[EXP_NUM 3],func=EXP_ID "add1"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[EXP_NUM 9],func=EXP_ID "add1"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT
              {exp=EXP_CALL
                     {args=[EXP_BINARY
                              {lft=EXP_NUM 0,opr=BOP_MINUS,rht=EXP_NUM 1}],
                      func=EXP_ID "add1"}},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
