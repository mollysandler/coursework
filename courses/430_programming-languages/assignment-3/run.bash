#!/bin/bash

defaultSML=/home/akeen/public/ml/bin/sml
expected_source=hw3.sml


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

datatype arith_expression =
   AE_NUM of int
 | AE_PLUS of arith_expression * arith_expression
 | AE_MINUS of arith_expression * arith_expression
 | AE_TIMES of arith_expression * arith_expression
 | AE_DIVIDE of arith_expression * arith_expression
;

datatype mixed_expression =
   ME_NUM of int
 | ME_PLUS of mixed_expression * mixed_expression
 | ME_TIMES of mixed_expression * mixed_expression
 | ME_LESSTHAN of mixed_expression * mixed_expression
;

datatype var_expression =
   VE_NUM of int
 | VE_ID of string
 | VE_PLUS of var_expression * var_expression
 | VE_TIMES of var_expression * var_expression
;

datatype operator =
   OP_PLUS
 | OP_TIMES
;

datatype expression =
   NUM of int
 | ID of string
 | BINARY of {opr:operator, lft:expression, rht:expression}
 | FUNCTION of {parameter:string, body: expression}
 | CALL of {func:expression, argument:expression}
;

use "${expected_source}";

Posix.IO.dup2 {old=sout, new=Posix.FileSys.stdout};

use "tests.sml";
END

grep -v -e "GC #" -e "Standard ML" -e "autoloading" -e "unit" -e "Warning" -e "dummy" -e "library" -e "FD" -e '^- $' -e "stdin" tmp
rm tmp
