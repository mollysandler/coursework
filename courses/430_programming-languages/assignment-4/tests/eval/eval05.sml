val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_PRINT {exp=EXP_STRING "Hello, world."},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
