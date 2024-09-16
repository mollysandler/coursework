val prog =
  PROGRAM
    {classes=[{decls=["a"],funcs=[],name="A",super=NONE}],decls=["o"],
     funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "o",rhs=EXP_NEW {class="A"}}},
            ST_PRINT {exp=EXP_DOT {field="a",obj=EXP_ID "o"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
