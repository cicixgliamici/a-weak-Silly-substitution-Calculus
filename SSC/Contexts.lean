import SSC.Syntax

namespace SSC

open Term

inductive WCtx where
  | hole : WCtx
  | appL : WCtx → Term → WCtx
  | appR : Term → WCtx → WCtx
  | esL  : WCtx → Nat → Term → WCtx
  | esR  : Term → Nat → WCtx → WCtx
deriving DecidableEq, Repr

inductive SCtx where
  | hole : SCtx
  | es   : SCtx → Nat → Term → SCtx
deriving DecidableEq, Repr

open WCtx
open SCtx

def plugW : WCtx → Term → Term
  | hole,        t => t
  | appL C u,    t => Term.app (plugW C t) u
  | appR s C,    t => Term.app s (plugW C t)
  | esL C x u,   t => Term.es (plugW C t) x u
  | esR s x C,   t => Term.es s x (plugW C t)

def plugS : SCtx → Term → Term
  | hole,      t => t
  | es S x u,  t => Term.es (plugS S t) x u

@[simp] theorem plugW_hole (t : Term) : plugW WCtx.hole t = t := rfl
@[simp] theorem plugS_hole (t : Term) : plugS SCtx.hole t = t := rfl

def composeW : WCtx → WCtx → WCtx
  | WCtx.hole,      D => D
  | WCtx.appL C u,  D => WCtx.appL (composeW C D) u
  | WCtx.appR s C,  D => WCtx.appR s (composeW C D)
  | WCtx.esL C x u, D => WCtx.esL (composeW C D) x u
  | WCtx.esR s x C, D => WCtx.esR s x (composeW C D)

@[simp] theorem plugW_compose (C D : WCtx) (t : Term) :
    plugW (composeW C D) t = plugW C (plugW D t) := by
  induction C with
  | hole => rfl
  | appL C u ih => simp [composeW, plugW, ih]
  | appR s C ih => simp [composeW, plugW, ih]
  | esL C x u ih => simp [composeW, plugW, ih]
  | esR s x C ih => simp [composeW, plugW, ih]

end SSC
