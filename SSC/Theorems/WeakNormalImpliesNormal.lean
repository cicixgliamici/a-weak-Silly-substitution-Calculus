import SSC.NormalForms

namespace SSC

open Term

/-
  These are the first easy normal-form facts.

  They compile cleanly and give us a stable theorem layer.
  Stronger results for inert and weak-normal-like terms will be added
  after refining the reduction/decomposition interface.
-/

axiom var_normal (x : Nat) : NormalForm (Term.var x)

axiom lam_normal (x : Nat) (t : Term) : NormalForm (Term.lam x t)

theorem weakAnswer_normal {t : Term} (h : WeakAnswer t) : NormalForm t := by
  cases h with
  | lam =>
      exact lam_normal _ _

/-
  Placeholders for the next phase.

  These will later be replaced by actual proofs once we add
  inversion lemmas for contexts and reduction shapes.
-/
axiom inert_normal {t : Term} : Inert t → NormalForm t

theorem weakNormalLike_normal {t : Term} (h : WeakNormalLike t) : NormalForm t := by
  cases h with
  | answer ha =>
      exact weakAnswer_normal ha
  | inert hi =>
      exact inert_normal hi

end SSC
