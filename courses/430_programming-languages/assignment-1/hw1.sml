(*part 1*)
fun intToString (n : int) : string =
    if n > 0
        then Int.toString n
    else "-" ^ Int.toString (n * ~1)
;

(*part2*)
fun firsts (l : ('a * 'b) list) =
    if null l then []
    else #1 (hd l) :: firsts (tl l)
;

fun seconds (l : ('a * 'b) list) =
    if null l then []
    else #2 (hd l) :: seconds (tl l)
;

(*part3*)
fun replaceFirst (old: ''a, new: ''a, l: ''a list) = 
    case l of 
    [] => []
    | (x::xs) => 
        if x = old then new::xs 
        else x :: replaceFirst (old, new, xs)
;

(*part4*)
fun replaceAll (old: ''a, new: ''a, l: ''a list) = 
    case l of 
    [] => []
    | (x::xs) => 
        if x = old then new::replaceAll(old, new, xs)
        else x:: replaceAll (old, new, xs)
;

(*part 5*)
fun partition(pivot: int, l: int list) =
  case l of
    [] => ([], [])
    | (x::xs) =>
      if x < pivot 
        then let val (less, notLess) = partition(pivot, xs) in (x::less, notLess) end
        else let val (less, notLess) = partition(pivot, xs) in (less, x::notLess) end
;

(*part 6*)
fun getByKey (key: ''a, l: (''a * 'b) list, default: 'b) =
    case l of
    [] => default
    | (x::xs) => 
        if #1 x = key then #2 x 
        else getByKey(key, xs, default)
;

(*part 7*)
exception InvalidEscapedCharacter of char;
exception MissingEscapedCharacter;

fun convertSingle(l: char list) =
    if l = [] then raise MissingEscapedCharacter
    else if hd l = #"n" then ("\n", tl l)
    else if hd l = #"t" then ("\t", tl l)
    else if hd l = #"\"" then ("\"", tl l)
    else if hd l = #":" then (":", tl l)
    else raise InvalidEscapedCharacter (hd l);


fun convertEscapeSequences (str : string) = 
    case String.explode(str) of
    [] => ""
    | (x::xs) => 
        if x = #":" then let val (a, everythingElse) = convertSingle(xs) in a ^ convertEscapeSequences(String.implode(everythingElse)) end
        else String.str(x) ^ convertEscapeSequences(String.implode(xs))
;

(*part8*)
(*lots of repeated code. can this be avoided? kept getting errors when trying to optimize like removing the bottom chunk but idk*)
fun splithelper(delimiter: char, str: char list, l: string list) =
    case str of
    [] => rev l
    (*checking immedate after character*)
    | (x::y::xs) => if x = delimiter andalso y = delimiter then splithelper(delimiter, y::xs, l)
        else 
            if x = delimiter then splithelper(delimiter, y::xs, ""::l)
            else let val new_l = if l = [] then [String.str x] 
                else (hd l ^ String.str x)::tl l in splithelper(delimiter, y::xs, new_l) end
    (*needed for exaustive cases...? I think. idr get why, but redundant when switched*)
    | (x::xs) =>
        if x = delimiter then
            if xs = [] then splithelper(delimiter, xs, l)
            else splithelper(delimiter, xs, ""::l)
        else
            let val new_l = if l = [] then [String.str x] else (hd l ^ String.str x)::tl l
            in splithelper(delimiter, xs, new_l) end
;

fun split(delimiter: char, str: string) =
    splithelper(delimiter, String.explode str, [])
;

(*part9*)
fun whitespacePrefix(l: char list) = 
    case l of
    [] => ("", [])
    | (x::xs) => 
        if Char.isSpace(x) then let val (a, b) = whitespacePrefix(xs) in (String.str(x) ^ a, b) end
        else ("", l)
;

fun numberPrefix(l: char list) = 
    case l of
    [] => ("", [])
    | (x::xs) => 
        if Char.isDigit(x) then let val (a, b) = numberPrefix(xs) in (String.str(x) ^ a, b) end
        else ("", l)
;

(*i recognize that this is not quite right*)
fun identifierPrefix(l: char list) = 
    case l of
    [] => ("", [])
    | (x::xs) => 
        if Char.isAlpha(x) orelse Char.isAlphaNum(x) then let val (a, b) = identifierPrefix(xs) in (String.str(x) ^ a, b) end
        else ("", l)
;

(*part 10*)
exception InvalidTokenStart of char;

(*does rely on identifierprefix so i recognize anything where that fails, this will probably also fail*)
fun tokenhelper(str: char list, l: string list) =
    case str of
    [] => rev l
    | (x::xs) =>
        if Char.isSpace(x) then let val (whitespace, rest) = whitespacePrefix(x::xs) in tokenhelper(rest, l) end
        else if Char.isDigit(x) then let val (number, rest) = numberPrefix(x::xs) in tokenhelper(rest, number::l) end
        else if Char.isAlphaNum(x) then let val (identifier, rest) = identifierPrefix(x::xs) in tokenhelper(rest, identifier :: l) end
        else raise InvalidTokenStart(x)
;

fun splitTokens(input: string): string list =
    tokenhelper (String.explode input, [])
;