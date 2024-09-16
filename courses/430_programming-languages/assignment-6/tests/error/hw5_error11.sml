val prog =
  PROGRAM
    {decls=[("f",TY_BOOL)],
     func_decls=[("g",
                  {body=[ST_IF
                           {el=SOME
                                 (ST_BLOCK
                                    {stmts=[ST_RETURN
                                              {exp=SOME (EXP_BOOL true)}]}),
                            guard=EXP_ID "x",
                            th=ST_BLOCK
                                 {stmts=[ST_RETURN
                                           {exp=SOME
                                                  (EXP_ANON
                                                     {body=[ST_RETURN
                                                              {exp=SOME
                                                                     (EXP_BINARY
                                                                        {lft=EXP_ID
                                                                               "x",
                                                                         opr=BOP_PLUS,
                                                                         rht=EXP_NUM
                                                                               1})}],
                                                      decls=[],
                                                      params=[("x",TY_INT)],
                                                      ret_type=TY_INT})}]}},
                         ST_RETURN {exp=SOME (EXP_BOOL false)}],decls=[],
                   params=[("x",TY_BOOL)],
                   ret_type=TY_FUNC {in_types=[TY_INT],ret_type=TY_INT}})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_CALL {args=[EXP_BOOL false],func=EXP_ID "g"}}},
            ST_PRINT {exp=EXP_ID "f"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 2],func=EXP_ID "f"}}]}
  : program
;
