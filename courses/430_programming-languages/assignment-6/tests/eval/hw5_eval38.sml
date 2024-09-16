val prog =
  PROGRAM
    {decls=[("odds",TY_FUNC {in_types=[],ret_type=TY_INT}),
            ("odd",TY_FUNC {in_types=[TY_INT],ret_type=TY_BOOL})],
     func_decls=[("f",
                  {body=[ST_EXP
                           {exp=EXP_ASSIGN
                                  {lhs=EXP_ID "counter",
                                   rhs=EXP_ANON
                                         {body=[ST_EXP
                                                  {exp=EXP_ASSIGN
                                                         {lhs=EXP_ID "tmp",
                                                          rhs=EXP_ID "x"}},
                                                ST_EXP
                                                  {exp=EXP_ASSIGN
                                                         {lhs=EXP_ID "x",
                                                          rhs=EXP_BINARY
                                                                {lft=EXP_ID
                                                                       "x",
                                                                 opr=BOP_PLUS,
                                                                 rht=EXP_NUM 1}}},
                                                ST_RETURN
                                                  {exp=SOME (EXP_ID "tmp")}],
                                          decls=[],params=[],ret_type=TY_INT}}},
                         ST_RETURN {exp=SOME (EXP_ID "counter")}],
                   decls=[("tmp",TY_INT),
                          ("counter",TY_FUNC {in_types=[],ret_type=TY_INT})],
                   params=[("x",TY_INT)],
                   ret_type=TY_FUNC {in_types=[],ret_type=TY_INT}}),
                 ("filter",
                  {body=[ST_RETURN
                           {exp=SOME
                                  (EXP_ANON
                                     {body=[ST_EXP
                                              {exp=EXP_ASSIGN
                                                     {lhs=EXP_ID "tmp",
                                                      rhs=EXP_CALL
                                                            {args=[],
                                                             func=EXP_ID "gen"}}},
                                            ST_WHILE
                                              {body=ST_BLOCK
                                                      {stmts=[ST_EXP
                                                                {exp=EXP_ASSIGN
                                                                       {lhs=EXP_ID
                                                                              "tmp",
                                                                        rhs=EXP_CALL
                                                                              {args=[],
                                                                               func=EXP_ID
                                                                                      "gen"}}}]},
                                               guard=EXP_UNARY
                                                       {opnd=EXP_CALL
                                                               {args=[EXP_ID
                                                                        "tmp"],
                                                                func=EXP_ID
                                                                       "filt"},
                                                        opr=UOP_NOT}},
                                            ST_RETURN
                                              {exp=SOME (EXP_ID "tmp")}],
                                      decls=[("tmp",TY_INT)],params=[],
                                      ret_type=TY_INT})}],decls=[],
                   params=[("filt",
                            TY_FUNC {in_types=[TY_INT],ret_type=TY_BOOL}),
                           ("gen",TY_FUNC {in_types=[],ret_type=TY_INT})],
                   ret_type=TY_FUNC {in_types=[],ret_type=TY_INT}})],
     stmts=[ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "odd",
                      rhs=EXP_ANON
                            {body=[ST_RETURN
                                     {exp=SOME
                                            (EXP_BINARY
                                               {lft=EXP_BINARY
                                                      {lft=EXP_ID "x",
                                                       opr=BOP_MOD,
                                                       rht=EXP_NUM 2},
                                                opr=BOP_EQ,rht=EXP_NUM 1})}],
                             decls=[],params=[("x",TY_INT)],ret_type=TY_BOOL}}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "odds",
                      rhs=EXP_CALL
                            {args=[EXP_ID "odd",
                                   EXP_CALL {args=[EXP_NUM 1],func=EXP_ID "f"}],
                             func=EXP_ID "filter"}}},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_CALL {args=[],func=EXP_ID "odds"}},
            ST_PRINT {exp=EXP_STRING ":n"}]} : program
;
