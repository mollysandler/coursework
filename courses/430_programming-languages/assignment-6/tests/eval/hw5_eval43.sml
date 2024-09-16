val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "g",
                                   rhs=EXP_ANON
                                         {body=[ST_EXP
                                                  {exp=EXP_ASSIGN
                                                         {lhs=EXP_ID "h",
                                                          rhs=EXP_ANON
                                                                {body=[ST_RETURN
                                                                         {exp=SOME
                                                                                (EXP_STRING
                                                                                   "from h:n")}],
                                                                 decls=[],
                                                                 params=[],
                                                                 ret_type=TY_STRING}}},
                                                ST_RETURN
                                                  {exp=SOME (EXP_ID "h")}],
                                          decls=[("h",
                                                  TY_FUNC
                                                    {in_types=[],
                                                     ret_type=TY_STRING})],
                                          params=[],
                                          ret_type=TY_FUNC
                                                     {in_types=[],
                                                      ret_type=TY_STRING}}}},
                         ST_RETURN {exp=SOME (EXP_ID "g")}],
                   decls=[("g",
                           TY_FUNC
                             {in_types=[],
                              ret_type=TY_FUNC
                                         {in_types=[],ret_type=TY_STRING}})],
                   params=[],
                   ret_type=TY_FUNC
                              {in_types=[],
                               ret_type=TY_FUNC
                                          {in_types=[],ret_type=TY_STRING}}})],
     stmts=[ST_PRINT
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_CALL
                             {args=[],func=EXP_CALL {args=[],func=EXP_ID "f"}}}}]}
  : program
;
