val prog =
  PROGRAM
    {classes=[{decls=[],
               funcs=[("f",
                       {body=[ST_PRINT {exp=EXP_STRING "in function f\n"}],
                        decls=[],params=[]})],name="F",super=NONE},
              {decls=["f"],funcs=[],name="E",super=NONE},
              {decls=["e"],funcs=[],name="D",super=NONE},
              {decls=["d"],funcs=[],name="C",super=NONE},
              {decls=["c"],funcs=[],name="B",super=NONE},
              {decls=["b"],funcs=[],name="A",super=NONE}],
     decls=["a","b","c","d","e","f"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NEW {class="A"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NEW {class="B"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NEW {class="C"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "d",rhs=EXP_NEW {class="D"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "e",rhs=EXP_NEW {class="E"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "f",rhs=EXP_NEW {class="F"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="f",obj=EXP_ID "e"},rhs=EXP_ID "f"}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="e",obj=EXP_ID "d"},rhs=EXP_ID "e"}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="d",obj=EXP_ID "c"},rhs=EXP_ID "d"}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="c",obj=EXP_ID "b"},rhs=EXP_ID "c"}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="b",obj=EXP_ID "a"},rhs=EXP_ID "b"}},
            ST_EXP
              {exp=EXP_CALL
                     {args=[],
                      func=EXP_DOT
                             {field="f",
                              obj=EXP_DOT
                                    {field="f",
                                     obj=EXP_DOT
                                           {field="e",
                                            obj=EXP_DOT
                                                  {field="d",
                                                   obj=EXP_DOT
                                                         {field="c",
                                                          obj=EXP_DOT
                                                                {field="b",
                                                                 obj=EXP_ID
                                                                       "a"}}}}}}}}]}
  : program
;
