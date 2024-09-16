val prog =
  PROGRAM
    {classes=[{decls=["x","y"],funcs=[],name="Point",super=NONE}],
     decls=["p1","p2"],funcs=[],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN {lhs=EXP_ID "p1",rhs=EXP_NEW {class="Point"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="x",obj=EXP_ID "p1"},rhs=EXP_NUM 2}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="y",obj=EXP_ID "p1"},rhs=EXP_NUM 3}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "p1"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "p1"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP
              {exp=EXP_ASSIGN {lhs=EXP_ID "p2",rhs=EXP_NEW {class="Point"}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="x",obj=EXP_ID "p2"},rhs=EXP_NUM 9}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="y",obj=EXP_ID "p2"},rhs=EXP_NUM 27}},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "p2"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "p2"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="x",obj=EXP_ID "p1"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT {exp=EXP_DOT {field="y",obj=EXP_ID "p1"}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
