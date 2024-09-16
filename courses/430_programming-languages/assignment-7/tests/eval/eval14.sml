val prog =
  PROGRAM
    {classes=[{decls=["x","y"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_ID "x"}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="y",obj=EXP_THIS},
                                        rhs=EXP_ID "y"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["x","y"]})],name="A",super=NONE},
              {decls=["a"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="a",obj=EXP_THIS},
                                        rhs=EXP_CALL
                                              {args=[EXP_ID "x",EXP_ID "y"],
                                               func=EXP_DOT
                                                      {field="init",
                                                       obj=EXP_NEW {class="A"}}}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["x","y"]})],name="B",super=NONE}],decls=["b"],
     funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "b",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 9,EXP_BOOL false],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="B"}}}}},
            ST_PRINT
              {exp=EXP_DOT {field="x",obj=EXP_DOT {field="a",obj=EXP_ID "b"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_DOT {field="y",obj=EXP_DOT {field="a",obj=EXP_ID "b"}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
