val prog =
  PROGRAM
    {decls=[],
     func_decls=[("f",{body=[],decls=[],params=[],ret_type=TY_NONE})],
     stmts=[ST_PRINT {exp=EXP_ID "f"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT
              {exp=EXP_ANON {body=[],decls=[],params=[],ret_type=TY_NONE}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
