val prog =
  PROGRAM
    {classes=[{decls=["a"],
               funcs=[("f",{body=[],decls=[],params=[]}),
                      ("a",{body=[],decls=[],params=[]})],name="A",super=NONE}],
     decls=[],funcs=[],stmts=[ST_EXP {exp=EXP_NEW {class="A"}}]} : program
;
