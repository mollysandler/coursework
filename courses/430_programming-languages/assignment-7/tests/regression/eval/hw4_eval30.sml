val prog =
  PROGRAM
    {classes=[],decls=["n","fact"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "n",rhs=EXP_NUM 5}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "fact",rhs=EXP_NUM 1}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "fact",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "fact",
                                               opr=BOP_TIMES,rht=EXP_ID "n"}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "n",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "n",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_ID "n",opr=BOP_NE,rht=EXP_NUM 0}},
            ST_PRINT {exp=EXP_ID "fact"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
