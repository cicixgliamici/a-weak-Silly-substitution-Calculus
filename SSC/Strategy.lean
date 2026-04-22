import SSC.Reduction

namespace SSC

open Term

/--
A Strict Answer `a_s` is a normal form for the CbS strategy.
It is either a value (an abstraction) or a strict answer substituted into a strict answer,
where the substituted variable occurs free in the target strict answer.
-/
inductive StrictAnswer : Term → Prop where
  | val : IsValue t → StrictAnswer t
  | es  : StrictAnswer t → StrictAnswer u → x ∈ fv t → StrictAnswer (Term.es t x u)

/--
`NCtx` is the type of **Name contexts** (CbN evaluation contexts).
These contexts only allow evaluation on the left of an application
or in the body of an explicit substitution.
-/
inductive NCtx where
  | hole : NCtx
  | appL : NCtx → Term → NCtx
  | esL  : NCtx → Nat → Term → NCtx
deriving DecidableEq, Repr

/--
`plugN N t` fills the hole of a name context `N` with the term `t`.
-/
def plugN : NCtx → Term → Term
  | NCtx.hole,      t => t
  | NCtx.appL N u,  t => Term.app (plugN N t) u
  | NCtx.esL N x u, t => Term.es (plugN N t) x u

/--
`ACtx` is the type of **Auxiliary contexts**.
These contexts allow evaluation to enter an explicit substitution only
if the target term is a strict answer and the substituted variable
has no shallow free occurrences in it.
-/
inductive ACtx where
  | hole : ACtx
  | esR  : (a : Term) → StrictAnswer a → (x : Nat) → x ∉ shfv a → ACtx → ACtx

/--
`plugA A t` fills the hole of an auxiliary context `A` with the term `t`.
-/
def plugA : ACtx → Term → Term
  | ACtx.hole,             t => t
  | ACtx.esR a _ x _ A,    t => Term.es a x (plugA A t)

/--
`YCtx` is the type of **Silly contexts** (CbS evaluation contexts).
A silly context `Y` is rigorously defined as an auxiliary context `A`
wrapped around a name context `N`, written `A⟨N⟩`.
-/
inductive YCtx where
  | mk : ACtx → NCtx → YCtx

/--
`plugY Y t` fills the hole of a silly context `Y` with the term `t`.
-/
def plugY : YCtx → Term → Term
  | YCtx.mk A N, t => plugA A (plugN N t)

/--
`toWCtxN` converts an NCtx to a generic WCtx.
-/
def toWCtxN : NCtx → WCtx
  | NCtx.hole      => WCtx.hole
  | NCtx.appL N u  => WCtx.appL (toWCtxN N) u
  | NCtx.esL N x u => WCtx.esL (toWCtxN N) x u

/--
`toWCtxA` converts an ACtx to a generic WCtx.
-/
def toWCtxA : ACtx → WCtx
  | ACtx.hole             => WCtx.hole
  | ACtx.esR a _ x _ A    => WCtx.esR a x (toWCtxA A)

/--
`toWCtxY` converts a YCtx to a generic WCtx.
-/
def toWCtxY : YCtx → WCtx
  | YCtx.mk A N => composeW (toWCtxA A) (toWCtxN N)

/--
The `YStep` relation defines the **Call-by-Silly strategy** ($\to_{\mathtt{y}}$).
It consists of four precise rules.
-/
inductive YStep : Term → Term → Prop where
  /-- Multiplicative step in a silly context. -/
  | y_m :
      YStep (plugY Y (Term.app (plugS S (Term.lam x t)) u))
            (plugY Y (plugS S (Term.es t x u)))

  /-- Exponential step where occurrence is selected by A and applied in Y. -/
  | y_eAY :
      YStep (plugY Y (Term.es (plugA A (Term.var x)) x u))
            (plugY Y (Term.es (plugA A u) x u))

  /-- Exponential step where occurrence is selected by Y and applied in N. -/
  | y_eYN :
      YStep (plugN N (Term.es (plugY Y (Term.var x)) x u))
            (plugN N (Term.es (plugY Y u) x u))

  /-- Garbage collection by value in a silly context. -/
  | y_gcv :
      IsValue v → x ∉ fv t →
      YStep (plugY Y (Term.es t x v))
            (plugY Y t)

notation:50 t " ⟶y " u => YStep t u

end SSC
