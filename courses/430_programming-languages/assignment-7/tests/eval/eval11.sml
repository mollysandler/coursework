val prog =
  PROGRAM
    {classes=[{decls=["x","y"],
               funcs=[("f",
                       {body=[ST_PRINT
                                {exp=EXP_DOT {field="x",obj=EXP_ID "that"}},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_PRINT
                                {exp=EXP_DOT {field="y",obj=EXP_ID "that"}},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="x",obj=EXP_ID "that"},
                                        rhs=EXP_BINARY
                                              {lft=EXP_DOT
                                                     {field="x",
                                                      obj=EXP_ID "that"},
                                               opr=BOP_PLUS,rht=EXP_NUM 9}}},
                              ST_PRINT
                                {exp=EXP_DOT {field="x",obj=EXP_ID "that"}},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_PRINT
                                {exp=EXP_DOT {field="y",obj=EXP_ID "that"}},
                              ST_PRINT {exp=EXP_STRING "\n"}],decls=[],
                        params=["that"]})],name="A",super=NONE}],decls=["a"],
     funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NEW {class="A"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="x",obj=EXP_ID "a"},rhs=EXP_NUM 1}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="y",obj=EXP_ID "a"},rhs=EXP_NUM 2}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_CALL
                     {args=[EXP_ID "a"],
                      func=EXP_DOT {field="f",obj=EXP_ID "a"}}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "a"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
