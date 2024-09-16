val prog =
  PROGRAM
    {decls=[("a",TY_NONE),("b",TY_NONE)],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_ID "a",opr=BOP_MINUS,rht=EXP_ID "b"}}]}
  : program
;
