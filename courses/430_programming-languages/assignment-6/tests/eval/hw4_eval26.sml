val prog =
  PROGRAM
    {decls=[("i",TY_INT),("j",TY_INT),("k",TY_INT)],func_decls=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 3}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "j",
                      rhs=EXP_BINARY
                            {lft=EXP_ID "i",opr=BOP_PLUS,rht=EXP_NUM 17}}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "j"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 22}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 4}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "k",
                      rhs=EXP_BINARY
                            {lft=EXP_ID "i",opr=BOP_PLUS,rht=EXP_ID "j"}}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "j"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "k"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
