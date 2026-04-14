import SSC.Contexts

namespace SSC

open Term

structure VarInWCtx where
  C : WCtx
  x : Nat
  proof : Term
  eqn : plugW C (Term.var x) = proof

structure LamInSCtx where
  S : SCtx
  x : Nat
  body : Term
  proof : Term
  eqn : plugS S (Term.lam x body) = proof

def HasVarHeadInWCtx (t : Term) : Prop :=
  ∃ C x, plugW C (Term.var x) = t

def HasLamInSCtx (t : Term) : Prop :=
  ∃ S x body, plugS S (Term.lam x body) = t

end SSC
