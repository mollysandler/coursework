val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_PRINT
              {exp=EXP_CALL
                     {args=[EXP_NUM 5],
                      func=EXP_CALL
                             {args=[],
                              func=EXP_ANON
                                     {body=[ST_EXP
                                              {exp=EXP_ASSIGN
                                                     {lhs=EXP_ID "f",
                                                      rhs=EXP_ANON
                                                            {body=[ST_IF
                                                                     {el=SOME
                                                                           (ST_BLOCK
                                                                              {stmts=[ST_RETURN
                                                                                        {exp=SOME
                                                                                               (EXP_BINARY
                                                                                                  {lft=EXP_ID
                                                                                                         "x",
                                                                                                   opr=BOP_TIMES,
                                                                                                   rht=EXP_CALL
                                                                                                         {args=[EXP_BINARY
                                                                                                                  {lft=EXP_ID
                                                                                                                         "x",
                                                                                                                   opr=BOP_MINUS,
                                                                                                                   rht=EXP_NUM
                                                                                                                         1}],
                                                                                                          func=EXP_ID
                                                                                                                 "f"}})}]}),
                                                                      guard=EXP_BINARY
                                                                              {lft=EXP_ID
                                                                                     "x",
                                                                               opr=BOP_LE,
                                                                               rht=EXP_NUM
                                                                                     1},
                                                                      th=ST_BLOCK
                                                                           {stmts=[ST_RETURN
                                                                                     {exp=SOME
                                                                                            (EXP_NUM
                                                                                               1)}]}}],
                                                             decls=[],
                                                             params=[("x",
                                                                      TY_INT)],
                                                             ret_type=TY_INT}}},
                                            ST_RETURN {exp=SOME (EXP_ID "f")}],
                                      decls=[("f",
                                              TY_FUNC
                                                {in_types=[TY_INT],
                                                 ret_type=TY_INT})],params=[],
                                      ret_type=TY_FUNC
                                                 {in_types=[TY_INT],
                                                  ret_type=TY_INT}}}}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
