val prog =
  PROGRAM
    {decls=["id"],
     stmts=[ST_PRINT {exp=EXP_ID "id"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
