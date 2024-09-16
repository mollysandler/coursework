val prog =
  PROGRAM
    {classes=[{decls=["a","b"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="a",obj=EXP_THIS},
                                        rhs=EXP_NUM 9}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="b",obj=EXP_THIS},
                                        rhs=EXP_NUM 32}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]}),
                      ("go",
                       {body=[ST_PRINT
                                {exp=EXP_CALL
                                       {args=[EXP_DOT {field="a",obj=EXP_THIS}],
                                        func=EXP_ID "square"}},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_PRINT
                                {exp=EXP_CALL
                                       {args=[EXP_DOT {field="b",obj=EXP_THIS}],
                                        func=EXP_ID "square"}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]})],name="Test",super=NONE}],decls=["obj"],
     funcs=[("square",
             {body=[ST_RETURN
                      {exp=SOME
                             (EXP_BINARY
                                {lft=EXP_ID "x",opr=BOP_TIMES,rht=EXP_ID "x"})}],
              decls=[],params=["x"]})],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "obj",
                      rhs=EXP_CALL
                            {args=[],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Test"}}}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "obj"}}}]}
  : program
;
