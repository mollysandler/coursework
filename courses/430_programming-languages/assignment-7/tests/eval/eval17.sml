val prog =
  PROGRAM
    {classes=[{decls=["x","y"],
               funcs=[("f",
                       {body=[ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_THIS}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]}),
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
                        params=["x","y"]})],name="A",super=NONE}],decls=[],
     funcs=[],
     stmts=[ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT
                             {field="f",
                              obj=EXP_CALL
                                    {args=[EXP_UNARY
                                             {opnd=EXP_NUM 13,opr=UOP_MINUS},
                                           EXP_NUM 7],
                                     func=EXP_DOT
                                            {field="init",
                                             obj=EXP_NEW {class="A"}}}}}}]}
  : program
;
