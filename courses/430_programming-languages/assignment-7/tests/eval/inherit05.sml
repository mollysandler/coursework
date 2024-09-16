val prog =
  PROGRAM
    {classes=[{decls=["data"],
               funcs=[("go",
                       {body=[ST_PRINT {exp=EXP_STRING "top\n"}],decls=[],
                        params=[]})],name="Top",super=NONE},
              {decls=["value"],
               funcs=[("go",
                       {body=[ST_PRINT {exp=EXP_STRING "sub1 -- "},
                              ST_PRINT
                                {exp=EXP_DOT {field="value",obj=EXP_THIS}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="value",obj=EXP_THIS},
                                        rhs=EXP_ID "value"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["value"]})],name="Sub1",super=SOME "Top"},
              {decls=[],
               funcs=[("other",
                       {body=[ST_PRINT {exp=EXP_STRING "sub2 -- "},
                              ST_PRINT
                                {exp=EXP_DOT {field="data",obj=EXP_THIS}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="data",obj=EXP_THIS},
                                        rhs=EXP_ID "data"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["data"]})],name="Sub2",super=SOME "Top"},
              {decls=[],
               funcs=[("other",
                       {body=[ST_PRINT {exp=EXP_STRING "subsub -- "},
                              ST_PRINT
                                {exp=EXP_DOT {field="data",obj=EXP_THIS}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="data",obj=EXP_THIS},
                                        rhs=EXP_ID "data"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["data"]})],name="SubSub",super=SOME "Sub1"}],
     decls=["top","sub10","sub11","sub20","sub21","subsub"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN {lhs=EXP_ID "top",rhs=EXP_NEW {class="Top"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sub10",
                      rhs=EXP_CALL
                            {args=[EXP_STRING "ten"],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub1"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sub11",
                      rhs=EXP_CALL
                            {args=[EXP_STRING "eleven"],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub1"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sub20",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 20],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub2"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sub21",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 21],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub2"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "subsub",
                      rhs=EXP_CALL
                            {args=[EXP_STRING "bottom"],
                             func=EXP_DOT
                                    {field="init",
                                     obj=EXP_NEW {class="SubSub"}}}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "top"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "sub10"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "sub11"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "sub20"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "sub21"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="go",obj=EXP_ID "subsub"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="other",obj=EXP_ID "sub20"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="other",obj=EXP_ID "sub21"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="other",obj=EXP_ID "subsub"}}}]}
  : program
;
