val prog =
  PROGRAM
    {classes=[{decls=["x","y","f"],
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
                        params=["x","y"]})],name="A",super=NONE}],decls=["a"],
     funcs=[("function",
             {body=[ST_RETURN
                      {exp=SOME
                             (EXP_BINARY
                                {lft=EXP_DOT {field="x",obj=EXP_THIS},
                                 opr=BOP_PLUS,
                                 rht=EXP_DOT {field="y",obj=EXP_THIS}})}],
              decls=[],params=[]})],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "a",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 2,EXP_NUM 9],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="A"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="f",obj=EXP_ID "a"},
                      rhs=EXP_ID "function"}},
            ST_PRINT
              {exp=EXP_CALL {args=[],func=EXP_DOT {field="f",obj=EXP_ID "a"}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
