fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
TextIO.print " **** either (fn x => x > 0, fn x => x > 20) 10;\n";
either (fn x => x > 0, fn x => x > 20) 10;
TextIO.print " **** either (fn x => x mod 2 = 1, fn x => x < 20) 100;\n";
either (fn x => x mod 2 = 1, fn x => x < 20) 100;
TextIO.print " **** either (fn x => x > #\"a\", fn x => x < #\"z\") #\"1\";\n";
either (fn x => x > #"a", fn x => x < #"z") #"1";


printPart "2";
TextIO.print " **** satisfiesSome ([], 10);\n";
satisfiesSome ([], 10);
TextIO.print " **** satisfiesSome ([fn x => x > 0, fn x => x < 20], 10);\n";
satisfiesSome ([fn x => x > 0, fn x => x < 20], 10);
TextIO.print " **** satisfiesSome ([fn x => x > 0, fn x => x < 20], 100);\n";
satisfiesSome ([fn x => x > 0, fn x => x < 20], 100);
TextIO.print " **** satisfiesSome ([fn x => x < 0, fn x => x > 20, fn x => x mod 2 = 0], 10);\n";
satisfiesSome ([fn x => x < 0, fn x => x > 20, fn x => x mod 2 = 0], 10);
TextIO.print " **** satisfiesSome ([fn x => x mod 2 = 0], 11);\n";
satisfiesSome ([fn x => x mod 2 = 0], 11);
TextIO.print " **** satisfiesSome ([fn x => x >= #\"a\", fn x => x <= #\"z\", fn x => x <> #\"m\"], #\"1\");\n";
satisfiesSome ([fn x => x >= #"a", fn x => x <= #"z", fn x => x <> #"m"], #"1");
TextIO.print " **** satisfiesSome ([fn x => x >= #\"a\", fn x => x <= #\"z\", fn x => x <> #\"m\"], #\"m\");\n";
satisfiesSome ([fn x => x > #"a", fn x => x < #"z", fn x => x <> #"m"], #"m");


printPart "3";
TextIO.print " **** mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];
TextIO.print " **** mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];


printPart "4";
TextIO.print " **** notIn (1, []);\n";
notIn (1, []);
TextIO.print " **** notIn (2, [1,2,3]);\n";
notIn (2, [1,2,3]);
TextIO.print " **** notIn (4, [1,2,3]);\n";
notIn (4, [1,2,3]);
TextIO.print " **** notIn (\"hi\", [\"hello\",\"hola\",\"ciao\",\"howdy\"]);\n";
notIn ("hi", ["hello","hola","ciao","howdy"]);
TextIO.print " **** notIn (\"hello\", [\"hello\",\"hola\",\"ciao\"]);\n";
notIn ("hello", ["hello","hola","ciao"]);


printPart "5";
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


printPart "6";
TextIO.print " **** lengthList EmptyList;\n";
lengthList EmptyList;
TextIO.print " **** lengthList (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
lengthList (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** lengthList (ListNode (9, ListNode (2, EmptyList)));\n";
lengthList (ListNode (9, ListNode (2, EmptyList)));


printPart "7";
TextIO.print " **** filterList (fn x => x > 0) EmptyList;\n";
filterList (fn x => x > 0) EmptyList;
TextIO.print " **** filterList (fn x => x mod 2 = 1) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
filterList (fn x => x mod 2 = 1) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** filterList (fn x => x > 3) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
filterList (fn x => x > 3) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** filterList (fn x => x > 0 andalso x < 10) (ListNode (9, ListNode (2, ListNode (~3, EmptyList))));\n";
filterList (fn x => x > 0 andalso x < 10) (ListNode (9, ListNode (2, ListNode (~3, EmptyList))));


printPart "8";

val TreeExmp1 = VerboseNode {value=4,
      left=Righty{value=9, right=Leaf {value=2}},
      right=Lefty{value=6, left=Leaf {value=10}}
      };

val TreeExmp2 = VerboseNode {value=4,
         left=VerboseNode {value=9,
               left=Leaf {value=12},
               right=VerboseNode {value=2, left=EmptyVerboseTree, right=EmptyVerboseTree}},
         right=VerboseNode {value=6,
            left=VerboseNode {value=20, left=EmptyVerboseTree, right=Leaf {value=100}},
            right=Lefty {value=9, left=Lefty {value=19, left=VerboseNode {value=10, left=Leaf {value=29}, right=Leaf {value=39}}}}}};

val TreeExmp3 = VerboseNode {value="these",
      left=Righty{value="are", right=Leaf {value="the"}},
      right=Lefty{value="tree's", left=Leaf {value="values"}}
      };

TextIO.print " **** sumTree EmptyVerboseTree;\n";
sumTree EmptyVerboseTree;
TextIO.print " **** sumTree (Leaf {value=4});\n";
sumTree (Leaf {value=4});
TextIO.print " **** sumTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});\n";
sumTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});
TextIO.print " **** sumTree TreeExmp1;\n";
sumTree TreeExmp1;
TextIO.print " **** sumTree TreeExmp2;\n";
sumTree TreeExmp2;

printPart "9";
TextIO.print " **** gatherTree EmptyVerboseTree;\n";
gatherTree EmptyVerboseTree;
TextIO.print " **** gatherTree (Leaf {value=4});\n";
gatherTree (Leaf {value=4});
TextIO.print " **** gatherTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});\n";
gatherTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});
TextIO.print " **** gatherTree TreeExmp1;\n";
gatherTree TreeExmp1;
TextIO.print " **** gatherTree TreeExmp2;\n";
gatherTree TreeExmp2;
TextIO.print " **** gatherTree TreeExmp3;\n";
gatherTree TreeExmp3;

printPart "10";
TextIO.print " **** simplifyTree EmptyVerboseTree;\n";
simplifyTree EmptyVerboseTree;
TextIO.print " **** simplifyTree (Leaf {value=4});\n";
simplifyTree (Leaf {value=4});
TextIO.print " **** simplifyTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});\n";
simplifyTree (VerboseNode {value=4, left=EmptyVerboseTree, right=EmptyVerboseTree});
TextIO.print " **** simplifyTree TreeExmp1;\n";
simplifyTree TreeExmp1;
TextIO.print " **** simplifyTree TreeExmp2;\n";
simplifyTree TreeExmp2;
TextIO.print " **** simplifyTree TreeExmp3;\n";
simplifyTree TreeExmp3;
