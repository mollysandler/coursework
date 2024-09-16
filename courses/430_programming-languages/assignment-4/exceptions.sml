use "ast.sml";

exception AddException of string * string;
exception ArithmeticException of binaryOperator * string * string;
exception AssignmentTargetException;
exception BooleanFirstException of binaryOperator * string;
exception BooleanSecondException of binaryOperator * string;
exception ConditionalException of string;
exception IfGuardException of string;
exception RelationalException of binaryOperator * string * string;
exception UnaryMinusException of string;
exception UnaryNotException of string;
exception UndeclaredVariableAssignmentException of string;
exception UndeclaredVariableException of string;
exception VariableRedeclarationException of string;
exception WhileGuardException of string;
exception ZeroDivideException;

