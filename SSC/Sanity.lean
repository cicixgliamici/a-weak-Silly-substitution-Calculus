import SSC.Reduction

namespace SSC

open Term

#eval size (Term.var 3)
#eval size (Term.app (Term.var 1) (Term.var 2))
#eval fv (Term.lam 0 (Term.app (Term.var 0) (Term.var 2)))
#eval shfv (Term.lam 0 (Term.app (Term.var 0) (Term.var 2)))

example : plugW WCtx.hole (Term.var 5) = Term.var 5 := by
  rfl

example :
    plugW (WCtx.appL WCtx.hole (Term.var 9)) (Term.var 1)
      = Term.app (Term.var 1) (Term.var 9) := by
  rfl

end SSC
