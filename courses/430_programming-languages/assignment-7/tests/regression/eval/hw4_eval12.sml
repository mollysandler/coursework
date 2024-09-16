val prog =
  PROGRAM
    {classes=[],decls=["a"],funcs=[],
     stmts=[ST_PRINT {exp=EXP_NUM 2},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_NUM 4},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_STRING "Hello."},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BOOL true},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_NONE},ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_BOOL false},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 17}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
