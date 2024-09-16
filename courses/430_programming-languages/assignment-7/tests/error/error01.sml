val prog =
  PROGRAM
    {classes=[{decls=[],funcs=[],name="A",super=NONE}],decls=["a"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_CALL {args=[],func=EXP_NEW {class="A"}}}}]}
  : program
;
