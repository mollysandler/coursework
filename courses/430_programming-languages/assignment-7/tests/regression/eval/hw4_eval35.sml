val prog =
  PROGRAM
    {classes=[],decls=["i","j"],funcs=[],
     stmts=[ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "j"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 7}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "j"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 10}},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "i",opr=BOP_PLUS,rht=EXP_ID "j"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_BOOL true}},
            ST_IF
              {el=NONE,guard=EXP_ID "i",
               th=ST_BLOCK
                    {stmts=[ST_PRINT {exp=EXP_ID "j"},
                            ST_PRINT {exp=EXP_STRING "\n"}]}}]} : program
;
