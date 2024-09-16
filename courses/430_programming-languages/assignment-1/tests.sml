fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
TextIO.print " **** intToString 99;\n"; 
intToString 99;
TextIO.print " **** intToString ~1;\n"; 
intToString ~1;
TextIO.print " **** intToString 12;\n"; 
intToString 12;
TextIO.print " **** intToString ~4729;\n"; 
intToString ~4729;

printPart "2";
TextIO.print " **** firsts [];\n"; 
firsts [];
TextIO.print " **** firsts [(0,1),(2,3),(4,5)];\n"; 
firsts [(0,1),(2,3),(4,5)];
TextIO.print " **** firsts [(1,\"one\"),(2,\"two\"),(3,\"three\")];\n"; 
firsts [(1,"one"),(2,"two"),(3,"three")];
TextIO.print " **** seconds [];\n"; 
seconds [];
TextIO.print " **** seconds [(0,1),(2,3),(4,5)];\n"; 
seconds [(0,1),(2,3),(4,5)];
TextIO.print " **** seconds [(1,\"one\"),(2,\"two\"),(3,\"three\")];\n"; 
seconds [(1,"one"),(2,"two"),(3,"three")];


printPart "3";
TextIO.print " **** replaceFirst (3, 4, []);\n";
replaceFirst (3, 4, []);
TextIO.print " **** replaceFirst (\"c\", \"new\", [\"a\", \"b\", \"c\", \"d\", \"e\"]);\n";
replaceFirst ("c", "new", ["a", "b", "c", "d", "e"]);
TextIO.print " **** replaceFirst (1, 9, [1, 2, 3]);\n";
replaceFirst (1, 9, [1, 2, 3]);
TextIO.print " **** replaceFirst (3, 9, [1, 2, 3, 4]);\n";
replaceFirst (3, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceFirst (4, 9, [1, 2, 3, 4]);\n";
replaceFirst (4, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceFirst (6, 9, [1, 2, 3, 4]);\n";
replaceFirst (6, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceFirst (2, 0, [1,2,3,1,2,3,1,2,2]);\n";
replaceFirst (2, 0, [1,2,3,1,2,3,1,2,2]);
TextIO.print " **** replaceFirst (3, 0, [1,2,3,1,2,3,1,2,2]);\n";
replaceFirst (3, 0, [1,2,3,1,2,3,1,2,2]);


printPart "4";
TextIO.print " **** replaceAll (3, 4, []);\n";
replaceAll (3, 4, []);
TextIO.print " **** replaceAll (\"c\", \"new\", [\"a\", \"b\", \"c\", \"d\", \"e\"]);\n";
replaceAll ("c", "new", ["a", "b", "c", "d", "e"]);
TextIO.print " **** replaceAll (1, 9, [1, 2, 3]);\n";
replaceAll (1, 9, [1, 2, 3]);
TextIO.print " **** replaceAll (3, 9, [1, 2, 3, 4]);\n";
replaceAll (3, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceAll (4, 9, [1, 2, 3, 4]);\n";
replaceAll (4, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceAll (6, 9, [1, 2, 3, 4]);\n";
replaceAll (6, 9, [1, 2, 3, 4]);
TextIO.print " **** replaceAll (2, 0, [1,2,3,1,2,3,1,2,2]);\n";
replaceAll (2, 0, [1,2,3,1,2,3,1,2,2]);
TextIO.print " **** replaceAll (3, 0, [1,2,3,1,2,3,1,2,2]);\n";
replaceAll (3, 0, [1,2,3,1,2,3,1,2,2]);


printPart "5";
TextIO.print " **** partition (9, [2, 10, 1, 4, 17, 9, 18, 0]);\n";
partition (9, [2, 10, 1, 4, 17, 9, 18, 0]);
TextIO.print " **** partition (10, [2, 10, 1, 4, 17, 9, 18, 0]);\n";
partition (10, [2, 10, 1, 4, 17, 9, 18, 0]);
TextIO.print " **** partition (20, [2, 10, 1, 4, 17, 9, 18, 0]);\n";
partition (20, [2, 10, 1, 4, 17, 9, 18, 0]);
TextIO.print " **** partition (0, [2, 10, 1, 4, 17, 9, 18, 0]);\n";
partition (0, [2, 10, 1, 4, 17, 9, 18, 0]);
TextIO.print " **** partition (2, []);\n";
partition (2, []);

(*
printPart "6";
TextIO.print " **** getByKey (\"b\", [(\"a\", 9), (\"b\", 7), (\"c\", 12)], ~1);;\n";
getByKey ("b", [("a", 9), ("b", 7), ("c", 12)], ~1);
TextIO.print " **** getByKey (\"c\", [(\"a\", 9), (\"b\", 7), (\"c\", 12)], ~1);;\n";
getByKey ("c", [("a", 9), ("b", 7), ("c", 12)], ~1);
TextIO.print " **** getByKey (\"x\", [(\"a\", 9), (\"b\", 7), (\"c\", 12)], ~1);;\n";
getByKey ("x", [("a", 9), ("b", 7), ("c", 12)], ~1);
TextIO.print " **** getByKey (1, [(3, 9), (4, 7), (1, 12)], ~1);;\n";
getByKey (1, [(3, 9), (4, 7), (1, 12)], ~1);
TextIO.print " **** getByKey (3, [(3, true), (4, true), (1, false)], false);;\n";
getByKey (3, [(3, true), (4, true), (1, false)], false);


printPart "7";
TextIO.print " **** convertEscapeSequences \"abc\";\n";
convertEscapeSequences "abc";
TextIO.print " **** convertEscapeSequences \"ab :t c :\\\" :: :n\";\n";
convertEscapeSequences "ab :t c :\" :: :n";
TextIO.print " **** convertEscapeSequences \"ab:bc\" handle InvalidEscapedCharacter c => \"invalid escape :\" ^ str c;\n";
convertEscapeSequences "ab:bc" handle InvalidEscapedCharacter c =>
   "invalid escape :" ^ str c;
TextIO.print " **** convertEscapeSequences \"ab:\" handle MissingEscapedCharacter => \"escape sequence missing character\";\n";
convertEscapeSequences "ab:" handle MissingEscapedCharacter =>
   "escape sequence missing character";


printPart "8";
TextIO.print " **** split (#\" \", \"abc\"); ;\n";
split (#" ", "abc");
TextIO.print " **** split (#\" \", \"a b c def    geg\"); ;\n";
split (#" ", "a b c def    geg");
TextIO.print " **** split (#\" \", \"   \"); ;\n";
split (#" ", "   ");
TextIO.print " **** split (#\"b\", \"abc   \"); ;\n";
split (#"b", "abc   ");
TextIO.print " **** split (#\":\", \"1:2:3:4:5:\"); ;\n";
split (#":", "1:2:3:4:5:");


printPart "9";
TextIO.print " **** whitespacePrefix [];\n";
whitespacePrefix [];
TextIO.print " **** whitespacePrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
whitespacePrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** whitespacePrefix [#\" \", #\"\\t\", #\" \", #\"a\"];\n";
whitespacePrefix [#" ", #"\t", #" ", #"a"];
TextIO.print " **** numberPrefix [];\n";
numberPrefix [];
TextIO.print " **** numberPrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
numberPrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** numberPrefix [#\"2\", #\"3\", #\" \", #\"a\"];\n";
numberPrefix [#"2", #"3", #" ", #"a"];
TextIO.print " **** numberPrefix [#\"2\", #\"3\", #\"-\", #\"a\"];\n";
numberPrefix [#"2", #"3", #"-", #"a"];
TextIO.print " **** numberPrefix [#\"2\", #\"3\"];\n";
numberPrefix [#"2", #"3"];
TextIO.print " **** identifierPrefix [];\n";
identifierPrefix [];
TextIO.print " **** identifierPrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** identifierPrefix [#\"2\", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#"2", #"c", #" ", #"a"];
TextIO.print " **** identifierPrefix [#\" \", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#" ", #"c", #" ", #"a"];
TextIO.print " **** identifierPrefix [#\"a\", #\"b\", #\"c\"];\n";
identifierPrefix [#"a", #"b", #"c"];


printPart "10";
TextIO.print " **** splitTokens \"abc xyz\";\n";
splitTokens "abc xyz";
TextIO.print " **** splitTokens \"   123 456   \";\n";
splitTokens "   123 456   ";
TextIO.print " **** splitTokens \"abc123  xyz\";\n";
splitTokens "abc123  xyz";
TextIO.print " **** splitTokens \"abc 123  \\t xyz\";\n";
splitTokens "abc 123  \t xyz";
TextIO.print " **** splitTokens \"004abc123\";\n";
splitTokens "004abc123";
TextIO.print " **** splitTokens \"100-90\" handle InvalidTokenStart c => [\"invalid character '\" ^ str c ^ \"'\"];\n";
splitTokens "100-90" handle InvalidTokenStart c => ["invalid character '" ^ str c ^ "'"];
*)
