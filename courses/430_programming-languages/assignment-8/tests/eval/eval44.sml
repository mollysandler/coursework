


val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_BLOCK
              {stmts=[ST_BLOCK {stmts=[ST_PRINT {exp=EXP_NUM 3}]},
                      ST_WHILE
                        {body=ST_BLOCK {stmts=[ST_PRINT {exp=EXP_NUM 3}]},
                         guard=EXP_BOOL false}]}]} : program

;
