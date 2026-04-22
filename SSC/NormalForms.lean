import SSC.Reduction

/-!
# Normal Forms and Inert Terms

This module defines the syntactic structure of terms that can no longer be
evaluated under weak reduction. It introduces the mutually inductive properties
`Inert` and `WeakNormalLike`, as well as `WeakAnswer`.
-/

namespace SSC

open Term

inductive WeakAnswer : Term → Prop where
  | lam :
      WeakAnswer (Term.lam x t)

mutual

inductive Inert : Term → Prop where
  | var :
      Inert (Term.var x)

  | app :
      Inert i →
      WeakNormalLike n →
      Inert (Term.app i n)

inductive WeakNormalLike : Term → Prop where
  | answer :
      WeakAnswer a →
      WeakNormalLike a

  | inert :
      Inert i →
      WeakNormalLike i

end

/-- Promotes a `WeakAnswer` to a `WeakNormalLike` term. -/
theorem weakAnswer_to_wnl {t : Term} (h : WeakAnswer t) : WeakNormalLike t :=
  WeakNormalLike.answer h

/-- Promotes an `Inert` term to a `WeakNormalLike` term. -/
theorem inert_to_wnl {t : Term} (h : Inert t) : WeakNormalLike t :=
  WeakNormalLike.inert h

/-- A variable is always inert. -/
theorem var_inert (x : Nat) : Inert (Term.var x) :=
  Inert.var

/-- A lambda abstraction is a weak answer. -/
theorem lam_answer (x : Nat) (t : Term) : WeakAnswer (Term.lam x t) :=
  WeakAnswer.lam

/-- A lambda abstraction is weak-normal-like. -/
theorem lam_wnl (x : Nat) (t : Term) : WeakNormalLike (Term.lam x t) :=
  WeakNormalLike.answer (WeakAnswer.lam)

/-- An application of an inert term to a weak-normal-like term is inert. -/
theorem app_inert_of_inert_left {i n : Term}
    (hi : Inert i) (hn : WeakNormalLike n) :
    Inert (Term.app i n) :=
  Inert.app hi hn

/-- An inert term can never be a value (i.e., it cannot be a lambda). -/
theorem inert_not_value {t : Term} (h : Inert t) : ¬ IsValue t := by
  intro hv
  cases h with
  | var =>
      cases hv
  | app hi hn =>
      cases hv

end SSC
