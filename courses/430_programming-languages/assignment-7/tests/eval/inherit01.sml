val prog =
  PROGRAM
    {classes=[{decls=["x","y"],funcs=[],name="Super",super=NONE},
              {decls=[],funcs=[],name="Sub",super=SOME "Super"}],decls=["o"],
     funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "o",rhs=EXP_NEW {class="Sub"}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "o"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "o"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
