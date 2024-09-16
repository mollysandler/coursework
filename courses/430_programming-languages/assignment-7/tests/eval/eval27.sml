val prog =
  PROGRAM
    {classes=[{decls=[],funcs=[],name="A",super=NONE}],decls=["A"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "A",rhs=EXP_NEW {class="A"}}},
            ST_PRINT {exp=EXP_ID "A"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
