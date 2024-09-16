val prog =
  PROGRAM
    {decls=["a","b","c","d","e","f","g","h"],
     stmts=[ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "a",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 1},opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "b",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_EXP {exp=EXP_ID "a"},ST_EXP {exp=EXP_ID "b"},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "c",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 4},opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "d",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_EXP {exp=EXP_ID "c"},ST_EXP {exp=EXP_ID "d"},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "e",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 1},opr=BOP_OR,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "f",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_EXP {exp=EXP_ID "e"},ST_EXP {exp=EXP_ID "f"},
            ST_EXP
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "g",rhs=EXP_NUM 2},
                             opr=BOP_GT,rht=EXP_NUM 9},opr=BOP_OR,
                      rht=EXP_BINARY
                            {lft=EXP_ASSIGN {lhs=EXP_ID "h",rhs=EXP_NUM 3},
                             opr=BOP_GT,rht=EXP_NUM 2}}},
            ST_EXP {exp=EXP_ID "g"},ST_EXP {exp=EXP_ID "h"}]} : program
;
