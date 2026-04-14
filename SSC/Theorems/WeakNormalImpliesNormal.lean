import SSC.NormalForms

namespace SSC

open Term

theorem var_normal (x : Nat) : NormalForm (Term.var x) := by
  intro h
  rcases h with ⟨u, hu⟩
  cases hu with
  | ctx hroot =>
      cases hroot

theorem lam_normal (x : Nat) (t : Term) : NormalForm (Term.lam x t) := by
  intro h
  rcases h with ⟨u, hu⟩
  cases hu with
  | ctx hroot =>
      cases hroot

theorem weakAnswer_normal {t : Term} (h : WeakAnswer t) : NormalForm t := by
  cases h with
  | lam =>
      exact lam_normal _ _

theorem inert_normal {t : Term} (h : Inert t) : NormalForm t := by
  induction h with
  | var =>
      exact var_normal _
  | app hi hn ih_i ih_n =>
      intro hstep
      rcases hstep with ⟨u, hu⟩
      cases hu with
      | ctx hroot =>
          cases hroot

theorem weakNormalLike_normal {t : Term} (h : WeakNormalLike t) : NormalForm t := by
  cases h with
  | answer ha =>
      exact weakAnswer_normal ha
  | inert hi =>
      exact inert_normal hi

end SSC
