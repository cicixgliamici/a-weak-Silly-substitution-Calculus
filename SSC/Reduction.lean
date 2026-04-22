import SSC.Decompose

/-!
# Weak Reduction Semantics

This module defines the operational semantics for the weak substitution calculus.
The semantics are split into two layers:
1. `RootStep`: The core computational steps (Multiplicative, Exponential, and GCV).
2. `Step` (`⟶`): The contextual closure of `RootStep` over weak evaluation contexts (`WCtx`).
-/

namespace SSC

open Term

/--
`RootStep` is the relation of **root reduction steps**.

These are the primitive reduction rules of the current prototype.

The three constructors model:

- `m`   : a multiplicative-style step
- `e`   : an exponential-style step
- `gcv` : garbage collection by value

This file currently provides a simplified operational core.
It is structurally inspired by the intended calculus, but it is not yet
the full paper-level metatheory.
-/
inductive RootStep : Term → Term → Prop where
  /--
  Multiplicative-style rule.

  Informally, this says that if a lambda abstraction appears inside a
  substitution context and is then applied to an argument, we can turn
  that application into an explicit substitution.
  -/
  | m :
      RootStep
        (Term.app (plugS S (Term.lam x t)) u)
        (plugS S (Term.es t x u))

  /--
  Exponential-style rule.

  Informally, this captures one step of replacing an occurrence of a
  variable inside a weak context with the term carried by the explicit
  substitution.
  -/
  | e :
      RootStep
        (Term.es (plugW C (Term.var x)) x u)
        (Term.es (plugW C u) x u)

  /--
  Garbage collection by value.

  If the substituted term is a value and the bound variable does not occur
  free in the target term, then the explicit substitution can be erased.
  -/
  | gcv :
      IsValue v →
      x ∉ fv t →
      RootStep (Term.es t x v) t

/--
`Step s t` is weak reduction from `s` to `t`.

We define weak reduction as an **existential contextual closure**
of `RootStep` under weak contexts.

So `s ⟶ t` means:
there exists a weak context `C` and a root step `r ⟶root u`
such that:

- `s = plugW C r`
- `t = plugW C u`

This formulation is convenient for early reasoning and small proofs.
-/
def Step (s t : Term) : Prop :=
  ∃ C r u, RootStep r u ∧ s = plugW C r ∧ t = plugW C u

notation:50 t " ⟶root " u => RootStep t u
notation:50 t " ⟶ " u => Step t u

/--
A term is in normal form when it has no outgoing weak reduction step.
-/
def NormalForm (t : Term) : Prop :=
  ¬ ∃ u, Step t u

/--
Any root step induces a weak step by taking the empty weak context.
-/
theorem root_implies_step {t u : Term} (h : RootStep t u) : Step t u := by
  refine ⟨WCtx.hole, t, u, h, ?_, ?_⟩
  · simp [plugW]
  · simp [plugW]

/--
A top-level multiplicative reduction step.

This is the most direct instance of the `m` rule, where the substitution
context is empty.
-/
theorem step_m_top (x : Nat) (t u : Term) :
    Term.app (Term.lam x t) u ⟶ Term.es t x u := by
  apply root_implies_step
  simpa [plugS] using (RootStep.m (S := SCtx.hole) (x := x) (t := t) (u := u))

/--
A top-level exponential reduction step.

This is the most direct instance of the `e` rule, where the weak context
is empty.
-/
theorem step_e_top (x : Nat) (u : Term) :
    Term.es (Term.var x) x u ⟶ Term.es u x u := by
  apply root_implies_step
  simpa [plugW] using (RootStep.e (C := WCtx.hole) (x := x) (u := u))

/--
A convenient specialization of the top-level exponential step,
written with the explicit-substitution notation.
-/
theorem step_e_var_top (x : Nat) (u : Term) :
    Term.es (Term.var x) x u ⟶ u[x↦u] := by
  simpa using step_e_top x u

end SSC
