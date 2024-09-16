val prog =
  PROGRAM
    {decls=[("i",TY_INT)],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 999}},
                         ST_PRINT {exp=EXP_ID "i"},
                         ST_PRINT {exp=EXP_STRING ":n"},
                         ST_IF
                           {el=NONE,
                            guard=EXP_BINARY
                                    {lft=EXP_ID "n",opr=BOP_GT,rht=EXP_NUM 0},
                            th=ST_BLOCK
                                 {stmts=[ST_EXP
                                           {exp=EXP_CALL
                                                  {args=[EXP_ID "n"],
                                                   func=EXP_ID "g"}}]}},
                         ST_PRINT {exp=EXP_ID "i"},
                         ST_PRINT {exp=EXP_STRING ":n"}],decls=[("i",TY_INT)],
                   params=[("n",TY_INT)],ret_type=TY_NONE}),
                 ("g",
                  {body=[ST_PRINT {exp=EXP_ID "i"},
                         ST_PRINT {exp=EXP_STRING ":n"},
                         ST_EXP
                           {exp=EXP_CALL {args=[EXP_ID "n"],func=EXP_ID "h"}}],
                   decls=[],params=[("n",TY_INT)],ret_type=TY_NONE}),
                 ("h",
                  {body=[ST_EXP
                           {exp=EXP_CALL {args=[EXP_ID "n"],func=EXP_ID "j"}}],
                   decls=[],params=[("n",TY_INT)],ret_type=TY_NONE}),
                 ("j",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN {lhs=EXP_ID "j",rhs=EXP_NUM 17}},
                         ST_EXP
                           {exp=EXP_CALL {args=[EXP_ID "n"],func=EXP_ID "k"}},
                         ST_PRINT {exp=EXP_ID "j"},
                         ST_PRINT {exp=EXP_STRING ":n"}],decls=[("j",TY_INT)],
                   params=[("n",TY_INT)],ret_type=TY_NONE}),
                 ("k",
                  {body=[ST_EXP
                           {exp=EXP_CALL
                                  {args=[EXP_BINARY
                                           {lft=EXP_ID "n",opr=BOP_MINUS,
                                            rht=EXP_NUM 1}],func=EXP_ID "f"}}],
                   decls=[],params=[("n",TY_INT)],ret_type=TY_NONE})],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 3}},
            ST_EXP {exp=EXP_CALL {args=[EXP_NUM 3],func=EXP_ID "f"}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
