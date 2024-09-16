exception ExhaustedTokensException of string;
exception InvalidAssignException;
exception InvalidEndOfProgramException of string;
exception InvalidExpressionException of string;
exception InvalidIdentifierException of string;
exception InvalidStatementException of string;
exception InvalidTokenException of {expected:string, found:string};

