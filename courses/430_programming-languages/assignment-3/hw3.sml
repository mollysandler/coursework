(*part 1*) 
datatype arith_expression =
  AE_NUM of int
 | AE_PLUS of arith_expression * arith_expression
 | AE_MINUS of arith_expression * arith_expression
 | AE_TIMES of arith_expression * arith_expression
 | AE_DIVIDE of arith_expression * arith_expression
;

fun arithInfixString (exp: arith_expression) = 
  case exp of 
    AE_NUM n => Int.toString(n)
    | AE_PLUS (e1, e2) => "(" ^ arithInfixString e1 ^ " + " ^ arithInfixString e2 ^ ")"
    | AE_MINUS (e1, e2) => "(" ^ arithInfixString e1 ^ " - " ^ arithInfixString e2 ^ ")"
    | AE_TIMES (e1, e2) => "(" ^ arithInfixString e1 ^ " * " ^ arithInfixString e2 ^ ")"
    | AE_DIVIDE (e1, e2) => "(" ^ arithInfixString e1 ^ " / " ^ arithInfixString e2 ^ ")"
;

fun arithPrefixString (exp: arith_expression) = 
  case exp of 
    AE_NUM n => Int.toString(n)
    | AE_PLUS (e1, e2) => "(" ^ "+ " ^ arithPrefixString e1  ^ " " ^ arithPrefixString e2 ^ ")"
    | AE_MINUS (e1, e2) => "(" ^ "- " ^ arithPrefixString e1 ^ " " ^  arithPrefixString e2 ^ ")"
    | AE_TIMES (e1, e2) => "(" ^ "* " ^ arithPrefixString e1 ^ " " ^ arithPrefixString e2 ^ ")"
    | AE_DIVIDE (e1, e2) => "("  ^ "/ " ^ arithPrefixString e1 ^ " " ^ arithPrefixString e2 ^ ")"
;

(*part 2*)
fun evalArith(exp: arith_expression) = 
  case exp of 
    AE_NUM n => n
    | AE_PLUS (e1, e2) => evalArith e1 + evalArith e2
    | AE_MINUS (e1, e2) => evalArith e1 - evalArith e2
    | AE_TIMES (e1, e2) => evalArith e1 * evalArith e2
    | AE_DIVIDE (e1, e2) => evalArith e1 div evalArith e2
;

(*part 3*)
datatype mixed_expression =
  ME_NUM of int
 | ME_PLUS of mixed_expression * mixed_expression
 | ME_TIMES of mixed_expression * mixed_expression
 | ME_LESSTHAN of mixed_expression * mixed_expression
;

datatype value  =
  ERROR_VAL
 | INT_VAL of int
 | BOOL_VAL of bool
;

fun evalMixed(exp: mixed_expression) =
  case exp of
    ME_NUM n => INT_VAL n
    | ME_PLUS (e1, e2) =>
      (case (evalMixed e1, evalMixed e2) of
        (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 + v2)
        | _ => ERROR_VAL)
    | ME_TIMES (e1, e2) =>
      (case (evalMixed e1, evalMixed e2) of
        (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 * v2)
        | _ => ERROR_VAL)
    | ME_LESSTHAN (e1, e2) =>
      (case (evalMixed e1, evalMixed e2) of
        (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 < v2)
        | _ => ERROR_VAL)
;

(*part 4*)
datatype var_expression =
  VE_NUM of int
 | VE_ID of string
 | VE_PLUS of var_expression * var_expression
 | VE_TIMES of var_expression * var_expression
;

fun simplifyIdentities(expr: var_expression) =
  case expr of
    VE_NUM n => VE_NUM n
    | VE_ID id => VE_ID id
    | VE_PLUS (left, right) =>
      let
        val left_simplified = simplifyIdentities left
        val right_simplified = simplifyIdentities right
        in if left_simplified = VE_NUM 0 then right_simplified
            else if right_simplified = VE_NUM 0 then left_simplified
            else VE_PLUS (left_simplified, right_simplified) end
    | VE_TIMES (left, right) =>
      let
        val left_simplified = simplifyIdentities left
        val right_simplified = simplifyIdentities right 
        in if left_simplified = VE_NUM 1 then right_simplified
            else if right_simplified = VE_NUM 1 then left_simplified
            else VE_TIMES (left_simplified, right_simplified) end
;

(*part 5*)
fun foldConstants (exp: var_expression)  =
  case exp of
    VE_NUM n => VE_NUM n 
    | VE_ID id => VE_ID id
    | VE_PLUS (e1, e2) => 
      let
        val folded_e1 = foldConstants e1
        val folded_e2 = foldConstants e2
      in
          case (folded_e1, folded_e2) of
            (VE_NUM n1, VE_NUM n2) => VE_NUM (n1 + n2)
            | _ => VE_PLUS (folded_e1, folded_e2)
      end
    | VE_TIMES (e1, e2) => 
      let
        val folded_e1 = foldConstants e1
        val folded_e2 = foldConstants e2
      in
        case (folded_e1, folded_e2) of
          (VE_NUM n1, VE_NUM n2) => VE_NUM (n1 * n2) 
          | _ => VE_TIMES (folded_e1, folded_e2)
      end
;
(*part 6*)
datatype operator =
  OP_PLUS
 | OP_TIMES
;

datatype expression =
  NUM of int
 | ID of string
 | BINARY of {opr:operator, lft:expression, rht:expression}
 | FUNCTION of {parameter:string, body: expression}
 | CALL of {func:expression, argument:expression}
;

fun gatherIdentifiers (exp: expression) =
  case exp of
    NUM _ => []
    | ID id => [id]
    | BINARY {lft, rht, ...} => gatherIdentifiers lft @ gatherIdentifiers rht
    | FUNCTION {parameter, body} => parameter :: gatherIdentifiers body
    | CALL {func, argument} => gatherIdentifiers func @ gatherIdentifiers argument;


(*part 7*)
fun freeVariables (exp: expression) =
    case exp of
      NUM _ => []
      | ID id => [id]
      | BINARY {lft, rht, ...} => freeVariables lft @ freeVariables rht
      | FUNCTION {parameter, body} => List.filter (fn id => id <> parameter) (freeVariables body)
      | CALL {func, argument} => freeVariables func @ freeVariables argument;

(*part 8*)
fun simpSubst (exp: expression) (target: string) (replacement: expression)  =
  case exp of
    NUM _ => exp
    | ID id => if id = target then replacement else exp
    | BINARY {opr, lft, rht} =>
        BINARY {opr = opr, lft = simpSubst lft target replacement, rht = simpSubst rht target replacement}
    | FUNCTION {parameter, body} =>
        FUNCTION {parameter = parameter, body = simpSubst body target replacement}
    | CALL {func, argument} =>
        CALL {func = simpSubst func target replacement, argument = simpSubst argument target replacement};

(*part 9*)
fun betterSubst (exp: expression) (target: string) (replacement: expression)  =
  case exp of
    NUM _ => exp
    | ID id => if id = target then replacement else exp
    | BINARY {opr, lft, rht} =>
        BINARY {opr = opr, lft = betterSubst lft target replacement, rht = betterSubst rht target replacement}
    | FUNCTION {parameter, body} =>
        if parameter = target then exp
        else FUNCTION {parameter = parameter, body = betterSubst body target replacement}
    | CALL {func, argument} =>
        CALL {func = betterSubst func target replacement, argument = betterSubst argument target replacement};

(*part 10*)
(*skipping because i should still get a 90 knock on wood*)