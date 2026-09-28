import SSC.Reduction

/-!
# Normal Forms and Inert Terms

This module defines the grammar of weak normal forms from Proposition 4.2. The side
conditions on explicit substitutions separately exclude exponential and value-garbage-
collection redexes.
-/

namespace SSC

open Term

mutual

/--
Weak answers are values possibly followed by normal explicit substitutions.

The two substitution constructors are separate because an inert replacement can never
trigger value garbage collection, while an answer replacement can. In the latter case,
the occurrence condition keeps the substitution relevant.
-/
inductive WeakAnswer : Term → Prop where
  | lam : WeakAnswer (Term.lam x t)

  | esInert :
      WeakAnswer body →
      Inert replacement →
      x ∉ shfv body →
      WeakAnswer (Term.es body x replacement)

  | esAnswer :
      WeakAnswer body →
      WeakAnswer replacement →
      x ∈ fv body →
      x ∉ shfv body →
      WeakAnswer (Term.es body x replacement)

/--
Inert terms are variable-headed normal forms. They cannot become the function of a
multiplicative redex, even after peeling a substitution context.
-/
inductive Inert : Term → Prop where
  | var :
      Inert (Term.var x)

  | app :
      Inert i →
      WeakNormalLike n →
      Inert (Term.app i n)

  | esInert :
      Inert body →
      Inert replacement →
      x ∉ shfv body →
      Inert (Term.es body x replacement)

  | esAnswer :
      Inert body →
      WeakAnswer replacement →
      x ∈ fv body →
      x ∉ shfv body →
      Inert (Term.es body x replacement)

/-- The complete syntactic classification of weak normal forms. -/
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
  | esInert body replacement unused =>
      cases hv
  | esAnswer body replacement occurs unused =>
      cases hv

end SSC
