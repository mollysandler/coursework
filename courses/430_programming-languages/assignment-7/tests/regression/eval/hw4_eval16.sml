val prog =
  PROGRAM
    {classes=[],decls=["id","foo"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "id",rhs=EXP_NUM 3}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "foo",rhs=EXP_NUM 5}},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "id",opr=BOP_GE,rht=EXP_ID "foo"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY {lft=EXP_ID "id",opr=BOP_LE,rht=EXP_ID "foo"}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "id",opr=BOP_LE,rht=EXP_ID "foo"},
                      opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ID "foo",opr=BOP_LE,rht=EXP_NUM 22}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "id",opr=BOP_LE,rht=EXP_ID "foo"},
                      opr=BOP_AND,
                      rht=EXP_BINARY
                            {lft=EXP_ID "foo",opr=BOP_GT,rht=EXP_NUM 22}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_ID "id",opr=BOP_LT,rht=EXP_ID "foo"},
                      opr=BOP_OR,
                      rht=EXP_BINARY
                            {lft=EXP_ID "foo",opr=BOP_GT,rht=EXP_NUM 10}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
