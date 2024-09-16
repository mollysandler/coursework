


val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_IF
              {el=NONE,
               guard=EXP_BINARY {lft=EXP_NUM 1,opr=BOP_LT,rht=EXP_NUM 2},
               th=ST_BLOCK {stmts=[ST_PRINT {exp=EXP_BOOL true}]}}]} : program

;
