val prog =
  PROGRAM
    {classes=[{decls=[],funcs=[],name="A",super=SOME "B"},
              {decls=[],funcs=[],name="B",super=NONE}],decls=[],funcs=[],
     stmts=[ST_EXP {exp=EXP_NEW {class="A"}}]} : program
;
