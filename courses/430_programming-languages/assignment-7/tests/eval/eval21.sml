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
                        params=["x","y"]})],name="Point",super=NONE},
              {decls=["topLeft","botRight"],
               funcs=[("area",
                       {body=[ST_RETURN
                                {exp=SOME
                                       (EXP_BINARY
                                          {lft=EXP_BINARY
                                                 {lft=EXP_DOT
                                                        {field="x",
                                                         obj=EXP_DOT
                                                               {field="botRight",
                                                                obj=EXP_THIS}},
                                                  opr=BOP_MINUS,
                                                  rht=EXP_DOT
                                                        {field="x",
                                                         obj=EXP_DOT
                                                               {field="topLeft",
                                                                obj=EXP_THIS}}},
                                           opr=BOP_TIMES,
                                           rht=EXP_BINARY
                                                 {lft=EXP_DOT
                                                        {field="y",
                                                         obj=EXP_DOT
                                                               {field="topLeft",
                                                                obj=EXP_THIS}},
                                                  opr=BOP_MINUS,
                                                  rht=EXP_DOT
                                                        {field="y",
                                                         obj=EXP_DOT
                                                               {field="botRight",
                                                                obj=EXP_THIS}}}})}],
                        decls=[],params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="topLeft",obj=EXP_THIS},
                                        rhs=EXP_ID "topLeft"}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="botRight",obj=EXP_THIS},
                                        rhs=EXP_ID "botRight"}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["topLeft","botRight"]})],name="Rectangle",
               super=NONE}],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_CALL
                     {args=[EXP_CALL
                              {args=[EXP_NUM 0,EXP_NUM 5],
                               func=EXP_DOT
                                      {field="init",
                                       obj=EXP_NEW {class="Point"}}},
                            EXP_CALL
                              {args=[EXP_NUM 5,EXP_NUM 1],
                               func=EXP_DOT
                                      {field="init",
                                       obj=EXP_NEW {class="Point"}}}],
                      func=EXP_DOT
                             {field="init",obj=EXP_NEW {class="Rectangle"}}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
