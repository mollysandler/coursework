val prog =
  PROGRAM
    {decls=[("i",TY_INT),("j",TY_INT),("k",TY_BOOL)],func_decls=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 7}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 10}},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "i",opr=BOP_PLUS,rht=EXP_ID "j"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "k",rhs=EXP_BOOL true}},
            ST_IF
              {el=NONE,guard=EXP_ID "k",
               th=ST_BLOCK
                    {stmts=[ST_PRINT {exp=EXP_ID "j"},
                            ST_PRINT {exp=EXP_STRING ":n"}]}}]} : program
;
