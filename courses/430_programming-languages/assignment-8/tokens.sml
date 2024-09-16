datatype token =
     TK_LBRACE    (* { *)
   | TK_RBRACE    (* } *)
   | TK_LPAREN    (* ( *)
   | TK_RPAREN    (* ) *)
   | TK_COMMA     (* , *)
   | TK_SEMI      (* ; *)
   | TK_QUESTION  (* ? *)
   | TK_COLON     (* : *)
   | TK_PLUS      (* + *)
   | TK_MINUS     (* - *)
   | TK_TIMES     (* * *)
   | TK_DIVIDE    (* / *)
   | TK_MOD       (* % *)
   | TK_AND       (* && *)
   | TK_OR        (* || *)
   | TK_ASSIGN    (* = *)
   | TK_EQ        (* == *)
   | TK_LT        (* < *)
   | TK_LE        (* <= *)
   | TK_GT        (* > *)
   | TK_GE        (* >= *)
   | TK_NOT       (* ! *)
   | TK_NE        (* != *)
   | TK_ELSE      (* else *)
   | TK_FALSE     (* false *)
   | TK_IF        (* if *)
   | TK_PRINT     (* print *)
   | TK_TRUE      (* true *)
   | TK_NONE      (* none *)
   | TK_VAR       (* var *)
   | TK_WHILE     (* while *)
   | TK_DO        (* do *)
   | TK_NUM of int
   | TK_ID of string
   | TK_STRING of string
;
