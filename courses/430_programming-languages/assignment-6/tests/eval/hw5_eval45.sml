val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",{body=[],decls=[],params=[],ret_type=TY_NONE}),
                 ("g",{body=[],decls=[],params=[],ret_type=TY_NONE})],
     stmts=[ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "f",opr=BOP_EQ,rht=EXP_ID "f"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "f",opr=BOP_EQ,rht=EXP_ID "g"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_ANON
                            {body=[],decls=[],params=[],ret_type=TY_NONE},
                      opr=BOP_EQ,
                      rht=EXP_ANON
                            {body=[],decls=[],params=[],ret_type=TY_NONE}}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
