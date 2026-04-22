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
  apply root_implies_step
  apply RootStep.gcv
  · trivial
  · simp [fv]

-- Multiplicative silly reduction: YCtx.hole around a top-level application
example : app (lam 0 (var 0)) (var 1) ⟶y (var 0)[0 ↦ var 1] := by
  apply YStep.y_m (Y := YCtx.mk ACtx.hole NCtx.hole) (S := SCtx.hole)

end SSC.Tests
