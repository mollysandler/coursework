val prog =
  PROGRAM
    {classes=[{decls=["x","y"],
               funcs=[("f",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "x",rhs=EXP_NUM 27}}],
                        decls=[],params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_ID "x"}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="y",obj=EXP_THIS},
                                        rhs=EXP_ID "y"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["x","y"]})],name="A",super=NONE}],
     decls=["x","a"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 10,EXP_NUM 20],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="A"}}}}},
            ST_EXP
              {exp=EXP_CALL {args=[],func=EXP_DOT {field="f",obj=EXP_ID "a"}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"},ST_PRINT {exp=EXP_ID "x"},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
