use "ast.sml";

exception AddException of string * string;
exception ArgumentException of string * string;
exception ArithmeticException of binaryOperator * string * string;
exception AssignmentTypeException of string * string;
exception AssignmentTargetException;
exception BooleanException of binaryOperator * string * string;
exception BooleanFirstException of binaryOperator * string;
exception BooleanSecondException of binaryOperator * string;
exception CallTooManyArgumentsException;
exception CallTooFewArgumentsException;
exception ConditionalException of string;
exception ConditionalTypeException of string * string;
exception EqualityTypeException of binaryOperator * string * string;
exception IfGuardException of string;
exception NonFunctionException of string;
exception RelationalException of binaryOperator * string * string;
exception ReturnOutsideFunctionException;
exception ReturnPathException;
exception ReturnTypeException of string * string;
exception UnaryMinusException of string;
exception UnaryNotException of string;
exception UndeclaredVariableAssignmentException of string;
exception UndeclaredVariableException of string;
exception VariableRedeclarationException of string;
exception WhileGuardException of string;
exception ZeroDivideException;

