fun error message =
   TextIO.output (TextIO.stdErr, message ^ "\n")
;

fun runTest s expected =
   (TextIO.print ("\n--------- BEGIN Test " ^ s ^ " ---------\n");
    (if parse (tokenize (TextIO.inputAll (TextIO.openIn s))) = expected
      then ()
      else
      TextIO.output (TextIO.stdErr, "ASTs differ\n"))
      handle
           InvalidSymbolException s => error ("invalid symbol: " ^ s)
         | UnterminatedStringException => error "unterminated string"
         | InvalidEscapeSequenceException c =>
            error ("invalid escape sequence: \\" ^ (str c))
         | InvalidEscapeMissingException =>
            error "unterminated escape sequence"
         | IllegalCharacterException c =>
            error ("illegal chracter: " ^ (str c))
         | InvalidNumberException s =>
            error ("invalid number token: " ^ s)
         | InvalidStringException =>
            error ("invalid start of string token")
         | InvalidWhitespaceInStringException =>
            error ("invalid whitespace in string")
         | InvalidAssignException => error ("unexpected '='")
         | InvalidIdentifierException token =>
            error ("expected 'identifier', found '" ^ token ^ "'")
         | InvalidTokenException {expected, found} =>
            error ("expected '" ^ expected ^ "', found '" ^ found ^ "'")
         | InvalidExpressionException token =>
            error ("expected 'value', found '" ^ token ^ "'")
         | InvalidStatementException token =>
            error ("invalid start of statement '" ^ token ^ "'")
         | ExhaustedTokensException msg =>
            error ("expected '" ^ msg ^ "', no token found")
         | InvalidEndOfProgramException token =>
            error ("token '" ^ token ^ "' after logical end of program")
    ;
    TextIO.print ("--------- END Test " ^ s ^ " ---------\n")
   )
;
