val prog =
  PROGRAM
    {classes=[{decls=[],
               funcs=[("f",
                       {body=[ST_PRINT {exp=EXP_STRING "in function f\n"}],
                        decls=[],params=[]})],name="F",super=NONE},
              {decls=["f"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="f",obj=EXP_THIS},
                                        rhs=EXP_NEW {class="F"}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="E",super=NONE},
              {decls=["e"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="e",obj=EXP_THIS},
                                        rhs=EXP_CALL
                                              {args=[],
                                               func=EXP_DOT
                                                      {field="init",
                                                       obj=EXP_NEW {class="E"}}}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="D",super=NONE},
              {decls=[],
               funcs=[("c",
                       {body=[ST_PRINT {exp=EXP_STRING "in function c\n"},
                              ST_RETURN
                                {exp=SOME
                                       (EXP_CALL
                                          {args=[],
                                           func=EXP_DOT
                                                  {field="init",
                                                   obj=EXP_NEW {class="D"}}})}],
                        decls=[],params=[]})],name="C",super=NONE},
              {decls=["c"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="c",obj=EXP_THIS},
                                        rhs=EXP_NEW {class="C"}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="B",super=NONE},
              {decls=["b"],
               funcs=[("init",
                       {body=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT {field="b",obj=EXP_THIS},
                                        rhs=EXP_CALL
                                              {args=[],
                                               func=EXP_DOT
                                                      {field="init",
                                                       obj=EXP_NEW {class="B"}}}}},
                              ST_RETURN {exp=SOME EXP_THIS}],decls=[],
                        params=[]})],name="A",super=NONE}],decls=[],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT
                             {field="f",
                              obj=EXP_DOT
                                    {field="f",
                                     obj=EXP_DOT
                                           {field="e",
                                            obj=EXP_CALL
                                                  {args=[],
                                                   func=EXP_DOT
                                                          {field="c",
                                                           obj=EXP_DOT
                                                                 {field="c",
                                                                  obj=EXP_DOT
                                                                        {field="b",
                                                                         obj=EXP_CALL
                                                                               {args=[],
                                                                                func=EXP_DOT
                                                                                       {field="init",
                                                                                        obj=EXP_NEW
                                                                                              {class="A"}}}}}}}}}}}}]}
  : program
;
