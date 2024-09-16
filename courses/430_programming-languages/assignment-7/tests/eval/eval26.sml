val prog =
  PROGRAM
    {classes=[{decls=["data"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="data",obj=EXP_THIS},
                                        rhs=EXP_ID "data"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["data"]}),
                      ("go",
                       {body=[ST_PRINT {exp=EXP_STRING "in A's method -- "},
                              ST_PRINT
                                {exp=EXP_DOT {field="data",obj=EXP_THIS}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]})],name="A",super=NONE}],decls=["f"],
     funcs=[("getMethod",
             {body=[ST_RETURN
                      {exp=SOME
                             (EXP_DOT
                                {field="go",
                                 obj=EXP_CALL
                                       {args=[EXP_NUM 2],
                                        func=EXP_DOT
                                               {field="init",
                                                obj=EXP_NEW {class="A"}}}})}],
              decls=[],params=[]})],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_CALL {args=[],func=EXP_ID "getMethod"}}},
            ST_EXP {exp=EXP_CALL {args=[],func=EXP_ID "f"}}]} : program
;
