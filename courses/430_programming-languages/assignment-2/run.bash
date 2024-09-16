#!/bin/bash -f

Control.Print.printDepth := 20;
Control.Print.printLength := 100;
CM.make "$smlnj-tdp/back-trace.cm";
SMLofNJ.Internals.TDP.mode := true;
defaultSML=/home/akeen/public/ml/bin/sml
expected_source=hw2.sml

if [ ! -f ${expected_source} ]; then
   echo "must provide source file '${expected_source}'"
   exit 1
fi

if [ -z ${SML} ]; then
   echo "SML not set: using default of ${defaultSML}"
   SML=${defaultSML}
fi

if [ ! -f ${SML} ]; then
   echo "${SML} does not exist"
   exit 1
fi

${SML} &> tmp << END
val devnull = Posix.FileSys.openf ("/dev/null", Posix.FileSys.O_WRONLY, Posix.FileSys.O.trunc);
val sout = Posix.IO.dup(Posix.FileSys.stdout);
Posix.IO.dup2 {old=devnull, new=Posix.FileSys.stdout};

Control.Print.printDepth := 20;
Control.Print.printLength := 100;

datatype 'a List =
     ListNode of 'a * 'a List
   | EmptyList
;

datatype 'a VerboseTree =
     VerboseNode of {value: 'a, left: 'a VerboseTree, right: 'a VerboseTree}
   | Lefty of {value: 'a, left: 'a VerboseTree}
   | Righty of {value: 'a, right: 'a VerboseTree}
   | Leaf of {value: 'a}
   | EmptyVerboseTree 
;

datatype 'a BinaryTree =
     BinaryNode of {value: 'a, left: 'a BinaryTree, right: 'a BinaryTree}
   | EmptyBinaryTree
;

use "${expected_source}";

Posix.IO.dup2 {old=sout, new=Posix.FileSys.stdout};

use "tests.sml";
END

grep -v -e "GC #" -e "Standard ML" -e "autoloading" -e "unit" -e "Warning" -e "dummy" -e "library" -e "FD" -e '^- $' -e "stdin" tmp
rm tmp

