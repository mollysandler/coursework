val prog =
  PROGRAM
    {decls=[("i",TY_INT)],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 2}},
                         ST_PRINT {exp=EXP_ID "i"},
                         ST_PRINT {exp=EXP_STRING ":n"}],decls=[("i",TY_INT)],
                   params=[("n",TY_INT)],ret_type=TY_NONE}),
                 ("g",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_ID "n"}},
                         ST_PRINT {exp=EXP_ID "i"},
                         ST_PRINT {exp=EXP_STRING ":n"}],decls=[],
                   params=[("n",TY_INT)],ret_type=TY_NONE})],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 3}},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 2],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 7],func=EXP_ID "g"}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
