val prog =
  PROGRAM
    {classes=[],decls=["i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 100}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_PRINT {exp=EXP_ID "i"},
                              ST_PRINT {exp=EXP_STRING "\n"},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "i",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "i",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY
                       {lft=EXP_UNARY
                              {opnd=EXP_BINARY
                                      {lft=EXP_ID "i",opr=BOP_LT,
                                       rht=EXP_NUM 0},opr=UOP_NOT},
                        opr=BOP_AND,
                        rht=EXP_UNARY
                              {opnd=EXP_BINARY
                                      {lft=EXP_ID "i",opr=BOP_EQ,
                                       rht=EXP_NUM 0},opr=UOP_NOT}}}]}
  : program
;
