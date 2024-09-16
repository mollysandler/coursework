val prog =
  PROGRAM
    {classes=[{decls=[],funcs=[],name="A",super=NONE}],decls=["a"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NEW {class="A"}}},
            ST_PRINT {exp=EXP_DOT {field="data",obj=EXP_ID "a"}}]} : program
;
