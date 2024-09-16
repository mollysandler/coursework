val prog =
  PROGRAM
    {classes=[{decls=[],
               funcs=[("f",
                       {body=[ST_PRINT {exp=EXP_STRING "in f\n"}],decls=[],
                        params=[]})],name="A",super=NONE}],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="f",obj=EXP_NEW {class="A"}}}}]}
  : program
;
