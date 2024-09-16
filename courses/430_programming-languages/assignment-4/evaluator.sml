use "exceptions.sml";

open HashTable;
exception CannotFindIt;
val hash_fn : string->word = HashString.hashString;
val cmp_fn : string*string->bool = (op =);

fun typeof(exp: value): string =
    case exp of
        INT_VAL _ => "number"
      | BOOL_VAL _ => "boolean"
      | STRING_VAL _ => "string"
      | NONE_VAL => "none"

and convToString (exp: value) = 
  case exp of 
    INT_VAL n =>
        if n >= 0 then Int.toString n 
        else "-" ^ Int.toString (n * ~1)
    | BOOL_VAL b => Bool.toString(b)
    | STRING_VAL s => s
    | NONE_VAL => "none"

and evalBinary(tbl: (string, value) hash_table, bin : {lft:expression, opr:binaryOperator, rht:expression}) =
    case bin of
        {opr = BOP_PLUS, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 + v2)
                | (STRING_VAL v1, STRING_VAL v2) => STRING_VAL (v1 ^ v2)
                | (v1, v2) => raise AddException ((typeof(v1)), (typeof(v2))) )
        | {opr = BOP_MINUS, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 - v2)
                | (v1, v2) => raise ArithmeticException (BOP_MINUS, typeof(v1), typeof(v2)  ))
        | {opr = BOP_TIMES, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 * v2)
                | (v1, v2) => raise ArithmeticException (BOP_TIMES, typeof(v1), typeof(v2)  ))
        | {opr = BOP_DIVIDE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => 
                    if v2 <> 0 then
                        INT_VAL (v1 div v2)
                    else
                        raise ZeroDivideException
            | (v1, v2) => raise ArithmeticException (BOP_DIVIDE, typeof(v1), typeof(v2)  ))
        | {opr = BOP_MOD, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => 
                    if v2 <> 0 then
                        INT_VAL (v1 mod v2)
                    else
                        raise ZeroDivideException
            | (v1, v2) => raise ArithmeticException (BOP_MOD, typeof(v1), typeof(v2)  ))
        | {opr = BOP_LT, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 < v2)
            | (v1, v2) => raise RelationalException (BOP_LT, typeof(v1), typeof(v2) ))
        | {opr = BOP_GT, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 > v2)
            | (v1, v2) => raise RelationalException (BOP_GT, typeof(v1), typeof(v2) ))
        | {opr = BOP_LE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 <= v2)
            | (v1, v2) => raise RelationalException (BOP_LE, typeof(v1), typeof(v2) ))
        | {opr = BOP_GE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 >= v2)
            | (v1, v2 )=> raise RelationalException (BOP_GE, typeof(v1), typeof(v2) ))
        | {opr = BOP_EQ, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 = v2)
                | (STRING_VAL v1, STRING_VAL v2) => BOOL_VAL (v1 = v2)
                | (BOOL_VAL v1, BOOL_VAL v2) => BOOL_VAL (v1 = v2)
                | (NONE_VAL, NONE_VAL) => BOOL_VAL true
            | (v1, v2) => BOOL_VAL false)
        | {opr = BOP_NE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 <> v2)
                | (STRING_VAL v1, STRING_VAL v2) => BOOL_VAL (v1 <> v2)
                | (BOOL_VAL v1, BOOL_VAL v2) => BOOL_VAL (v1 <> v2)
                | (NONE_VAL, NONE_VAL) => BOOL_VAL false
            | (v1, v2) => BOOL_VAL true)
        | {opr = BOP_AND, lft, rht} =>
            (case evalExp (tbl, lft) of
                BOOL_VAL v1 =>
                    if v1 = true then
                        (case evalExp (tbl, rht) of
                            BOOL_VAL v2 => BOOL_VAL v2
                        | (v2) => raise BooleanSecondException (BOP_AND, typeof(v2) ))
                    else
                        BOOL_VAL false
            | (v1) => raise BooleanFirstException(BOP_AND, typeof(v1)))

        | {opr = BOP_OR, lft, rht} =>
            (case evalExp (tbl, lft) of
                BOOL_VAL v1 =>
                    if v1 = false then
                        (case evalExp (tbl, rht) of
                            BOOL_VAL v2 => BOOL_VAL v2
                        | (v2) => raise BooleanSecondException (BOP_OR, typeof(v2) ))
                    else
                        BOOL_VAL true
            | (v1) => raise BooleanFirstException(BOP_OR, typeof(v1)))

and evalUn (tbl: (string, value) hash_table, un: {opr: unaryOperator, opnd: expression}) = 
    case un of
    {opr = UOP_NOT, opnd} => 
        (case (evalExp (tbl, opnd)) of 
            (BOOL_VAL opnd) => BOOL_VAL(not opnd)
            | (opnd) => raise UnaryNotException(typeof(opnd)))
    | {opr = UOP_MINUS, opnd} => 
        (case (evalExp (tbl, opnd)) of 
            (INT_VAL opnd) => INT_VAL(~opnd)
            | (opnd) => raise UnaryMinusException(typeof(opnd)))

and evalAssign(tbl: (string, value) hash_table, rules: {lhs: expression, rhs: expression}) : value =
    case rules of
        {lhs = EXP_ID ident, rhs} =>
            let val key = ident
                val value = evalExp(tbl, rhs)
            in (insert tbl (key, value); value) end
    | _ => raise AssignmentTargetException

and evalId(tbl: (string, value) hash_table, id: string): value =
    case find tbl id of
        NONE => raise UndeclaredVariableException(id)
        | SOME value => value

and evalCond(tbl: (string, value) hash_table, cond: {guard: expression, thenExp: expression, elseExp: expression}): value =
   case cond of
    {guard, thenExp, elseExp} => 
        (case (evalExp (tbl, guard)) of 
            (BOOL_VAL true) => evalExp(tbl, thenExp)
            | BOOL_VAL false => evalExp(tbl, elseExp)
            | (guard) => raise ConditionalException(typeof(guard)))

and evalExp(tbl: (string, value) hash_table, exp: expression)  =
  case exp of 
  EXP_NONE => NONE_VAL
  | EXP_NUM v => INT_VAL v
  | EXP_STRING s => STRING_VAL s
  | EXP_BOOL b => BOOL_VAL b
  | EXP_BINARY bin => evalBinary (tbl, bin)
  | EXP_UNARY un => evalUn (tbl, un)
  | EXP_ID id => evalId (tbl, id)
  | EXP_ASSIGN rules => evalAssign (tbl, rules)
  | EXP_COND cond => evalCond (tbl, cond) 

and evalStatements(tbl: (string, value) hash_table, stmts: statement list) =
  case stmts of
  [] => ()
  | x::xs => 
    (case x of 
        ST_EXP {exp} => 
            (evalExp(tbl, exp); evalStatements(tbl, xs))
        | ST_PRINT {exp} => 
            (print(convToString(evalExp (tbl, exp))); evalStatements(tbl, xs))
        | ST_BLOCK {stmts} => 
           ( (evalStatements(tbl, stmts)); evalStatements(tbl, xs))
        | ST_IF {guard, th, el} =>
            let val guard_val = evalExp(tbl, guard) in
                (case guard_val of
                    BOOL_VAL true => evalStatements(tbl, [th])
                    | BOOL_VAL false =>
                            (case el of
                                NONE => ()
                            | SOME stmt => evalStatements(tbl, [stmt]))
                    | (guard_val) => raise IfGuardException(typeof(guard_val)));
                evalStatements(tbl, xs)
            end
         | ST_WHILE {guard, body} =>
		     ((case (evalExp(tbl, guard)) of
		     	  BOOL_VAL true => (evalStatements(tbl, [body]); evalStatements(tbl, [x]))
			    | BOOL_VAL false => evalStatements(tbl, xs)
			    | (guard) => raise WhileGuardException(typeof(guard))); 
                evalStatements(tbl, xs)))

and initState(tbl: (string, value) hash_table, decls: string list) =
    case decls of 
        [] => EXP_NONE
        | s :: xs => 
            if not (inDomain (tbl) (s)) then 
                (insert tbl (s, NONE_VAL);
                initState(tbl, xs))
            else 
                raise VariableRedeclarationException(s)


and evaluate(PROGRAM {stmts, decls} : program)  =
    let val tbl : (string, value) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
    in (initState(tbl, decls); evalStatements (tbl, stmts)) end;