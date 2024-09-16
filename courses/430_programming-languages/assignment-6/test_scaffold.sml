fun error message =
   TextIO.output (TextIO.stdErr, message ^ "\n")
;

fun binary_operator_string BOP_PLUS = "+"
  | binary_operator_string BOP_MINUS = "-"
  | binary_operator_string BOP_TIMES = "*"
  | binary_operator_string BOP_DIVIDE = "/"
  | binary_operator_string BOP_MOD = "%"
  | binary_operator_string BOP_EQ = "=="
  | binary_operator_string BOP_NE = "!="
  | binary_operator_string BOP_LT = "<"
  | binary_operator_string BOP_GT = ">"
  | binary_operator_string BOP_LE = "<="
  | binary_operator_string BOP_GE = ">="
  | binary_operator_string BOP_AND = "&&"
  | binary_operator_string BOP_OR = "||"
;

fun bool_first_type_error typ opr =
   error ("operator '" ^ (binary_operator_string opr) ^
      "' requires bool, found " ^ typ)
;

fun binary_type_error slft srht ltyp rtyp opr =
   error ("operator '" ^ (binary_operator_string opr) ^ "' requires " ^
      slft ^ " * " ^ srht ^ ", found " ^ ltyp ^ " * " ^ rtyp)
;

fun add_type_error ltyp rtyp =
   error ("operator '+' requires int * int or string * string" ^
      ", found " ^ ltyp ^ " * " ^ rtyp)
;

fun unary_type_error expected typ opr =
   error ("unary operator '" ^ opr ^ "' requires " ^
      expected ^ ", found " ^ typ)
;

fun cond_type_error typ =
   error ("boolean guard required for conditional expression, found " ^ typ)
;

fun if_type_error typ =
   error ("boolean guard required for 'if' statement, found " ^ typ)
;

fun while_type_error typ =
   error ("boolean guard required for 'while' statement, found " ^ typ)
;

fun return_type_error found expected =
   error ("cannot return value of type '" ^ found ^
      "' from function declared with type '" ^ expected ^ "'")
;

fun match_type_error construct t_type e_type =
   error (construct ^ " requires matching types, found '" ^
      t_type ^ "' and '" ^ e_type ^ "'")
;

fun runTest s exp =
   (TextIO.print ("\n--------- BEGIN Test " ^ s ^ " ---------\n");
    typecheck exp handle
         AddException (ltyp, rtyp) => add_type_error ltyp rtyp
       | ArgumentException (arg, param) =>
            error ("cannot pass value of type '" ^ arg ^ "' as '" ^ param ^ "'")
       | ArithmeticException (opr, ltyp, rtyp) => 
            binary_type_error "int" "int" ltyp rtyp opr 
       | AssignmentTargetException => error "unexpected target in assignment"
       | AssignmentTypeException (ltyp, rtyp) =>
            match_type_error "assignment" ltyp rtyp
       | BooleanException (opr, ltyp, rtyp) =>
            binary_type_error "bool" "bool" ltyp rtyp opr
       | BooleanFirstException (opr, typ) => bool_first_type_error typ opr
       | BooleanSecondException (opr, typ) =>
            binary_type_error "bool" "bool" "bool" typ opr 
       | CallTooManyArgumentsException => error "too many arguments in call"
       | CallTooFewArgumentsException => error "too few arguments in call"
       | ConditionalException typ => cond_type_error typ
       | ConditionalTypeException (t_type, e_type) =>
            match_type_error "conditional expression" t_type e_type
       | EqualityTypeException (opr, ltyp, rtyp) =>
            match_type_error (binary_operator_string opr) ltyp rtyp
       | IfGuardException typ => if_type_error typ
       | NonFunctionException typ =>
            error ("attempt to invoke '" ^ typ ^ "' value as a function")
       | RelationalException (opr, ltyp, rtyp) => 
            binary_type_error "int" "int" ltyp rtyp opr 
       | ReturnOutsideFunctionException =>
            error "return outside of function"
       | ReturnPathException =>
            error ("insufficient analysis to prove that function returns")
       | ReturnTypeException (r_type, ret_type) =>
            return_type_error r_type ret_type
       | UnaryMinusException typ => unary_type_error "int" typ "-"
       | UnaryNotException typ => unary_type_error "bool" typ "!"
       | UndeclaredVariableAssignmentException id =>
         error ("variable '" ^ id ^ "' not found")
       | UndeclaredVariableException id =>
         error ("variable '" ^ id ^ "' not found")
       | VariableRedeclarationException id =>
         error ("variable '" ^ id ^ "' was previously declared")
       | WhileGuardException typ => while_type_error typ
       | ZeroDivideException => error "divide by zero"
       | _ => error "~~ unexpected exception ~~"
    ;
    TextIO.print ("--------- END Test " ^ s ^ " ---------\n")
   )
;
