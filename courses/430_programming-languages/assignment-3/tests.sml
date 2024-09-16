fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
val ae_exp1 = AE_NUM 9;
val ae_exp2 = AE_PLUS (AE_NUM 3, AE_NUM 4);
val ae_exp3 = AE_PLUS (AE_PLUS (AE_NUM 9, AE_NUM 4), AE_PLUS (AE_NUM 9, AE_NUM 3));
val ae_exp4 = AE_MINUS (AE_MINUS (AE_NUM 1, AE_NUM 2), AE_NUM 3);
val ae_exp5 = AE_MINUS (AE_NUM 1, AE_MINUS (AE_NUM 2, AE_NUM 3));
val ae_exp6 = AE_PLUS (AE_PLUS (AE_NUM 9, AE_NUM 3), AE_TIMES (AE_NUM 2, AE_NUM 4));
val ae_exp7 = AE_TIMES (AE_PLUS (AE_NUM 9, AE_NUM 3), AE_PLUS (AE_NUM 2, AE_NUM 4));
val ae_exp8 = AE_TIMES (AE_MINUS (AE_NUM 6, AE_PLUS (AE_NUM 9, AE_MINUS (AE_NUM 3, AE_NUM 10))), AE_DIVIDE (AE_NUM 4, AE_NUM 2));
val ae_exp9 = AE_TIMES (AE_PLUS (AE_NUM 6, AE_DIVIDE (AE_NUM 29, AE_TIMES (AE_NUM 2, AE_NUM 3))), AE_TIMES (AE_NUM 2, AE_NUM 4));

TextIO.print " **** arithInfixString ae_exp1;\n";
arithInfixString ae_exp1;
TextIO.print " **** arithInfixString ae_exp2;\n";
arithInfixString ae_exp2;
TextIO.print " **** arithInfixString ae_exp3;\n";
arithInfixString ae_exp3;
TextIO.print " **** arithInfixString ae_exp4;\n";
arithInfixString ae_exp4;
TextIO.print " **** arithInfixString ae_exp5;\n";
arithInfixString ae_exp5;
TextIO.print " **** arithInfixString ae_exp6;\n";
arithInfixString ae_exp6;
TextIO.print " **** arithInfixString ae_exp7;\n";
arithInfixString ae_exp7;
TextIO.print " **** arithInfixString ae_exp8;\n";
arithInfixString ae_exp8;
TextIO.print " **** arithInfixString ae_exp9;\n";
arithInfixString ae_exp9;

TextIO.print " **** arithPrefixString ae_exp1;\n";
arithPrefixString ae_exp1;
TextIO.print " **** arithPrefixString ae_exp2;\n";
arithPrefixString ae_exp2;
TextIO.print " **** arithPrefixString ae_exp3;\n";
arithPrefixString ae_exp3;
TextIO.print " **** arithPrefixString ae_exp4;\n";
arithPrefixString ae_exp4;
TextIO.print " **** arithPrefixString ae_exp5;\n";
arithPrefixString ae_exp5;
TextIO.print " **** arithPrefixString ae_exp6;\n";
arithPrefixString ae_exp6;
TextIO.print " **** arithPrefixString ae_exp7;\n";
arithPrefixString ae_exp7;
TextIO.print " **** arithPrefixString ae_exp8;\n";
arithPrefixString ae_exp8;
TextIO.print " **** arithPrefixString ae_exp9;\n";
arithPrefixString ae_exp9;


printPart "2";
TextIO.print " **** evalArith ae_exp1;\n";
evalArith ae_exp1;
TextIO.print " **** evalArith ae_exp2;\n";
evalArith ae_exp2;
TextIO.print " **** evalArith ae_exp3;\n";
evalArith ae_exp3;
TextIO.print " **** evalArith ae_exp4;\n";
evalArith ae_exp4;
TextIO.print " **** evalArith ae_exp5;\n";
evalArith ae_exp5;
TextIO.print " **** evalArith ae_exp6;\n";
evalArith ae_exp6;
TextIO.print " **** evalArith ae_exp7;\n";
evalArith ae_exp7;
TextIO.print " **** evalArith ae_exp8;\n";
evalArith ae_exp8;
TextIO.print " **** evalArith ae_exp9;\n";
evalArith ae_exp9;


printPart "3";
TextIO.print "evalMixed (ME_NUM 1);\n";
evalMixed (ME_NUM 1);
TextIO.print "evalMixed (ME_PLUS (ME_NUM 1, ME_NUM 2));\n";
evalMixed (ME_PLUS (ME_NUM 1, ME_NUM 2));
TextIO.print "evalMixed (ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 2), ME_NUM 2));\n";
evalMixed (ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 2), ME_NUM 2));
TextIO.print "evalMixed (ME_LESSTHAN (ME_PLUS (ME_NUM 4, ME_NUM 9), ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 3), ME_NUM 2)));\n";
evalMixed (ME_LESSTHAN (ME_PLUS (ME_NUM 4, ME_NUM 9), ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 3), ME_NUM 2)));
TextIO.print "evalMixed (ME_LESSTHAN (ME_LESSTHAN (ME_NUM 4, ME_NUM 9), ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 2), ME_NUM 2)));\n";
evalMixed (ME_LESSTHAN (ME_LESSTHAN (ME_NUM 4, ME_NUM 9), ME_PLUS (ME_TIMES (ME_NUM 4, ME_NUM 2), ME_NUM 2)));
TextIO.print "evalMixed (ME_PLUS (ME_LESSTHAN (ME_NUM 4, ME_NUM 1), ME_NUM 2));\n";
evalMixed (ME_PLUS (ME_LESSTHAN (ME_NUM 4, ME_NUM 1), ME_NUM 2));


printPart "4";
val ve_exp1 = VE_NUM 2;
val ve_exp2 = VE_ID "a";
val ve_exp3 = VE_PLUS (VE_NUM 2, VE_ID "a");
val ve_exp4 = VE_TIMES (VE_NUM 2, VE_ID "a");
val ve_exp5 = (VE_PLUS (VE_TIMES (VE_NUM 2, VE_ID "a"), VE_PLUS (VE_ID "b", VE_ID "x")));
val ve_exp6 = VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_NUM 1, VE_TIMES (VE_NUM 2, VE_NUM 3)), VE_TIMES (VE_ID "a", VE_NUM 4)), VE_NUM 3), VE_NUM 2), VE_TIMES (VE_NUM 7, VE_NUM 2)), VE_PLUS (VE_PLUS (VE_NUM 9, VE_NUM 4), VE_ID "b"));
val ve_exp7 = VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_NUM 1, VE_TIMES (VE_NUM 2, VE_NUM 3)), VE_TIMES (VE_NUM 2, VE_NUM 4)), VE_NUM 3), VE_NUM 2), VE_TIMES (VE_NUM 7, VE_NUM 2)), VE_PLUS (VE_PLUS (VE_NUM 9, VE_NUM 4), VE_ID "b"));
val ve_exp8 = VE_PLUS (VE_TIMES (VE_NUM 1, VE_ID "a"), VE_PLUS (VE_NUM 0, VE_NUM 0));
val ve_exp9 = VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_PLUS (VE_NUM 0, VE_TIMES (VE_NUM 2, VE_NUM 3)), VE_TIMES (VE_NUM 2, VE_NUM 4)), VE_NUM 3), VE_NUM 2), VE_TIMES (VE_NUM 7, VE_NUM 1)), VE_PLUS (VE_PLUS (VE_NUM 9, VE_NUM 4), VE_ID "b"));

TextIO.print " **** simplifyIdentities ve_exp1;\n";
simplifyIdentities ve_exp1;
TextIO.print " **** simplifyIdentities ve_exp2;\n";
simplifyIdentities ve_exp2;
TextIO.print " **** simplifyIdentities ve_exp3;\n";
simplifyIdentities ve_exp3;
TextIO.print " **** simplifyIdentities ve_exp4;\n";
simplifyIdentities ve_exp4;
TextIO.print " **** simplifyIdentities ve_exp5;\n";
simplifyIdentities ve_exp5;
TextIO.print " **** simplifyIdentities ve_exp6;\n";
simplifyIdentities ve_exp6;
TextIO.print " **** simplifyIdentities ve_exp7;\n";
simplifyIdentities ve_exp7;
TextIO.print " **** simplifyIdentities ve_exp8;\n";
simplifyIdentities ve_exp8;
TextIO.print " **** simplifyIdentities ve_exp9;\n";
simplifyIdentities ve_exp9;


printPart "5";
TextIO.print " **** foldConstants ve_exp1;\n";
foldConstants ve_exp1;
TextIO.print " **** foldConstants ve_exp2;\n";
foldConstants ve_exp2;
TextIO.print " **** foldConstants ve_exp3;\n";
foldConstants ve_exp3;
TextIO.print " **** foldConstants ve_exp4;\n";
foldConstants ve_exp4;
TextIO.print " **** foldConstants ve_exp5;\n";
foldConstants ve_exp5;
TextIO.print " **** foldConstants ve_exp6;\n";
foldConstants ve_exp6;
TextIO.print " **** foldConstants ve_exp7;\n";
foldConstants ve_exp7;
TextIO.print " **** foldConstants ve_exp8;\n";
foldConstants ve_exp8;
TextIO.print " **** foldConstants ve_exp9;\n";
foldConstants ve_exp9;


printPart "6";
val exp1 = NUM 2;
val exp2 = ID "a";
val exp3 = BINARY {opr=OP_PLUS, lft=NUM 2, rht=ID "a"};
val exp4 = BINARY {opr=OP_TIMES, lft=NUM 2, rht=ID "a"};
val exp5 = BINARY {opr=OP_PLUS, lft=BINARY {opr=OP_TIMES, lft=NUM 2, rht=ID "a"}, rht=BINARY {opr=OP_PLUS, lft=ID "b", rht=ID "x"}};
val exp6 = FUNCTION {parameter="x", body=BINARY {opr=OP_PLUS, lft=ID "x", rht=NUM 1}};
val exp7 = CALL {func=exp6, argument=BINARY {opr=OP_TIMES, lft=ID "x", rht=ID "y"}};
val exp8 = FUNCTION {parameter="x",
            body=CALL {
               func=FUNCTION {parameter="y",
                  body=BINARY {opr=OP_TIMES, lft=ID "x", rht=ID "y"}
                  },
               argument=CALL {
                  func=FUNCTION {parameter="z",
                     body=BINARY {opr=OP_TIMES, lft=ID "a", rht=ID "y"}
                     },
                  argument=ID "x"
               }}};
val exp9 = FUNCTION {parameter="w",
            body=CALL {
               func=FUNCTION {parameter="y",
                  body=BINARY {opr=OP_TIMES, lft=ID "x", rht=ID "y"}
                  },
               argument=CALL {
                  func=FUNCTION {parameter="z",
                     body=BINARY {opr=OP_TIMES, lft=ID "a", rht=ID "y"}
                     },
                  argument=ID "x"
               }}};
val exp10 = FUNCTION {parameter="x", body=FUNCTION {parameter="y", body=ID "x"}};
         

TextIO.print " **** gatherIdentifiers exp1;\n";
gatherIdentifiers exp1;
TextIO.print " **** gatherIdentifiers exp2;\n";
gatherIdentifiers exp2;
TextIO.print " **** gatherIdentifiers exp3;\n";
gatherIdentifiers exp3;
TextIO.print " **** gatherIdentifiers exp4;\n";
gatherIdentifiers exp4;
TextIO.print " **** gatherIdentifiers exp5;\n";
gatherIdentifiers exp5;
TextIO.print " **** gatherIdentifiers exp6;\n";
gatherIdentifiers exp6;
TextIO.print " **** gatherIdentifiers exp7;\n";
gatherIdentifiers exp7;
TextIO.print " **** gatherIdentifiers exp8;\n";
gatherIdentifiers exp8;
TextIO.print " **** gatherIdentifiers exp9;\n";
gatherIdentifiers exp9;


printPart "7";
TextIO.print " **** freeVariables exp1;\n";
freeVariables exp1;
TextIO.print " **** freeVariables exp2;\n";
freeVariables exp2;
TextIO.print " **** freeVariables exp3;\n";
freeVariables exp3;
TextIO.print " **** freeVariables exp4;\n";
freeVariables exp4;
TextIO.print " **** freeVariables exp5;\n";
freeVariables exp5;
TextIO.print " **** freeVariables exp6;\n";
freeVariables exp6;
TextIO.print " **** freeVariables exp7;\n";
freeVariables exp7;
TextIO.print " **** freeVariables exp8;\n";
freeVariables exp8;
TextIO.print " **** freeVariables exp9;\n";
freeVariables exp9;


printPart "8";
TextIO.print " **** simpSubst exp1 \"a\" (NUM 999);\n";
simpSubst exp1 "a" (NUM 999);
TextIO.print " **** simpSubst exp2 \"a\" (NUM 999);\n";
simpSubst exp2 "a" (NUM 999);
TextIO.print " **** simpSubst exp2 \"x\" (NUM 999);\n";
simpSubst exp2 "x" (NUM 999);
TextIO.print " **** simpSubst exp3 \"a\" (NUM 999);\n";
simpSubst exp3 "a" (NUM 999);
TextIO.print " **** simpSubst exp3 \"x\" (NUM 999);\n";
simpSubst exp3 "x" (NUM 999);
TextIO.print " **** simpSubst exp4 \"a\" (NUM 999);\n";
simpSubst exp4 "a" (NUM 999);
TextIO.print " **** simpSubst exp4 \"x\" (NUM 999);\n";
simpSubst exp4 "x" (NUM 999);
TextIO.print " **** simpSubst exp5 \"a\" (NUM 999);\n";
simpSubst exp5 "a" (NUM 999);
TextIO.print " **** simpSubst exp5 \"x\" (NUM 999);\n";
simpSubst exp5 "x" (NUM 999);
TextIO.print " **** simpSubst exp6 \"a\" (NUM 999);\n";
simpSubst exp6 "a" (NUM 999);
TextIO.print " **** simpSubst exp6 \"x\" (NUM 999);\n";
simpSubst exp6 "x" (NUM 999);
TextIO.print " **** simpSubst exp7 \"x\" (NUM 999);\n";
simpSubst exp7 "x" (NUM 999);
TextIO.print " **** simpSubst exp8 \"a\" (NUM 999);\n";
simpSubst exp8 "a" (NUM 999);
TextIO.print " **** simpSubst exp8 \"y\" (NUM 999);\n";
simpSubst exp8 "y" (NUM 999);
TextIO.print " **** simpSubst exp9 \"a\" (NUM 999);\n";
simpSubst exp9 "a" (NUM 999);
TextIO.print " **** simpSubst exp9 \"y\" (NUM 999);\n";
simpSubst exp9 "y" (NUM 999);


printPart "9";
TextIO.print " **** betterSubst exp1 \"a\" (NUM 999);\n";
betterSubst exp1 "a" (NUM 999);
TextIO.print " **** betterSubst exp2 \"a\" (NUM 999);\n";
betterSubst exp2 "a" (NUM 999);
TextIO.print " **** betterSubst exp2 \"x\" (NUM 999);\n";
betterSubst exp2 "x" (NUM 999);
TextIO.print " **** betterSubst exp3 \"a\" (NUM 999);\n";
betterSubst exp3 "a" (NUM 999);
TextIO.print " **** betterSubst exp3 \"x\" (NUM 999);\n";
betterSubst exp3 "x" (NUM 999);
TextIO.print " **** betterSubst exp4 \"a\" (NUM 999);\n";
betterSubst exp4 "a" (NUM 999);
TextIO.print " **** betterSubst exp4 \"x\" (NUM 999);\n";
betterSubst exp4 "x" (NUM 999);
TextIO.print " **** betterSubst exp5 \"a\" (NUM 999);\n";
betterSubst exp5 "a" (NUM 999);
TextIO.print " **** betterSubst exp5 \"x\" (NUM 999);\n";
betterSubst exp5 "x" (NUM 999);
TextIO.print " **** betterSubst exp6 \"a\" (NUM 999);\n";
betterSubst exp6 "a" (NUM 999);
TextIO.print " **** betterSubst exp6 \"x\" (NUM 999);\n";
betterSubst exp6 "x" (NUM 999);
TextIO.print " **** betterSubst exp7 \"x\" (NUM 999);\n";
betterSubst exp7 "x" (NUM 999);
TextIO.print " **** betterSubst exp8 \"a\" (NUM 999);\n";
betterSubst exp8 "a" (NUM 999);
TextIO.print " **** betterSubst exp8 \"y\" (NUM 999);\n";
betterSubst exp8 "y" (NUM 999);
TextIO.print " **** betterSubst exp9 \"a\" (NUM 999);\n";
betterSubst exp9 "a" (NUM 999);
TextIO.print " **** betterSubst exp9 \"y\" (NUM 999);\n";
betterSubst exp9 "y" (NUM 999);


printPart "10";
val other = BINARY {opr=OP_TIMES, lft=ID "x", rht=ID "y"};
val another = BINARY {opr=OP_TIMES, lft=ID "z", rht=ID "y"};
val last = BINARY {opr=OP_TIMES, lft=ID "q", rht=ID "y"};

TextIO.print " **** willCapture exp1 \"a\" other;\n";
willCapture exp1 "a" other;
TextIO.print " **** willCapture exp2 \"a\" other;\n";
willCapture exp2 "a" other;
TextIO.print " **** willCapture exp3 \"a\" other;\n";
willCapture exp3 "a" other;
TextIO.print " **** willCapture exp4 \"a\" other;\n";
willCapture exp4 "a" other;
TextIO.print " **** willCapture exp5 \"x\" other;\n";
willCapture exp5 "x" other;
TextIO.print " **** willCapture exp6 \"a\" other;\n";
willCapture exp6 "a" other;
TextIO.print " **** willCapture exp6 \"x\" other;\n";
willCapture exp6 "x" other;
TextIO.print " **** willCapture exp7 \"x\" other;\n";
willCapture exp7 "x" other;
TextIO.print " **** willCapture exp8 \"a\" other;\n";
willCapture exp8 "a" other;
TextIO.print " **** willCapture exp8 \"y\" other;\n";
willCapture exp8 "y" other;
TextIO.print " **** willCapture exp9 \"y\" other;\n";
willCapture exp9 "y" other;
TextIO.print " **** willCapture exp9 \"x\" other;\n";
willCapture exp9 "x" other;
TextIO.print " **** willCapture exp8 \"y\" another;\n";
willCapture exp8 "y" another;
TextIO.print " **** willCapture exp9 \"x\" another;\n";
willCapture exp9 "x" another;
TextIO.print " **** willCapture exp8 \"a\" another;\n";
willCapture exp8 "a" another;
TextIO.print " **** willCapture exp9 \"a\" another;\n";
willCapture exp9 "a" another;
TextIO.print " **** willCapture exp9 \"a\" last;\n";
willCapture exp9 "a" last;
TextIO.print " **** willCapture exp10 \"x\" other;\n";
willCapture exp10 "x" other;

