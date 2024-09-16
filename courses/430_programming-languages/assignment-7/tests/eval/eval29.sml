val prog =
  PROGRAM
    {classes=[{decls=["a"],
               funcs=[("f",
                       {body=[ST_EXP
                                {exp=EXP_CALL
                                       {args=[],
                                        func=EXP_ANON
                                               {body=[ST_PRINT
                                                        {exp=EXP_DOT
                                                               {field="a",
                                                                obj=EXP_THIS}},
                                                      ST_PRINT
                                                        {exp=EXP_STRING "\n"}],
                                                decls=[],params=[]}}}],
                        decls=[],params=[]})],name="A",super=NONE}],decls=[],
     funcs=[],
     stmts=[ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="f",obj=EXP_NEW {class="A"}}}}]}
  : program
;
