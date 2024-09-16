val prog =
  PROGRAM
    {decls=["a"],
     stmts=[ST_EXP {exp=EXP_NUM 2},ST_EXP {exp=EXP_NUM 4},
            ST_EXP {exp=EXP_STRING "Hello."},ST_EXP {exp=EXP_BOOL true},
            ST_EXP {exp=EXP_ID "undefined"},ST_EXP {exp=EXP_BOOL false},
            ST_EXP {exp=EXP_ID "a"}]} : program
;
