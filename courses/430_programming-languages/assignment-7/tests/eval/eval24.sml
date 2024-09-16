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
               super=NONE}],decls=["p1","p2","rect1","f"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "p1",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 0,EXP_NUM 5],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Point"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "p2",
                      rhs=EXP_CALL
                            {args=[EXP_NUM 5,EXP_NUM 1],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Point"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "rect1",
                      rhs=EXP_CALL
                            {args=[EXP_ID "p1",EXP_ID "p2"],
                             func=EXP_DOT
                                    {field="init",
                                     obj=EXP_NEW {class="Rectangle"}}}}},
            ST_PRINT
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="area",obj=EXP_ID "rect1"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "f",
                      rhs=EXP_DOT {field="area",obj=EXP_ID "rect1"}}},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
