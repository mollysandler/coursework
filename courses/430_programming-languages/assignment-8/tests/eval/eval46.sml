


val prog =
  PROGRAM
    {decls=[],
     stmts=[ST_BLOCK
              {stmts=[ST_BLOCK {stmts=[]},
                      ST_WHILE {body=ST_BLOCK {stmts=[]},guard=EXP_BOOL true}]}]}
  : program

;
