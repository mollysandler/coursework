val prog =
  PROGRAM
    {classes=[],decls=["b","i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NONE}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 2}},
            ST_IF
              {el=NONE,
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_GE,rht=EXP_ID "b"},
               th=ST_BLOCK {stmts=[ST_PRINT {exp=EXP_ID "i"}]}}]} : program
;
