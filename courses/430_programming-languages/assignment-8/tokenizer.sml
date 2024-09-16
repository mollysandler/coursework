use "tokens.sml";
use "exceptions_tokenizer.sml";

val OPTIONAL = true;

val keywordTokens =
   [
      ("yesho", TK_ELSE),
      ("falshiviy", TK_FALSE),
      ("yesle", TK_IF),
      ("raspetchatat", TK_PRINT),
      ("verna", TK_TRUE),
      ("nikto", TK_NONE),
      ("peremenaya", TK_VAR),
      ("poka", TK_WHILE),
      ("deleigh", TK_DO)
   ]
;

fun member s xs = List.exists (fn st => st = s) xs;

fun pairLookup s xs =
   case List.find (fn (st, _) => st = s) xs of
      NONE => NONE
   |  SOME (_, v) => SOME v
;

local
   fun findPrefix pred (prefix, []) = (rev prefix, [])
     | findPrefix pred (prefix, suffix as x::xs) =
         if pred x
         then findPrefix pred (x::prefix, xs)
         else (rev prefix, suffix)
   ;
in
   fun prefixBy (pred, vals) = findPrefix pred ([], vals)
end;

fun skipSpaces (chars, rtokens) =
   (#2 (prefixBy (Char.isSpace, chars)), rtokens)
;

fun makeIdentifierKeyword id =
   case pairLookup id keywordTokens of
      NONE => TK_ID id
   |  SOME tk => tk
;

fun makeNumber s =
   case Int.fromString s of
      SOME n => TK_NUM n
   |  NONE => raise InvalidNumberException s
;

val makeString = TK_STRING;

fun buildToken isChar make (chars, rtokens) =
   let
      val (token, rest) = prefixBy (isChar, chars);
   in
      (rest, (make (implode token))::rtokens)
   end
;

val buildIdentifier = buildToken Char.isAlphaNum makeIdentifierKeyword;
val buildNumber = buildToken Char.isDigit makeNumber;

local
   val escapeSequences =
      [(#"\"", #"\""), (#":", #":"), (#"n", #"\n"), (#"t", #"\t")];  
   fun mapEscape c =
      case List.find (fn (k, _) => k = c) escapeSequences of
         SOME (_, v) => v
       | NONE => raise InvalidEscapeSequenceException c
   ;
   fun consumeContents (([]|((#"\r" | #"\n")::_)), rstr) =
         raise UnterminatedStringException
     | consumeContents (#"\""::chars, rstr) = (implode (rev rstr), chars)
     | consumeContents ([#":"], rstr) = raise InvalidEscapeMissingException
     | consumeContents (#":"::c::cs, rstr) =
         consumeContents (cs, mapEscape c :: rstr)
     | consumeContents (c::cs, rstr) =
         if Char.isSpace c andalso not (c = #" ")
         then raise InvalidWhitespaceInStringException
         else consumeContents (cs, c::rstr)
   ;
in
   fun buildString (#"\""::chars, rtokens) =
         let
            val (str, rest) = consumeContents (chars, []);
         in
            (rest, makeString str::rtokens)
         end
     | buildString (chars, rtokens) = raise InvalidStringException
end;

fun buildSymbol (chars, rtokens) =
   let
      fun single tk = (List.drop (chars, 1), tk::rtokens);
      fun double tk = (List.drop (chars, 2), tk::rtokens);
   in
      case chars of
         #"&"::(#"&"::_) => double TK_AND
       | #"|"::(#"|"::_) => double TK_OR
       | #"="::(#"="::_) => double TK_EQ
       | #"<"::(#"="::_) => double TK_LE
       | #">"::(#"="::_) => double TK_GE
       | #"!"::(#"="::_) => double TK_NE
       | #"="::_ => single TK_ASSIGN
       | #"<"::_ => single TK_LT
       | #">"::_ => single TK_GT
       | #"!"::_ => single TK_NOT
       | #"{"::_ => single TK_LBRACE
       | #"}"::_ => single TK_RBRACE
       | #"("::_ => single TK_LPAREN
       | #")"::_ => single TK_RPAREN
       | #","::_ => single TK_COMMA
       | #";"::_ => single TK_SEMI
       | #"?"::_ => single TK_QUESTION
       | #":"::_ => single TK_COLON
       | #"+"::_ => single TK_PLUS
       | #"-"::_ => single TK_MINUS
       | #"*"::_ => single TK_TIMES
       | #"/"::_ => single TK_DIVIDE
       | #"%"::_ => single TK_MOD
       | #"&"::_ => raise InvalidSymbolException "&"
       | #"|"::_ => raise InvalidSymbolException "|"
       | c::_ => raise IllegalCharacterException c
       | _ => raise InvalidSymbolException "<empty input>"
   end
;

local
   fun selectPath c =
      if Char.isSpace c then skipSpaces
      else if Char.isAlpha c then buildIdentifier
      else if Char.isDigit c then buildNumber
      else if c = #"\"" then buildString
      else buildSymbol
   ;

   fun gatherTokens ([], rtokens) = rev rtokens
     | gatherTokens (chars, rtokens) =
         gatherTokens ((selectPath (hd chars)) (chars, rtokens))
   ;
in
   fun tokenize input = gatherTokens (explode input, [])
end
;

fun runit filename = tokenize (TextIO.inputAll (TextIO.openIn filename));

val symbolTokens =
   [
      (TK_AND, "&&"),
      (TK_OR, "||"),
      (TK_EQ, "=="),
      (TK_LE, "<="),
      (TK_GE, ">="),
      (TK_NE, "!="),
      (TK_ASSIGN, "="),
      (TK_LT, "<"),
      (TK_GT, ">"),
      (TK_NOT, "!"),
      (TK_LBRACE, "{"),
      (TK_RBRACE, "}"),
      (TK_LPAREN, "("),
      (TK_RPAREN, ")"),
      (TK_COMMA, ","),
      (TK_SEMI, ";"),
      (TK_QUESTION, "?"),
      (TK_COLON, ":"),
      (TK_PLUS, "+"),
      (TK_MINUS, "-"),
      (TK_TIMES, "*"),
      (TK_DIVIDE, "/"),
      (TK_MOD, "%")
   ]
;

val allTokens = symbolTokens @ (List.map (fn (x,y)=>(y,x)) keywordTokens);

fun token_string (TK_NUM n) = Int.toString n
  | token_string (TK_ID id) = id
  | token_string (TK_STRING s) = "\"" ^ (String.toString s) ^ "\""
  | token_string tk =
      case pairLookup tk allTokens of
         SOME v => v
      |  NONE => "invalid token"
;
