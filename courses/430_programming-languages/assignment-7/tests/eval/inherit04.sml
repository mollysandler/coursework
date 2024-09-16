val prog =
  PROGRAM
    {classes=[{decls=["x"],
               funcs=[("superInit",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_NUM 0}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]}),
                      ("increment",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_BINARY
                                              {lft=EXP_DOT
                                                     {field="x",obj=EXP_THIS},
                                               opr=BOP_PLUS,rht=EXP_NUM 1}}}],
                        decls=[],params=[]})],name="Super",super=NONE},
              {decls=["y"],
               funcs=[("increment",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="x",obj=EXP_THIS},
                                        rhs=EXP_BINARY
                                              {lft=EXP_DOT
                                                     {field="x",obj=EXP_THIS},
                                               opr=BOP_PLUS,rht=EXP_NUM 1}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="y",obj=EXP_THIS},
                                        rhs=EXP_BINARY
                                              {lft=EXP_DOT
                                                     {field="y",obj=EXP_THIS},
                                               opr=BOP_PLUS,rht=EXP_NUM 1}}}],
                        decls=[],params=[]}),
                      ("init",
                       {body=[ST_EXP
                                {exp=EXP_CALL
                                       {args=[],
                                        func=EXP_DOT
                                               {field="superInit",
                                                obj=EXP_THIS}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="y",obj=EXP_THIS},
                                        rhs=EXP_NUM 10}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="Sub",super=SOME "Super"}],
     decls=["sup","sub"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sup",
                      rhs=EXP_CALL
                            {args=[],
                             func=EXP_DOT
                                    {field="superInit",
                                     obj=EXP_NEW {class="Super"}}}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "sub",
                      rhs=EXP_CALL
                            {args=[],
                             func=EXP_DOT
                                    {field="init",obj=EXP_NEW {class="Sub"}}}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "sup"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "sub"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="increment",obj=EXP_ID "sup"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="increment",obj=EXP_ID "sup"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="increment",obj=EXP_ID "sup"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="increment",obj=EXP_ID "sub"}}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT {field="increment",obj=EXP_ID "sub"}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "sup"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "sub"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "sub"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
