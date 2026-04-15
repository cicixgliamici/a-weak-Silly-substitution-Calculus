import SSC.NormalForms

namespace SSC

open Term

theorem var_normal (x : Nat) : NormalForm (Term.var x) := by
  intro h
  rcases h with ⟨u, C, r, s, hroot, hs, ht⟩
  cases C <;> simp [plugW] at hs

theorem lam_normal (x : Nat) (t : Term) : NormalForm (Term.lam x t) := by
  intro h
  rcases h with ⟨u, C, r, s, hroot, hs, ht⟩
  cases C <;> simp [plugW] at hs

theorem weakAnswer_normal {t : Term} (h : WeakAnswer t) : NormalForm t := by
  cases h with
  | lam =>
      exact lam_normal _ _

/-
  Still postponed for the next step.
  These require induction over the mutual grammar plus a few shape lemmas.
-/
axiom inert_normal {t : Term} : Inert t → NormalForm t

theorem weakNormalLike_normal {t : Term} (h : WeakNormalLike t) : NormalForm t := by
  cases h with
  | answer ha =>
      exact weakAnswer_normal ha
  | inert hi =>
      exact inert_normal hi

end SSC
