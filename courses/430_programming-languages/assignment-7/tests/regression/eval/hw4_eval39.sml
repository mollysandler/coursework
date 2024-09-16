val prog =
  PROGRAM
    {classes=[],decls=[],funcs=[],
     stmts=[ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_NUM 1,opr=BOP_PLUS,
                                    rht=EXP_BINARY
                                          {lft=EXP_NUM 2,opr=BOP_TIMES,
                                           rht=EXP_NUM 3}},opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_UNARY
                                          {opnd=EXP_NUM 4,opr=UOP_MINUS},
                                    opr=BOP_DIVIDE,rht=EXP_NUM 2}},
                      opr=BOP_MINUS,
                      rht=EXP_UNARY {opnd=EXP_NUM 9,opr=UOP_MINUS}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_NUM 1,opr=BOP_PLUS,
                                           rht=EXP_NUM 2},opr=BOP_TIMES,
                                    rht=EXP_NUM 3},opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_UNARY
                                          {opnd=EXP_NUM 4,opr=UOP_MINUS},
                                    opr=BOP_DIVIDE,rht=EXP_NUM 2}},
                      opr=BOP_MINUS,
                      rht=EXP_UNARY {opnd=EXP_NUM 9,opr=UOP_MINUS}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_TIMES,
                                    rht=EXP_BINARY
                                          {lft=EXP_NUM 3,opr=BOP_PLUS,
                                           rht=EXP_BINARY
                                                 {lft=EXP_UNARY
                                                        {opnd=EXP_NUM 4,
                                                         opr=UOP_MINUS},
                                                  opr=BOP_DIVIDE,
                                                  rht=EXP_NUM 2}}}},
                      opr=BOP_MINUS,
                      rht=EXP_UNARY {opnd=EXP_NUM 9,opr=UOP_MINUS}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_TIMES,
                                    rht=EXP_BINARY
                                          {lft=EXP_BINARY
                                                 {lft=EXP_NUM 3,opr=BOP_PLUS,
                                                  rht=EXP_UNARY
                                                        {opnd=EXP_NUM 4,
                                                         opr=UOP_MINUS}},
                                           opr=BOP_DIVIDE,rht=EXP_NUM 2}}},
                      opr=BOP_MINUS,
                      rht=EXP_UNARY {opnd=EXP_NUM 9,opr=UOP_MINUS}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_NUM 1,opr=BOP_PLUS,
                             rht=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_TIMES,rht=EXP_NUM 3}},
                      opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_UNARY {opnd=EXP_NUM 4,opr=UOP_MINUS},
                             opr=BOP_DIVIDE,
                             rht=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_MINUS,
                                    rht=EXP_UNARY
                                          {opnd=EXP_NUM 9,opr=UOP_MINUS}}}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_NUM 1,opr=BOP_PLUS,
                      rht=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_NUM 2,opr=BOP_TIMES,
                                           rht=EXP_NUM 3},opr=BOP_PLUS,
                                    rht=EXP_UNARY
                                          {opnd=EXP_NUM 4,opr=UOP_MINUS}},
                             opr=BOP_DIVIDE,
                             rht=EXP_BINARY
                                   {lft=EXP_NUM 2,opr=BOP_MINUS,
                                    rht=EXP_UNARY
                                          {opnd=EXP_NUM 9,opr=UOP_MINUS}}}}},
            ST_PRINT {exp=EXP_STRING "\n"},
            ST_PRINT
              {exp=EXP_BINARY
                     {lft=EXP_BINARY
                            {lft=EXP_BINARY
                                   {lft=EXP_BINARY
                                          {lft=EXP_NUM 1,opr=BOP_PLUS,
                                           rht=EXP_NUM 2},opr=BOP_TIMES,
                                    rht=EXP_NUM 3},opr=BOP_PLUS,
                             rht=EXP_UNARY {opnd=EXP_NUM 4,opr=UOP_MINUS}},
                      opr=BOP_DIVIDE,
                      rht=EXP_BINARY
                            {lft=EXP_NUM 2,opr=BOP_MINUS,
                             rht=EXP_UNARY {opnd=EXP_NUM 9,opr=UOP_MINUS}}}},
            ST_PRINT {exp=EXP_STRING "\n"}]} : program
;
