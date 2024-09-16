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
              {decls=["area"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="area",obj=EXP_THIS},
                                        rhs=EXP_ANON
                                              {body=[ST_RETURN
                                                       {exp=SOME
                                                              (EXP_BINARY
                                                                 {lft=EXP_BINARY
                                                                        {lft=EXP_DOT
                                                                               {field="x",
                                                                                obj=EXP_ID
                                                                                      "botRight"},
                                                                         opr=BOP_MINUS,
                                                                         rht=EXP_DOT
                                                                               {field="x",
                                                                                obj=EXP_ID
                                                                                      "topLeft"}},
                                                                  opr=BOP_TIMES,
                                                                  rht=EXP_BINARY
                                                                        {lft=EXP_DOT
                                                                               {field="y",
                                                                                obj=EXP_ID
                                                                                      "topLeft"},
                                                                         opr=BOP_MINUS,
                                                                         rht=EXP_DOT
                                                                               {field="y",
                                                                                obj=EXP_ID
                                                                                      "botRight"}}})}],
                                               decls=[],params=[]}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=["topLeft","botRight"]})],name="Rectangle",
               super=NONE}],decls=["p1","p2","rect1","rect2"],funcs=[],
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
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "rect2",
                      rhs=EXP_CALL
                            {args=[EXP_ID "p1",EXP_ID "p2"],
                             func=EXP_DOT
                                    {field="init",
                                     obj=EXP_NEW {class="Rectangle"}}}}},
            ST_PRINT
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="area",obj=EXP_ID "rect1"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_CALL
                     {args=[],func=EXP_DOT {field="area",obj=EXP_ID "rect2"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_ID "rect1",opr=BOP_EQ,rht=EXP_ID "rect1"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_ID "rect1",opr=BOP_EQ,rht=EXP_ID "rect2"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_DOT {field="area",obj=EXP_ID "rect1"},
                      opr=BOP_EQ,
                      rht=EXP_DOT {field="area",obj=EXP_ID "rect2"}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_DOT {field="area",obj=EXP_ID "rect1"},
                      opr=BOP_EQ,
                      rht=EXP_DOT {field="area",obj=EXP_ID "rect1"}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
