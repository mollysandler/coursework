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
      | CLOSURE_VAL _ => "function"
      | OBJECT_VAL _ => "object"
      | METHOD_VAL _ => "method"
      | NONE_VAL => "none"

and convToString (exp: value) = 
  case exp of 
    INT_VAL n =>
        if n >= 0 then Int.toString n 
        else "-" ^ Int.toString (n * ~1)
    | BOOL_VAL b => Bool.toString(b)
    | STRING_VAL s => s
    | CLOSURE_VAL v => "function"
    | OBJECT_VAL _ => "object"
    | METHOD_VAL _ => "method"
    | NONE_VAL => "none"

and evalBinary(tbl: (string, value) hash_table list, bin : {lft: expression, opr: binaryOperator, rht: expression}, classTbl: (string, (string, value) hash_table) hash_table) =
    case bin of
        {opr = BOP_PLUS, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 + v2)
                | (STRING_VAL v1, STRING_VAL v2) => STRING_VAL (v1 ^ v2)
                | (v1, v2) => raise AddException ((typeof(v1)), (typeof(v2))) )
        | {opr = BOP_MINUS, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 - v2)
                | (v1, v2) => raise ArithmeticException (BOP_MINUS, typeof(v1), typeof(v2)  ))
        | {opr = BOP_TIMES, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => INT_VAL (v1 * v2)
                | (v1, v2) => raise ArithmeticException (BOP_TIMES, typeof(v1), typeof(v2)  ))
        | {opr = BOP_DIVIDE, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => 
                    if v2 <> 0 then
                        INT_VAL (v1 div v2)
                    else
                        raise ZeroDivideException
            | (v1, v2) => raise ArithmeticException (BOP_DIVIDE, typeof(v1), typeof(v2)  ))
        | {opr = BOP_MOD, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => 
                    if v2 <> 0 then
                        INT_VAL (v1 mod v2)
                    else
                        raise ZeroDivideException
            | (v1, v2) => raise ArithmeticException (BOP_MOD, typeof(v1), typeof(v2)  ))
        | {opr = BOP_LT, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 < v2)
            | (v1, v2) => raise RelationalException (BOP_LT, typeof(v1), typeof(v2) ))
        | {opr = BOP_GT, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 > v2)
            | (v1, v2) => raise RelationalException (BOP_GT, typeof(v1), typeof(v2) ))
        | {opr = BOP_LE, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 <= v2)
            | (v1, v2) => raise RelationalException (BOP_LE, typeof(v1), typeof(v2) ))
        | {opr = BOP_GE, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 >= v2)
            | (v1, v2 )=> raise RelationalException (BOP_GE, typeof(v1), typeof(v2) ))
        | {opr = BOP_EQ, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 = v2)
                | (STRING_VAL v1, STRING_VAL v2) => BOOL_VAL (v1 = v2)
                | (BOOL_VAL v1, BOOL_VAL v2) => BOOL_VAL (v1 = v2)
                | (NONE_VAL, NONE_VAL) => BOOL_VAL true
                | (CLOSURE_VAL {uniqueRef = ref1, ...}, CLOSURE_VAL {uniqueRef = ref2, ...}) =>
                    BOOL_VAL (ref1 = ref2)     
                | (OBJECT_VAL {uniqueRef = ref1, ...}, OBJECT_VAL {uniqueRef = ref2, ...}) =>
                        BOOL_VAL (ref1 = ref2)    
                | (METHOD_VAL {object = obj1, closure = cls1}, METHOD_VAL {object = obj2, closure = cls2}) =>
                        (case (obj1, obj2) of
                            (OBJECT_VAL {uniqueRef = ref1, ...}, OBJECT_VAL {uniqueRef = ref2, ...}) =>
                            BOOL_VAL (ref1 = ref2))
            | (v1, v2) => BOOL_VAL false)
        | {opr = BOP_NE, lft, rht} =>
            (case (evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table), evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table)) of
                (INT_VAL v1, INT_VAL v2) => BOOL_VAL (v1 <> v2)
                | (STRING_VAL v1, STRING_VAL v2) => BOOL_VAL (v1 <> v2)
                | (BOOL_VAL v1, BOOL_VAL v2) => BOOL_VAL (v1 <> v2)
                | (NONE_VAL, NONE_VAL) => BOOL_VAL false
                | (CLOSURE_VAL {uniqueRef = ref1, ...}, CLOSURE_VAL {uniqueRef = ref2, ...}) =>
                    BOOL_VAL (ref1 <> ref2)
                | (OBJECT_VAL {uniqueRef = ref1, ...}, OBJECT_VAL {uniqueRef = ref2, ...}) =>
                        BOOL_VAL (ref1 <> ref2)  
                | (METHOD_VAL {object = obj1, closure = cls1}, METHOD_VAL {object = obj2, closure = cls2}) =>
                        (case (obj1, obj2) of
                            (OBJECT_VAL {uniqueRef = ref1, ...}, OBJECT_VAL {uniqueRef = ref2, ...}) =>
                            BOOL_VAL (ref1 <> ref2))
            | (v1, v2) => BOOL_VAL true)
        | {opr = BOP_AND, lft, rht} =>
            (case evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table) of
                BOOL_VAL v1 =>
                    if v1 = true then
                        (case evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table) of
                            BOOL_VAL v2 => BOOL_VAL v2
                        | (v2) => raise BooleanSecondException (BOP_AND, typeof(v2) ))
                    else
                        BOOL_VAL false
            | (v1) => raise BooleanFirstException(BOP_AND, typeof(v1)))
        | {opr = BOP_OR, lft, rht} =>
            (case evalExp (tbl, lft, classTbl: (string, (string, value) hash_table) hash_table) of
                BOOL_VAL v1 =>
                    if v1 = false then
                        (case evalExp (tbl, rht, classTbl: (string, (string, value) hash_table) hash_table) of
                            BOOL_VAL v2 => BOOL_VAL v2
                        | (v2) => raise BooleanSecondException (BOP_OR, typeof(v2) ))
                    else
                        BOOL_VAL true
            | (v1) => raise BooleanFirstException(BOP_OR, typeof(v1)))

and evalUn (tbl: (string, value) hash_table list, un: {opr: unaryOperator, opnd: expression}, classTbl: (string, (string, value) hash_table) hash_table) = 
    case un of
    {opr = UOP_NOT, opnd} => 
        (case (evalExp (tbl, opnd, classTbl: (string, (string, value) hash_table) hash_table)) of 
            (BOOL_VAL opnd) => BOOL_VAL(not opnd)
            | (opnd) => raise UnaryNotException(typeof(opnd)))
    | {opr = UOP_MINUS, opnd} => 
        (case (evalExp (tbl, opnd, classTbl: (string, (string, value) hash_table) hash_table)) of 
            (INT_VAL opnd) => INT_VAL(~opnd)
            | (opnd) => raise UnaryMinusException(typeof(opnd)))

and evalCond(tbl: (string, value) hash_table list, cond: {guard: expression, thenExp: expression, elseExp: expression}, classTbl: (string, (string, value) hash_table) hash_table): value =
   case cond of
    {guard, thenExp, elseExp} => 
        (case (evalExp (tbl, guard, classTbl: (string, (string, value) hash_table) hash_table)) of 
            (BOOL_VAL true) => evalExp(tbl, thenExp, classTbl: (string, (string, value) hash_table) hash_table)
            | BOOL_VAL false => evalExp(tbl, elseExp, classTbl: (string, (string, value) hash_table) hash_table)
            | (guard) => raise ConditionalException(typeof(guard)))

and evalHelp(tbls: (string, value) hash_table list, key: string, value: value) = 
    case tbls of 
        [] => ()
        | (x::xs) => 
            (case find x key of
                    NONE => evalHelp(xs, key, value)
                  | SOME _ => insert x (key, value))

and evalAssign(tbls: (string, value) hash_table list, rules: {lhs: expression, rhs: expression}, classTbl: (string, (string, value) hash_table) hash_table) : value =
    case rules of
        {lhs = EXP_ID ident, rhs} =>
            let 
                val key = ident
                val value = evalExp(tbls, rhs, classTbl: (string, (string, value) hash_table) hash_table)
                fun updateTable(tbl: (string, value) hash_table) =
                    insert tbl (key, value)
                    in evalHelp(tbls, key, value); value end
        | {lhs = EXP_DOT {obj, field}, rhs} =>
              case evalExp(tbls, obj, classTbl) of
                    obj as OBJECT_VAL {class, uniqueRef} => 
                    let 
                        val right = evalExp(tbls, rhs, classTbl)
                        val fieldname = find (class) (field)
                    in
                        (case (fieldname) of
                        SOME v => 
                            (insert class (field, right); right )     
                        | NONE => raise FieldNotFoundException (field)                       
                        )
                    end
                    (* | objVal  => raise FieldGetNonObjectException (field, typeof objVal) *)
    | _ => raise AssignmentTargetException

and evalDot(tbls: (string, value) hash_table list, set: {obj: expression, field: string}, classTbl: (string, (string, value) hash_table) hash_table) : value =
    case evalExp(tbls, #obj set, classTbl) of
                    obj as OBJECT_VAL {class, uniqueRef} => 
                    let 
                        val fieldname = find (class) (#field set)
                    in
                        (case (fieldname) of
                        SOME v => 
                            (case v of 
                                c as CLOSURE_VAL _ =>
                                    METHOD_VAL {object = obj, closure = c}
                                | _ => v )
                        | NONE => raise FieldNotFoundException (#field set))
                    end
                | _ => raise FieldGetNonObjectException (#field set, typeof (evalExp(tbls, #obj set, classTbl)))

and evalId(tbls: (string, value) hash_table list, id: string, classTbl: (string, (string, value) hash_table) hash_table): value =
    let
        fun findValueInTables [] = NONE
          | findValueInTables (tbl :: rest) =
                (case find tbl id of
                    NONE => findValueInTables rest
                  | SOME value => SOME value)
    in case findValueInTables tbls of
            NONE => raise UndeclaredVariableException id
          | SOME value => value end

and evalArgs (tbl: (string, value) hash_table list, lst: expression list, classTbl: (string, (string, value) hash_table) hash_table) = 
        List.map (fn exp => evalExp(tbl, exp, classTbl: (string, (string, value) hash_table) hash_table)) lst

and evalCall(tbls: (string, value) hash_table list, call: {func: expression, args: expression list}, classTbl: (string, (string, value) hash_table) hash_table) : value = 
    case call of 
        {func, args} => 
            (case evalExp(tbls, func, classTbl: (string, (string, value) hash_table) hash_table) of 
                CLOSURE_VAL {tbl, code = {body, decls, params}, uniqueRef} => 
                    let
                        val argValues = evalArgs(tbls, args, classTbl: (string, (string, value) hash_table) hash_table)
                        val newTbl : (string, value) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
                        (*bind arguments to formal parameters*)
                        fun bindArgsToParams([], [], newTbl) = newTbl
                          | bindArgsToParams(param::params, arg::args, newTbl) =
                                if (inDomain (newTbl) param) then raise VariableRedeclarationException param
                                else let val _ = insert newTbl (param, arg)
                                in  bindArgsToParams(params, args, newTbl) end
                          | bindArgsToParams([], _, tbl) = raise CallTooManyArgumentsException
                          | bindArgsToParams(_, [], tbl) = raise CallTooFewArgumentsException

                        val updatedTbl = bindArgsToParams(params, argValues, newTbl)
                        val _ = initState(updatedTbl, decls)
                        (*eval function with new local scope table*)
                        val result = evalStatements(updatedTbl::tbl, body, classTbl: (string, (string, value) hash_table) hash_table)
                        val returnValue = 
                            if Option.isSome (find updatedTbl "return") then evalId([updatedTbl], "return", classTbl: (string, (string, value) hash_table) hash_table) 
                            else NONE_VAL
                    in returnValue end
              | METHOD_VAL {object, closure = CLOSURE_VAL {tbl, code = {body, decls, params}, uniqueRef}} => 
                    let
                        val argValues = evalArgs(tbls, args, classTbl: (string, (string, value) hash_table) hash_table)
                        val newTbl : (string, value) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
                        (*bind arguments to formal parameters*)
                        fun bindArgsToParams([], [], newTbl) = newTbl
                          | bindArgsToParams(param::params, arg::args, newTbl) =
                                if (inDomain (newTbl) param) then raise VariableRedeclarationException param
                                else let val _ = insert newTbl (param, arg)
                                in  bindArgsToParams(params, args, newTbl) end
                          | bindArgsToParams([], _, tbl) = raise CallTooManyArgumentsException
                          | bindArgsToParams(_, [], tbl) = raise CallTooFewArgumentsException

                        val updatedTbl = bindArgsToParams(params, argValues, newTbl)
                        val _ = insert updatedTbl ("this", object)
                        val _ = initState(updatedTbl, decls)
                        (*eval function with new local scope table*)
                        val result = evalStatements(updatedTbl::tbl, body, classTbl: (string, (string, value) hash_table) hash_table)
                        val returnValue = 
                            if Option.isSome (find updatedTbl "return") then evalId([updatedTbl], "return", classTbl: (string, (string, value) hash_table) hash_table) 
                            else NONE_VAL
                    in returnValue end
              | notAClosure => raise NonFunctionException (typeof notAClosure))

and evalAnon(tbls: (string, value) hash_table list, anon: function, classTbl: (string, (string, value) hash_table) hash_table) : value = 
    case anon of
        {body, decls, params} =>  
            let val uniqueRef = ref ()
            in CLOSURE_VAL {tbl = tbls, code = {body = body, decls = decls, params = params}, uniqueRef = uniqueRef}
            end

and evalNew(tbl: (string, value) hash_table list, classname: {class: string}, classTable: (string, (string, value) hash_table) hash_table) : value = 
    case classname of 
    {class} =>
            let 
            val value_found = (find (classTable) class)  in 
            (case value_found of
                SOME v => 
                    let 
                    val new_hashtable = copy v 
                    val uniqueRef = ref() 
                    in 
                    OBJECT_VAL{class = new_hashtable, uniqueRef = uniqueRef}
                    end 
                | NONE => raise NewException(class)) 
            end

(* and evalThis(tbl: (string, value) hash_table list, classname: {class: string}, classTable: (string, (string, value) hash_table) hash_table) : value = 
    idrk what to even put in here  *)

and evalExp(tbl: (string, value) hash_table list, exp: expression, classTbl: (string, (string, value) hash_table) hash_table) : value=
  case exp of 
  EXP_NONE => NONE_VAL
  | EXP_NUM v => INT_VAL v
  | EXP_STRING s => STRING_VAL s
  | EXP_BOOL b => BOOL_VAL b
  | EXP_BINARY bin => evalBinary (tbl, bin, classTbl)
  | EXP_UNARY un => evalUn (tbl, un, classTbl)
  | EXP_ID id => evalId (tbl, id, classTbl)
  | EXP_ASSIGN rules => evalAssign (tbl, rules, classTbl)
  | EXP_COND cond => evalCond (tbl, cond, classTbl) 
  | EXP_CALL call => evalCall(tbl, call, classTbl) (*might have to call split*)
  | EXP_ANON anon => evalAnon(tbl, anon, classTbl)
  | EXP_NEW classname => evalNew(tbl, classname, classTbl)
  | EXP_DOT set => evalDot(tbl, set, classTbl)
  | EXP_THIS => evalId (tbl, "this", classTbl)

and evalStatements(tbl: (string, value) hash_table list, stmts: statement list, classTbl: (string, (string, value) hash_table) hash_table) : unit =
  case stmts of
  [] => ()
  | x::xs => 
    (case x of 
        ST_EXP {exp} => 
            (evalExp(tbl, exp, classTbl: (string, (string, value) hash_table) hash_table); if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table))
        | ST_PRINT {exp} => 
            (print(convToString(evalExp (tbl, exp, classTbl: (string, (string, value) hash_table) hash_table))); if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table))
        | ST_BLOCK {stmts} => 
           ( (evalStatements(tbl, stmts, classTbl: (string, (string, value) hash_table) hash_table)); if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table))
        | ST_IF {guard, th, el} =>
            let val guard_val = evalExp(tbl, guard, classTbl: (string, (string, value) hash_table) hash_table) in
                (case guard_val of
                    BOOL_VAL true => if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, [th], classTbl: (string, (string, value) hash_table) hash_table)
                    | BOOL_VAL false =>
                            (case el of
                                NONE => ()
                            | SOME stmt => if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, [stmt], classTbl: (string, (string, value) hash_table) hash_table))
                    | (guard_val) => raise IfGuardException(typeof(guard_val)));
                evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table)
            end
         | ST_WHILE {guard, body} =>
		     ((case (evalExp(tbl, guard, classTbl: (string, (string, value) hash_table) hash_table)) of
		     	  BOOL_VAL true => (evalStatements(tbl, [body], classTbl: (string, (string, value) hash_table) hash_table); if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, [x], classTbl: (string, (string, value) hash_table) hash_table))
			    | BOOL_VAL false => if (inDomain(hd tbl) ("return")) then () else evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table)
			    | (guard) => raise WhileGuardException(typeof(guard))); 
                evalStatements(tbl, xs, classTbl: (string, (string, value) hash_table) hash_table))
        | ST_RETURN {exp = expOpt} =>
            case tbl of
                [x] => raise ReturnOutsideFunctionException
                | x::xs => 
                    (case expOpt of
                        NONE => insert (hd tbl) ("return", (NONE_VAL))
                        | SOME exp => insert (hd tbl) ("return", (evalExp(tbl, exp, classTbl: (string, (string, value) hash_table) hash_table)))))

and initState(tbl: (string, value) hash_table, decls: string list) =
    case decls of 
        [] => EXP_NONE
        | s :: xs => 
            if not (inDomain (tbl) (s)) then 
                (insert tbl (s, NONE_VAL);
                initState(tbl, xs))
            else raise VariableRedeclarationException(s)

and initFuncState(tbl: (string, value) hash_table, curClass : (string, value) hash_table, func_decls: (string * function) list) =
    let  val uniqueRef = ref ()
    fun createClosureValue(code) = CLOSURE_VAL{tbl = [tbl], code = code, uniqueRef = uniqueRef} in 
    case func_decls of 
        [] => EXP_NONE
        | (identifier, code) :: xs => 
            if not (inDomain (curClass) (identifier)) then 
                (insert curClass (identifier, createClosureValue code);
                initFuncState(tbl, curClass, xs))
            else  raise VariableRedeclarationException(identifier) (*this is probs the wrong error, can fix later maybe*)
    end 

and initClasses(tbl: (string, value) hash_table, classTbl: (string, (string, value) hash_table) hash_table, classes: class list) =
    case classes of
        [] => EXP_NONE
        | ({name, super, decls, funcs}::xs) =>
            (case super of 
                SOME x => 
                    let val exists = (find classTbl x) in
                        (case exists of 
                            SOME v => 
                            let 
                                val curClass : (string, value) hash_table = copy v
                                val _ = initState(curClass, decls)
                                val _ = initFuncState(tbl, curClass, funcs)
                            in 
                                if not (inDomain (classTbl) (name)) then 
                                    (insert classTbl (name, curClass);
                                    initClasses(tbl, classTbl, xs))
                                else raise ClassRedeclarationException(name)
                                end 
                            | NONE => raise UnknownSuperException (name, x))
                        end
                | NONE => 
                    let 
                        val curClass : (string, value) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
                        val _ = initState(curClass, decls)
                        val _ = initFuncState(tbl, curClass, funcs)
                    in 
                        if not (inDomain (classTbl) (name)) then 
                            (insert classTbl (name, curClass);
                            initClasses(tbl, classTbl, xs))
                        else raise ClassRedeclarationException(name)
                    end)
fun evaluate(PROGRAM {classes, decls, funcs, stmts} : program) =
    let 
        val classTbl : (string, (string, value) hash_table) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
        val tbl : (string, value) hash_table = mkTable (hash_fn, cmp_fn) (0, CannotFindIt)
        val _ = initState(tbl, decls)
        val _ = initFuncState(tbl, tbl, funcs) 
        val _ = initClasses(tbl, classTbl, classes) 
    in evalStatements ([tbl], stmts, classTbl) end;
