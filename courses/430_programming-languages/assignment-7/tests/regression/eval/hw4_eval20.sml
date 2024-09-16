val prog =
  PROGRAM
    {classes=[],decls=["i","b"],funcs=[],
     stmts=[ST_BLOCK
              {stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 17}},
                      ST_EXP
                        {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_BOOL true}},
                      ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING " "},
                      ST_PRINT {exp=EXP_NUM 10},
                      ST_PRINT {exp=EXP_STRING "\n"},
                      ST_PRINT {exp=EXP_ID "b"},ST_PRINT {exp=EXP_STRING " "},
                      ST_PRINT {exp=EXP_BOOL false},
                      ST_PRINT {exp=EXP_STRING "\n"}]}]} : program
;
