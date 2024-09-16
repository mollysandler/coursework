import os
import subprocess
import sys

SMLdefault = '/usr/local/smlnj/bin/sml'
expected_source = br'hw3.sml'


if not os.path.exists(expected_source):
   print("must provide source file '{}'".format(expected_source.decode("utf-8") ))
   sys.exit(1)

SML = os.environ.get('SML')
if not SML:
   print('$SML not set: trying default of {}'.format(SMLdefault))
   SML = SMLdefault

if not os.path.exists(SML):
   print("{} does not exist".format(SML))
   sys.exit(1)

grep_args = ["grep", "-v",
   "-e", "GC #",
   "-e", "Standard ML",
   "-e", "autoloading",
   "-e", "unit",
   "-e", "Warning",
   "-e", "dummy",
   "-e", "library",
   "-e", "FD",
   "-e", "stdin",
   "-e", "^- $"]

bootstrap = br'''
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

use "''' + expected_source + br'''";

Posix.IO.dup2 {old=sout, new=Posix.FileSys.stdout};

use "tests.sml";
'''

grep = subprocess.Popen(grep_args, bufsize=-1, stdin=subprocess.PIPE)
sml = subprocess.Popen(SML, bufsize=-1, stdin=subprocess.PIPE, stdout=grep.stdin, stderr=subprocess.STDOUT)
sml.communicate(bootstrap)
grep.communicate()
