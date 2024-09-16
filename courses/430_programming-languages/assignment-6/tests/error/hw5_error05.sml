val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",
                  {body=[ST_IF
                           {el=NONE,guard=EXP_NUM 3,
                            th=ST_BLOCK
                                 {stmts=[ST_PRINT {exp=EXP_NUM 1},
                                         ST_PRINT {exp=EXP_STRING ":n"}]}}],
                   decls=[],params=[],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
