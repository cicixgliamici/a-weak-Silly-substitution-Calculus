import SSC.Theorems.WeakNormalImpliesNormal

/-!
# Metatheory Regression Tests

These examples exercise the boundary between syntax and semantics. They cover every
explicit-substitution branch of the normal-form grammar, where the `fv` and `shfv` side
conditions carry mathematical meaning.
-/

namespace SSC.Tests

open Term

-- A shallow-free occurrence can be exposed by a weak context.
example : ∃ context, plugW context (var 2) = app (var 1) (var 2) := by
  apply exists_plugW_var_of_mem_shfv
  simp [shfv]

-- Decomposition also follows an occurrence in an explicit-substitution replacement.
example : ∃ context, plugW context (var 2) = es (var 1) 0 (var 2) := by
  apply exists_plugW_var_of_mem_shfv
  simp [shfv]

-- A normal answer may store an inert term when its binder is not shallow-free.
example : WeakAnswer (es (lam 0 (var 0)) 1 (var 2)) := by
  apply WeakAnswer.esInert WeakAnswer.lam Inert.var
  simp [shfv]

-- An answer-valued copy is retained only when the binder occurs below a lambda.
example : WeakAnswer (es (lam 0 (var 1)) 1 (lam 2 (var 2))) := by
  apply WeakAnswer.esAnswer WeakAnswer.lam WeakAnswer.lam
  · simp [fv]
  · simp [shfv]

-- Inert targets have the same two explicit-substitution alternatives.
example : Inert (es (var 0) 1 (var 2)) := by
  apply Inert.esInert Inert.var Inert.var
  simp [shfv]

example : Inert (es (app (var 0) (lam 3 (var 1))) 1 (lam 2 (var 2))) := by
  apply Inert.esAnswer
  · exact Inert.app Inert.var (WeakNormalLike.answer WeakAnswer.lam)
  · exact WeakAnswer.lam
  · simp [fv]
  · simp [shfv]

-- Grammar membership is sufficient to obtain semantic normality.
example : NormalForm (es (var 0) 1 (var 2)) := by
  apply weakNormalLike_normal
  exact WeakNormalLike.inert (Inert.esInert Inert.var Inert.var (by simp [shfv]))

-- A beta redex is rejected by the grammar because it has an outgoing m-step.
example : ¬ WeakNormalLike (app (lam 0 (var 0)) (var 1)) := by
  intro grammar
  have normal := weakNormalLike_normal grammar
  exact normal ⟨es (var 0) 0 (var 1), step_m_top 0 (var 0) (var 1)⟩

-- A shallow occurrence creates an e-redex, so this substitution is not normal.
example : ¬ NormalForm (es (var 0) 0 (var 1)) := by
  intro normal
  exact normal ⟨es (var 1) 0 (var 1), step_e_top 0 (var 1)⟩

-- An unused answer-valued replacement creates a gcv redex.
example : ¬ NormalForm (es (var 1) 0 (lam 2 (var 2))) := by
  intro normal
  exact normal ⟨var 1, step_gcv_top (by trivial) (by simp [fv])⟩

-- Completeness classifies semantic normality without rebuilding a grammar derivation.
example (normal : NormalForm (es (var 0) 1 (var 2))) :
    WeakNormalLike (es (var 0) 1 (var 2)) := by
  exact normal_weakNormalLike normal

end SSC.Tests
