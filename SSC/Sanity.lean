import SSC.Reduction
import SSC.Examples

namespace SSC

open Term

/-
  Basic computational sanity checks
-/

#eval size (Term.var 3)
#eval size (Term.app (Term.var 1) (Term.var 2))
#eval fv (Term.lam 0 (Term.app (Term.var 0) (Term.var 2)))
#eval shfv (Term.lam 0 (Term.app (Term.var 0) (Term.var 2)))

/-
  Basic plugging checks for weak contexts
-/

example : plugW WCtx.hole (Term.var 5) = Term.var 5 := by
  rfl

example :
    plugW (WCtx.appL WCtx.hole (Term.var 9)) (Term.var 1)
      = Term.app (Term.var 1) (Term.var 9) := by
  rfl

example :
    plugW (WCtx.appR (Term.var 8) WCtx.hole) (Term.var 1)
      = Term.app (Term.var 8) (Term.var 1) := by
  rfl

example :
    plugW (WCtx.esL WCtx.hole 0 (Term.var 7)) (Term.var 3)
      = Term.es (Term.var 3) 0 (Term.var 7) := by
  rfl

example :
    plugW (WCtx.esR (Term.var 3) 0 WCtx.hole) (Term.var 7)
      = Term.es (Term.var 3) 0 (Term.var 7) := by
  rfl

/-
  Basic plugging checks for substitution contexts
-/

example : plugS SCtx.hole (Term.var 4) = Term.var 4 := by
  rfl

example :
    plugS (SCtx.es SCtx.hole 0 (Term.var 7)) (Term.var 3)
      = Term.es (Term.var 3) 0 (Term.var 7) := by
  rfl

example :
    plugS (SCtx.es (SCtx.es SCtx.hole 0 (Term.var 7)) 1 (Term.var 8)) (Term.var 3)
      = Term.es (Term.es (Term.var 3) 0 (Term.var 7)) 1 (Term.var 8) := by
  rfl

/-
  Composition sanity check for weak contexts
-/

example :
    composeW (WCtx.appL WCtx.hole (Term.var 9))
             (WCtx.esL WCtx.hole 0 (Term.var 7))
    =
    WCtx.appL (WCtx.esL WCtx.hole 0 (Term.var 7)) (Term.var 9) := by
  rfl

example :
    plugW
      (composeW (WCtx.appL WCtx.hole (Term.var 9))
                (WCtx.esL WCtx.hole 0 (Term.var 7)))
      (Term.var 1)
    =
    plugW (WCtx.appL WCtx.hole (Term.var 9))
      (plugW (WCtx.esL WCtx.hole 0 (Term.var 7)) (Term.var 1)) := by
  simp

/-
  Value sanity checks
-/

example : IsValue (Term.lam 0 (Term.var 0)) := by
  trivial

example : ¬ IsValue (Term.var 0) := by
  intro h
  cases h

example : ¬ IsValue (Term.app (Term.var 0) (Term.var 1)) := by
  intro h
  cases h

/-
  Root reduction sanity checks through existing examples
-/

example : exM ⟶ Term.es (Term.var 0) 0 (Term.var 7) := by
  exact step_m_top 0 (Term.var 0) (Term.var 7)

example : exE ⟶ Term.es (Term.var 9) 3 (Term.var 9) := by
  exact step_e_top 3 (Term.var 9)

example : exGC ⟶ Term.var 4 := by
  apply root_implies_step
  apply RootStep.gcv
  · trivial
  · simp [fv]

/-
  Normal-form sanity checks for easy cases
-/

example : NormalForm (Term.var 10) := by
  exact var_normal 10

example : NormalForm (Term.lam 0 (Term.var 0)) := by
  exact lam_normal 0 (Term.var 0)

end SSC
