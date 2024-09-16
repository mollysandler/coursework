use "exceptions.sml";

open HashTable;
exception CannotFindIt;
val hash_fn : string->word = HashString.hashString;
val cmp_fn : string*string->bool = (op =);

(*done*)
fun typeof(exp: type'): string =
    case exp of
        TY_INT => "int"
      | TY_BOOL => "bool"
      | TY_STRING => "string"
      | TY_FUNC {in_types, ret_type} => 
        "(" ^ String.concatWith "*" (List.map typeof in_types) ^ " -> " ^ typeof ret_type ^ ")"
      | TY_NONE => "none"

(*done except equality*)
and evalBinary(tbl: (string, type') hash_table list, bin : {lft:expression, opr:binaryOperator, rht:expression}) =
    case bin of
        {opr = BOP_PLUS, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_INT
                | (TY_STRING, TY_STRING) => TY_STRING
                | (v1, v2) => raise AddException ((typeof(v1)), (typeof(v2))) )
        | {opr = BOP_MINUS, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_INT
                | (v1, v2) => raise ArithmeticException (BOP_MINUS, typeof(v1), typeof(v2)  ))
        | {opr = BOP_TIMES, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_INT
                | (v1, v2) => raise ArithmeticException (BOP_TIMES, typeof(v1), typeof(v2)  ))
        | {opr = BOP_DIVIDE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_INT
            | (v1, v2) => raise ArithmeticException (BOP_DIVIDE, typeof(v1), typeof(v2)))
        | {opr = BOP_MOD, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_INT
            | (v1, v2) => raise ArithmeticException (BOP_MOD, typeof(v1), typeof(v2)  ))
        | {opr = BOP_LT, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
            | (v1, v2) => raise RelationalException (BOP_LT, typeof(v1), typeof(v2) ))
        | {opr = BOP_GT, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
            | (v1, v2) => raise RelationalException (BOP_GT, typeof(v1), typeof(v2) ))
        | {opr = BOP_LE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
            | (v1, v2) => raise RelationalException (BOP_LE, typeof(v1), typeof(v2) ))
        | {opr = BOP_GE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
            | (v1, v2) => raise RelationalException (BOP_GE, typeof(v1), typeof(v2) ))
        | {opr = BOP_EQ, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
                | (TY_STRING, TY_STRING) => TY_BOOL
                | (TY_BOOL, TY_BOOL) => TY_BOOL
                | (TY_NONE, TY_NONE) => TY_BOOL
                | (TY_FUNC _ , TY_FUNC _) => TY_BOOL    
            | (v1, v2) => raise EqualityTypeException (BOP_EQ, typeof v1, typeof v2))
        | {opr = BOP_NE, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_INT, TY_INT) => TY_BOOL
                | (TY_STRING, TY_STRING) => TY_BOOL
                | (TY_BOOL, TY_BOOL) => TY_BOOL
                | (TY_NONE, TY_NONE) => TY_BOOL
                | (TY_FUNC _, TY_FUNC _ ) => TY_BOOL    
            | (v1, v2) => raise EqualityTypeException (BOP_NE, typeof v1, typeof v2))
         | {opr = BOP_AND, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_BOOL, TY_BOOL) => TY_BOOL  
                | (v1, v2) => raise BooleanException (BOP_AND, typeof v1, typeof v2))
         | {opr = BOP_OR, lft, rht} =>
            (case (evalExp (tbl, lft), evalExp (tbl, rht)) of
                (TY_BOOL, TY_BOOL) => TY_BOOL  
                | (v1, v2) => raise BooleanException (BOP_OR, typeof v1, typeof v2))

(*done*)
and evalUn(tbl: (string, type') hash_table list, un: {opr: unaryOperator, opnd: expression}) : type' = 
    case un of 
        {opr = UOP_NOT, opnd} => 
            (case evalExp(tbl, opnd) of 
                TY_BOOL => TY_BOOL
              | (v) => raise UnaryNotException(typeof(v)))

      | {opr = UOP_MINUS, opnd} => 
            (case evalExp(tbl, opnd) of 
                TY_INT => TY_INT
              | (v) => raise UnaryMinusException(typeof(v)))

(*done*)
and evalId(tbls: (string, type') hash_table list, id: string): type' =
    let
        fun findValueInTables [] = NONE
          | findValueInTables (tbl :: rest) =
                (case find tbl id of
                    NONE => findValueInTables rest
                  | SOME value => SOME value)
    in case findValueInTables tbls of
            NONE => raise UndeclaredVariableException id
          | SOME value => value end

and evalHelp(tbls: (string, type') hash_table list, key: string, value: type') = 
    case tbls of 
        [] => ()
        | (x::xs) => 
            (case find x key of
                NONE => evalHelp(xs, key, value)
                | SOME _ => (insert x (key, value); ()))

(*done*)
and evalAssign(tbls: (string, type') hash_table list, rules: {lhs: expression, rhs: expression}) : type' =
    case rules of
        {lhs, rhs} =>
        let
            val key = evalExp(tbls, lhs)
            val value = evalExp(tbls, rhs)
                    in 
                    if key = value then key
                    else raise AssignmentTypeException(typeof key, typeof value)
                    end
            (* let 
                val key = ident
                val value = evalExp(tbls, rhs)
                fun updateTable(tbl: (string, type') hash_table) =
                    insert tbl (key, value)
                    in evalHelp(tbls, key, value); value end *)
        (*| _ => raise AssignmentTargetException*)

(*done*)
and evalCond(tbl: (string, type') hash_table list, cond: {guard: expression, thenExp: expression, elseExp: expression}): type' =
   case cond of
    {guard, thenExp, elseExp} => 
        (case (evalExp (tbl, guard)) of 
            TY_BOOL => 
            let val first = evalExp(tbl, thenExp)
                val second = evalExp(tbl, elseExp) in 
                if first <> second then
                    raise ConditionalTypeException(typeof first, typeof second)
                else evalExp(tbl, thenExp)
                end 
            | (guard) => raise ConditionalException(typeof(guard)))

and evalAnon(tbls: (string, type') hash_table list, anon: function) : type' = 
    case anon of
        {params: decl list, decls: decl list, body: statement list, ret_type: type'} =>  
            let 
            val newState : (string, type') hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
            val paramTypes = paramHelper(tbls, params) 
            val funcType =  TY_FUNC{in_types = paramTypes, ret_type = ret_type}
            in 
                initState(newState, decls); 
                bindParams(newState::tbls, params);
                insert newState("return", ret_type);
                evalStatements(newState::tbls, body);
                
                if ret_type <> TY_NONE then 
                    check_last (newState::tbls, body)
                else();
                funcType
                end
 
and check_last(tbls: (string, type') hash_table list, stmts: statement list) = 
    case rev stmts of 
        [] => raise ReturnPathException
        | (x::xs) => 
            case x of
                ST_RETURN{exp} => 
                    (case exp of
                        SOME exp =>
                            let val return_type = evalExp(tbls, exp)
                            in 
                            if return_type <> evalExp(tbls, exp)
                                then raise ReturnTypeException (typeof return_type, typeof (lookup (hd tbls) "return"))
                            else ()
                            end )
            | _ => raise ReturnPathException

and evalArgs (tbl: (string, type') hash_table list, lst: expression list) = 
        List.map (fn exp => evalExp(tbl, exp)) lst

and evalCall(tbls: (string, type') hash_table list, call: {func: expression, args: expression list}) : type' = 
    case call of 
        {func, args} => 
            (case evalExp(tbls, func) of 
                TY_FUNC {in_types = in_types, ret_type = ret_type} => 
                    let
                        val argValues = evalArgs(tbls, args)
                        val newTbl : (string, type') hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)

                        (*check arg types and param types*)
                        fun bindArgsToParams([], [], newTbl) = newTbl
                          | bindArgsToParams(param::params, arg::args, newTbl) =
                                if param = arg then bindArgsToParams(params, args, newTbl)
                                else raise ArgumentException (typeof(arg), typeof(param)) 
                          | bindArgsToParams([], _, tbl) = raise CallTooManyArgumentsException
                          | bindArgsToParams(_, [], tbl) = raise CallTooFewArgumentsException

                        val updatedTbl = bindArgsToParams(in_types, argValues, newTbl)
                        in ret_type end
              | notAClosure => raise NonFunctionException (typeof notAClosure))

and evalExp(tbl: (string, type') hash_table list, exp: expression) : type' =
  case exp of 
  EXP_NONE => TY_NONE (*done*)
  | EXP_NUM v => TY_INT (*done*)
  | EXP_STRING s => TY_STRING (*done*)
  | EXP_BOOL b => TY_BOOL (*done*) 
  | EXP_BINARY bin => evalBinary (tbl, bin) (*done*)
  | EXP_UNARY un => evalUn (tbl, un) (*done*)
  | EXP_ID id => evalId (tbl, id) (*done*)
  | EXP_ASSIGN rules => evalAssign (tbl, rules) (*done*)
  | EXP_COND cond => evalCond (tbl, cond) (*done*)
  | EXP_CALL call => evalCall(tbl, call) (*done not returns*)
  | EXP_ANON anon => evalAnon(tbl, anon) (*done not returns*)

and paramHelper(tbl: (string, type') hash_table list, params: decl list) = 
    case params of
        [] => []
        | (x::xs) => 
            #2x::paramHelper(tbl, xs)

and bindParams(tbl: (string, type') hash_table list, params: decl list) = 
    case params of  
        [] => tbl 
        | ((identifier, stuff)::xs) => 
            (let val table = hd tbl
            val response = find table identifier
            in 
       ( case response of 
            SOME _ => raise VariableRedeclarationException identifier
            | NONE =>  insert table (identifier, stuff);
            bindParams(tbl, xs))
        end)

and evalStatements(tbl: (string, type') hash_table list, stmts: statement list) : unit =
  case stmts of
  [] => ()
  | x::xs => 
    (case x of 
        ST_EXP {exp} => 
            (evalExp(tbl, exp); evalStatements(tbl, xs))
        | ST_PRINT {exp} => 
            ((typeof(evalExp (tbl, exp))); evalStatements(tbl, xs))
        | ST_BLOCK {stmts} => 
           ( (evalStatements(tbl, stmts)); evalStatements(tbl, xs))
        | ST_IF {guard, th, el} =>
            let val guard_val = evalExp(tbl, guard) in
                (case guard_val of
                    TY_BOOL => (evalStatements(tbl, [th]);
                                (case el of
                                NONE => ()
                            | SOME stmt => evalStatements(tbl, [stmt])))
                    | (guard_val) => raise IfGuardException(typeof(guard_val))); evalStatements(tbl, xs)
            end
         | ST_WHILE {guard, body} =>
		     ((case (evalExp(tbl, guard)) of
		     	  TY_BOOL => (evalStatements(tbl, [body]))
			    | (guard) => raise WhileGuardException(typeof(guard))); evalStatements(tbl, xs))
        | ST_RETURN {exp = expOpt} =>
            (case tbl of
            [y] => raise ReturnOutsideFunctionException
            | y::ys => 
                let val look = lookup(hd tbl) "return"  in 
                    (case expOpt of
                        NONE => if look = TY_NONE then ()
                                else raise ReturnTypeException (typeof (look), typeof TY_NONE)
                        | SOME opt => 
                                if lookup (hd tbl) "return" = evalExp(tbl, opt) then ()
                                else raise ReturnTypeException (typeof (lookup (hd tbl) "return"), typeof TY_NONE))
                end))
and initState(tbl: (string, type') hash_table, decls: (string * type') list) : unit =
    case decls of 
        [] => ()
        | (s, ty) :: xs => 
            if not (inDomain (tbl) (s)) then 
                (insert tbl (s, ty);
                initState(tbl, xs))
            else raise VariableRedeclarationException(s)

and initFunctions(tbl: (string, type') hash_table list, func_decls: (string * function) list) : unit =  (*this is my main function*)
    case func_decls of
    [] => ()
    | ((identifier, stuff)::xs) => 
        let val paramTypes = paramHelper(tbl, #params(stuff))
        val decls = #decls(stuff)
        val body = #body(stuff)
        val ret_type = #ret_type(stuff)
        val tableOne = hd (tbl)
        in 
            case find tableOne identifier of
                NONE => 
                    let val func = TY_FUNC{in_types = paramTypes, ret_type = ret_type}
                        val newTable : (string, type') hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
                        (* val _ = insert tableOne ("return", ret_type) *)
                    in 
                        insert tableOne (identifier, func); initFunctions(tbl, xs);
                        initState(newTable, decls);
                        insert newTable ("return", ret_type);
                        evalStatements(bindParams(newTable::tbl, #params(stuff)), body)
                        end 
                | _ => raise VariableRedeclarationException identifier end

(*done*)
fun typecheck(PROGRAM {decls, func_decls, stmts} : program) =
    let 
        val tbl : (string, type') hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
        val _ = initState(tbl, decls)
        val _ = initFunctions([tbl], func_decls)
    in evalStatements ([tbl], stmts) end