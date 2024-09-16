val prog =
  PROGRAM
    {classes=[],decls=["i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 20}},
            ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_COND
                                {elseExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_ID "i"},
                                 guard=EXP_BINARY
                                         {lft=EXP_ID "i",opr=BOP_EQ,
                                          rht=EXP_NUM 20},
                                 thenExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_NUM 5}},
                      guard=EXP_BINARY
                              {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
                      thenExp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 10}},
            ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_COND
                                {elseExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_ID "i"},
                                 guard=EXP_BINARY
                                         {lft=EXP_ID "i",opr=BOP_EQ,
                                          rht=EXP_NUM 20},
                                 thenExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_NUM 5}},
                      guard=EXP_BINARY
                              {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
                      thenExp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 40}},
            ST_EXP
              {exp=EXP_COND
                     {elseExp=EXP_COND
                                {elseExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_ID "i"},
                                 guard=EXP_BINARY
                                         {lft=EXP_ID "i",opr=BOP_EQ,
                                          rht=EXP_NUM 20},
                                 thenExp=EXP_ASSIGN
                                           {lhs=EXP_ID "i",rhs=EXP_NUM 5}},
                      guard=EXP_BINARY
                              {lft=EXP_ID "i",opr=BOP_EQ,rht=EXP_NUM 10},
                      thenExp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 15}}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
