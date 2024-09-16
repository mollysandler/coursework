val prog =
  PROGRAM
    {decls=[("i",TY_NONE)],func_decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "should not get here:n"},
            ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_DIVIDE,rht=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "i",
                      rhs=EXP_CALL {args=[EXP_BOOL true],func=EXP_ID "i"}}}]}
  : program
;
