import SSC.Reduction

namespace SSC

open Term

inductive WeakAnswer : Term → Prop where
  | lam :
      WeakAnswer (Term.lam x t)

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

theorem weakAnswer_to_wnl {t : Term} (h : WeakAnswer t) : WeakNormalLike t :=
  WeakNormalLike.answer h

theorem inert_to_wnl {t : Term} (h : Inert t) : WeakNormalLike t :=
  WeakNormalLike.inert h

theorem var_inert (x : Nat) : Inert (Term.var x) :=
  Inert.var

theorem lam_answer (x : Nat) (t : Term) : WeakAnswer (Term.lam x t) :=
  WeakAnswer.lam

theorem lam_wnl (x : Nat) (t : Term) : WeakNormalLike (Term.lam x t) :=
  WeakNormalLike.answer (WeakAnswer.lam)

theorem app_inert_of_inert_left {i n : Term}
    (hi : Inert i) (hn : WeakNormalLike n) :
    Inert (Term.app i n) :=
  Inert.app hi hn

theorem inert_not_value {t : Term} (h : Inert t) : ¬ IsValue t := by
  intro hv
  cases h with
  | var =>
      cases hv
  | app hi hn =>
      cases hv

end SSC
