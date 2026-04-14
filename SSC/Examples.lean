import SSC.Reduction

namespace SSC

open Term

def idTerm : Term :=
  Term.lam 0 (Term.var 0)

def constTerm : Term :=
  Term.lam 0 (Term.lam 1 (Term.var 0))

def exM : Term :=
  Term.app (Term.lam 0 (Term.var 0)) (Term.var 7)

example : exM ⟶ Term.es (Term.var 0) 0 (Term.var 7) := by
  exact step_m_top 0 (Term.var 0) (Term.var 7)

def exE : Term :=
  Term.es (Term.var 3) 3 (Term.var 9)

example : exE ⟶ Term.es (Term.var 9) 3 (Term.var 9) := by
  exact step_e_top 3 (Term.var 9)

def exGC : Term :=
  Term.es (Term.var 4) 0 idTerm

example : exGC ⟶ Term.var 4 := by
  apply root_implies_step
  apply RootStep.gcv
  · trivial
  · simp [fv]

def exCtx : Term :=
  Term.app exM (Term.var 99)

example : exCtx ⟶ Term.app (Term.es (Term.var 0) 0 (Term.var 7)) (Term.var 99) := by
  change plugW (WCtx.appL WCtx.hole (Term.var 99)) exM ⟶
    plugW (WCtx.appL WCtx.hole (Term.var 99)) (Term.es (Term.var 0) 0 (Term.var 7))
  apply Step.ctx
  simpa [exM, plugW, plugS] using
    (RootStep.m (S := SCtx.hole) (x := 0) (t := Term.var 0) (u := Term.var 7))

end SSC
