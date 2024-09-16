val prog =
  PROGRAM
    {classes=[],decls=["a","b","c"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 1}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 2}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_ID "a"}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "c"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "b"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 9}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_ID "c"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
