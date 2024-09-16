val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",{body=[],decls=[],params=[],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_NUM 1,opr=BOP_PLUS,
                      rht=EXP_CALL {args=[],func=EXP_ID "f"}}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
