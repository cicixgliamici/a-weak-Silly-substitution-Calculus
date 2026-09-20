import SSC.Reduction
import SSC.Strategy

namespace SSC.Tests

open Term

-- Multi-step weak reduction (x[x ↦ u] ⟶ u[x ↦ u])
example : (var 0)[0 ↦ var 1] ⟶ (var 1)[0 ↦ var 1] := by
  exact step_e_var_top 0 (var 1)

-- Top-level multiplicative reduction ((λx.x) y ⟶ x[x ↦ y])
example : app (lam 0 (var 0)) (var 1) ⟶ (var 0)[0 ↦ var 1] := by
  exact step_m_top 0 (var 0) (var 1)

-- Garbage collection by value (y[x ↦ (λz.z)] ⟶ y)
example : (var 1)[0 ↦ lam 2 (var 2)] ⟶ var 1 := by
  apply step_gcv_top
  · trivial
  · simp [fv]

-- Multiplicative silly reduction: YCtx.hole around a top-level application
example : app (lam 0 (var 0)) (var 1) ⟶y (var 0)[0 ↦ var 1] := by
  apply YStep.y_m (Y := YCtx.mk ACtx.hole NCtx.hole) (S := SCtx.hole)

-- Paper-faithful GCV preserves substitutions surrounding the discarded value.
example :
    es (var 2) 0 (es (lam 3 (var 3)) 4 (var 9)) ⟶
      es (var 2) 4 (var 9) := by
  apply root_implies_step
  apply RootStep.gcv
  apply GCVRootStep.intro (S := SCtx.es SCtx.hole 4 (var 9))
  · trivial
  · simp [fv]

-- Labels expose the rule family without changing the generic reduction relation.
example : app (lam 0 (var 0)) (var 1) ⟶m (var 0)[0 ↦ var 1] := by
  refine ⟨WCtx.hole, app (lam 0 (var 0)) (var 1), es (var 0) 0 (var 1),
    ?_, by simp [plugW], by simp [plugW]⟩
  simpa [plugS] using
    (MRootStep.intro (S := SCtx.hole) (x := 0)
      (body := var 0) (argument := var 1))

-- The CbS strategy is formally proved to be contained in weak SSC reduction.
example {source target : Term} (h : source ⟶y target) : source ⟶ target := by
  exact yStep_implies_step h

end SSC.Tests
