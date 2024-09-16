val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_IF
              {el=NONE,guard=EXP_NUM 3,
               th=ST_BLOCK {stmts=[ST_PRINT {exp=EXP_NUM 1}]}}]} : program
;
