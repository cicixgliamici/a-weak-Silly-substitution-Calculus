import SSC.Contexts

/-!
# Structural Decomposition of Terms

This module provides experimental helper structures for decomposing terms into
evaluation contexts and subterms. These are intended to be used in advanced
proofs (e.g., normal form properties or equivalence theorems) where we need to
statically assert that a term has a specific shape.
-/

namespace SSC

open Term

/-- Represents a term that is exactly a variable plugged into a weak context. -/
structure VarInWCtx where
  C : WCtx
  x : Nat
  proof : Term
  eqn : plugW C (Term.var x) = proof

/-- Represents a term that is exactly a lambda abstraction plugged into a substitution context. -/
structure LamInSCtx where
  S : SCtx
  x : Nat
  body : Term
  proof : Term
  eqn : plugS S (Term.lam x body) = proof

/-- Predicate stating that a term can be decomposed into a variable inside a weak context. -/
def hasVarHeadInWCtx (t : Term) : Prop :=
  ∃ C x, plugW C (Term.var x) = t

/-- Predicate stating that a term can be decomposed into a lambda inside a substitution context. -/
def hasLamInSCtx (t : Term) : Prop :=
  ∃ S x body, plugS S (Term.lam x body) = t

end SSC
