val prog =
  PROGRAM
    {classes=[],decls=["i","long","k","n"],funcs=[],
     stmts=[ST_EXP {exp=EXP_ASSIGN {lhs=EXP_ID "i",rhs=EXP_NUM 25}},
            ST_EXP
              {exp=EXP_ASSIGN
                     {lhs=EXP_ID "long",
                      rhs=EXP_BINARY
                            {lft=EXP_NUM 0,opr=BOP_MINUS,rht=EXP_NUM 1112}}},
            ST_WHILE
              {body=ST_BLOCK
                      {stmts=[ST_IF
                                {el=SOME
                                      (ST_BLOCK
                                         {stmts=[ST_IF
                                                   {el=SOME
                                                         (ST_BLOCK
                                                            {stmts=[ST_EXP
                                                                      {exp=EXP_ASSIGN
                                                                             {lhs=EXP_ID
                                                                                    "k",
                                                                              rhs=EXP_BINARY
                                                                                    {lft=EXP_NUM
                                                                                           10,
                                                                                     opr=BOP_MINUS,
                                                                                     rht=EXP_ID
                                                                                           "i"}}},
                                                                    ST_WHILE
                                                                      {body=ST_BLOCK
                                                                              {stmts=[ST_PRINT
                                                                                        {exp=EXP_ID
                                                                                               "k"},
                                                                                      ST_PRINT
                                                                                        {exp=EXP_STRING
                                                                                               "\n"},
                                                                                      ST_EXP
                                                                                        {exp=EXP_ASSIGN
                                                                                               {lhs=EXP_ID
                                                                                                      "k",
                                                                                                rhs=EXP_BINARY
                                                                                                      {lft=EXP_ID
                                                                                                             "k",
                                                                                                       opr=BOP_PLUS,
                                                                                                       rht=EXP_NUM
                                                                                                             1}}}]},
                                                                       guard=EXP_UNARY
                                                                               {opnd=EXP_UNARY
                                                                                       {opnd=EXP_BINARY
                                                                                               {lft=EXP_ID
                                                                                                      "k",
                                                                                                opr=BOP_NE,
                                                                                                rht=EXP_NUM
                                                                                                      0},
                                                                                        opr=UOP_NOT},
                                                                                opr=UOP_NOT}}]}),
                                                    guard=EXP_BINARY
                                                            {lft=EXP_NUM 15,
                                                             opr=BOP_EQ,
                                                             rht=EXP_ID "i"},
                                                    th=ST_BLOCK
                                                         {stmts=[ST_EXP
                                                                   {exp=EXP_ASSIGN
                                                                          {lhs=EXP_ID
                                                                                 "k",
                                                                           rhs=EXP_BINARY
                                                                                 {lft=EXP_NUM
                                                                                        15,
                                                                                  opr=BOP_MINUS,
                                                                                  rht=EXP_ID
                                                                                        "i"}}},
                                                                 ST_EXP
                                                                   {exp=EXP_ASSIGN
                                                                          {lhs=EXP_ID
                                                                                 "n",
                                                                           rhs=EXP_NUM
                                                                                 5}},
                                                                 ST_IF
                                                                   {el=NONE,
                                                                    guard=EXP_BINARY
                                                                            {lft=EXP_ID
                                                                                   "k",
                                                                             opr=BOP_NE,
                                                                             rht=EXP_NUM
                                                                                   0},
                                                                    th=ST_BLOCK
                                                                         {stmts=[ST_WHILE
                                                                                   {body=ST_BLOCK
                                                                                           {stmts=[ST_EXP
                                                                                                     {exp=EXP_ASSIGN
                                                                                                            {lhs=EXP_ID
                                                                                                                   "long",
                                                                                                             rhs=EXP_BINARY
                                                                                                                   {lft=EXP_NUM
                                                                                                                          10,
                                                                                                                    opr=BOP_TIMES,
                                                                                                                    rht=EXP_ID
                                                                                                                          "k"}}},
                                                                                                   ST_PRINT
                                                                                                     {exp=EXP_ID
                                                                                                            "long"},
                                                                                                   ST_PRINT
                                                                                                     {exp=EXP_STRING
                                                                                                            "\n"},
                                                                                                   ST_EXP
                                                                                                     {exp=EXP_ASSIGN
                                                                                                            {lhs=EXP_ID
                                                                                                                   "k",
                                                                                                             rhs=EXP_BINARY
                                                                                                                   {lft=EXP_ID
                                                                                                                          "k",
                                                                                                                    opr=BOP_PLUS,
                                                                                                                    rht=EXP_NUM
                                                                                                                          1}}}]},
                                                                                    guard=EXP_BINARY
                                                                                            {lft=EXP_ID
                                                                                                   "k",
                                                                                             opr=BOP_NE,
                                                                                             rht=EXP_NUM
                                                                                                   0}}]}},
                                                                 ST_WHILE
                                                                   {body=ST_BLOCK
                                                                           {stmts=[ST_PRINT
                                                                                     {exp=EXP_ID
                                                                                            "n"},
                                                                                   ST_PRINT
                                                                                     {exp=EXP_STRING
                                                                                            "\n"},
                                                                                   ST_EXP
                                                                                     {exp=EXP_ASSIGN
                                                                                            {lhs=EXP_ID
                                                                                                   "n",
                                                                                             rhs=EXP_NUM
                                                                                                   0}}]},
                                                                    guard=EXP_BINARY
                                                                            {lft=EXP_ID
                                                                                   "n",
                                                                             opr=BOP_NE,
                                                                             rht=EXP_NUM
                                                                                   0}},
                                                                 ST_PRINT
                                                                   {exp=EXP_ID
                                                                          "long"},
                                                                 ST_PRINT
                                                                   {exp=EXP_STRING
                                                                          "\n"}]}}]}),
                                 guard=EXP_BINARY
                                         {lft=EXP_NUM 20,opr=BOP_EQ,
                                          rht=EXP_ID "i"},
                                 th=ST_BLOCK
                                      {stmts=[ST_EXP
                                                {exp=EXP_ASSIGN
                                                       {lhs=EXP_ID "k",
                                                        rhs=EXP_BINARY
                                                              {lft=EXP_NUM 20,
                                                               opr=BOP_MINUS,
                                                               rht=EXP_ID "i"}}},
                                              ST_IF
                                                {el=NONE,
                                                 guard=EXP_BINARY
                                                         {lft=EXP_ID "k",
                                                          opr=BOP_NE,
                                                          rht=EXP_NUM 0},
                                                 th=ST_BLOCK
                                                      {stmts=[ST_WHILE
                                                                {body=ST_BLOCK
                                                                        {stmts=[ST_PRINT
                                                                                  {exp=EXP_ID
                                                                                         "k"},
                                                                                ST_PRINT
                                                                                  {exp=EXP_STRING
                                                                                         "\n"},
                                                                                ST_EXP
                                                                                  {exp=EXP_ASSIGN
                                                                                         {lhs=EXP_ID
                                                                                                "k",
                                                                                          rhs=EXP_BINARY
                                                                                                {lft=EXP_ID
                                                                                                       "k",
                                                                                                 opr=BOP_PLUS,
                                                                                                 rht=EXP_NUM
                                                                                                       1}}}]},
                                                                 guard=EXP_BINARY
                                                                         {lft=EXP_ID
                                                                                "k",
                                                                          opr=BOP_NE,
                                                                          rht=EXP_NUM
                                                                                0}}]}}]}},
                              ST_EXP
                                {exp=EXP_ASSIGN
                                       {lhs=EXP_ID "i",
                                        rhs=EXP_BINARY
                                              {lft=EXP_ID "i",opr=BOP_MINUS,
                                               rht=EXP_NUM 1}}}]},
               guard=EXP_BINARY {lft=EXP_NUM 10,opr=BOP_NE,rht=EXP_ID "i"}},
            ST_PRINT {exp=EXP_ID "i"},ST_PRINT {exp=EXP_STRING "\n"}]}
  : program
;
