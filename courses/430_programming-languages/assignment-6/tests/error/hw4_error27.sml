val prog =
  PROGRAM
    {decls=[("a",TY_INT),("b",TY_INT),("c",TY_INT),("a",TY_INT)],
     func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_PRINT {exp=EXP_ID "a"}]} : program
;
