val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",
                  {body=[ST_PRINT {exp=EXP_ID "a"},
                         ST_PRINT {exp=EXP_STRING ":n"},
                         ST_PRINT {exp=EXP_ID "b"},
                         ST_PRINT {exp=EXP_STRING ":n"}],decls=[("a",TY_INT)],
                   params=[("a",TY_INT),("b",TY_INT)],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 1,EXP_NUM 2],func=EXP_ID "f"}}]}
  : program
;
