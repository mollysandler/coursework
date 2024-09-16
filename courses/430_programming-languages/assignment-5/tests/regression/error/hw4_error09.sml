val prog =
  PROGRAM
    {decls=[],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY {lft=EXP_NUM 3,opr=BOP_LE,rht=EXP_STRING "bob"}}]}
  : program
;
