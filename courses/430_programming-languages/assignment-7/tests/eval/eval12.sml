val prog =
  PROGRAM
    {classes=[{decls=["value","next"],funcs=[],name="Node",super=NONE}],
     decls=["head","tmp","i"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 0}},
            ST_EXP
              {exp=EXP_ASSIGN {lhs=EXP_ID "head",rhs=EXP_NEW {class="Node"}}},
            ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "tmp",rhs=EXP_ID "head"}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="value",obj=EXP_ID "tmp"},
                                        rhs=EXP_ID "i"}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_DOT
                                              {field="next",obj=EXP_ID "tmp"},
                                        rhs=EXP_NEW {class="Node"}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "tmp",
                                        rhs=EXP_DOT
                                              {field="next",obj=EXP_ID "tmp"}}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "i",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "i",opr=BOP_PLUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_ID "i",opr=BOP_LT,rht=EXP_NUM 5}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_DOT {field="value",obj=EXP_ID "tmp"},
                      rhs=EXP_ID "i"}},
            ST_PRINT
              {exp=EXP_DOT
                     {field="value",
                      obj=EXP_DOT
                            {field="next",
                             obj=EXP_DOT
                                   {field="next",
                                    obj=EXP_DOT
                                          {field="next",
                                           obj=EXP_DOT
                                                 {field="next",
                                                  obj=EXP_DOT
                                                        {field="next",
                                                         obj=EXP_ID "head"}}}}}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
