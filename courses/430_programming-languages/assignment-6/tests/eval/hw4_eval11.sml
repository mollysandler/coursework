val prog =
  PROGRAM
    {decls=[("id",TY_NONE)],func_decls=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "id",rhs=EXP_NONE}},
            ST_PRINT {exp=EXP_ID "id"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
