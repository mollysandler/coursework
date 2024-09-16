val prog =
  PROGRAM
    {classes=[{decls=["x"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_NUM 0}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="Super",super=NONE},
              {decls=[],
               funcs=[("increment",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_BINARY
                                              {lft=EXP_DOT
                                                     {field="x",obj=EXP_THIS},
                                               opr=BOP_PLUS,rht=EXP_NUM 1}}}],
                        decls=[],params=[]})],name="Sub",super=SOME "Super"}],
     decls=["o"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "o",
                      rhs=EXP_CALL
                            {args=[],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub"}}}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "o"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="increment",obj=EXP_ID "o"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="increment",obj=EXP_ID "o"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="increment",obj=EXP_ID "o"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="increment",obj=EXP_ID "o"}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "o"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
