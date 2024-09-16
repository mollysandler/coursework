val prog =
  PROGRAM
    {decls=[("a",TY_INT),("b",TY_INT),("c",TY_INT),("d",TY_INT),("e",TY_INT),
            ("f",TY_INT),("g",TY_INT),("h",TY_INT)],func_decls=[],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 1},opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_PRINT {exp=EXP_ID "a"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "b"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "d",rhs=EXP_NONE}},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 4},opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "d",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_PRINT {exp=EXP_ID "c"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "d"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "f",rhs=EXP_NONE}},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "e",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 1},opr=BOP_OR,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "f",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_PRINT {exp=EXP_ID "e"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "f"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "g",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 9},opr=BOP_OR,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "h",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_PRINT {exp=EXP_ID "g"},ST_PRINT {exp=EXP_STRING ":n"},
            ST_PRINT {exp=EXP_ID "h"},ST_PRINT {exp=EXP_STRING ":n"}]}
  : program
;
