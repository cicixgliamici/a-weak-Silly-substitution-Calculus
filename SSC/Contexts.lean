import SSC.Syntax

/-!
# Weak and Substitution Contexts

This module defines the various evaluation contexts used to propagate reduction.
In explicit substitution calculi, context definitions are critical to control
precisely where evaluation is allowed to happen.

We define:
- `WCtx`: Weak evaluation contexts (disallowing reduction inside lambda abstractions).
- `SCtx`: Substitution contexts (lists of explicit substitutions).
-/

namespace SSC

open Term

/--
`WCtx` is the type of **weak contexts**.

A weak context is a term with exactly one hole, and the hole is never placed
under a lambda abstraction.

This matches the weak setting of the project: reduction is allowed in many
positions, but not under abstractions.

The constructors describe the possible positions of the hole:

- `hole`        : the empty context
- `appL C u`    : the hole appears on the left of an application
- `appR s C`    : the hole appears on the right of an application
- `esL C x u`   : the hole appears in the body of an explicit substitution
- `esR s x C`   : the hole appears in the substituted term
-/
inductive WCtx where
  | hole : WCtx
  | appL : WCtx → Term → WCtx
  | appR : Term → WCtx → WCtx
  | esL  : WCtx → Nat → Term → WCtx
  | esR  : Term → Nat → WCtx → WCtx
deriving DecidableEq, Repr

/--
`SCtx` is the type of **substitution contexts**.

A substitution context is a chain of explicit substitutions wrapped around a hole.

Intuitively, these are contexts of the form:

- `⟨·⟩`
- `⟨·⟩[x ↦ u]`
- `⟨·⟩[x ↦ u][y ↦ v]`
- and so on

They are useful for expressing reduction rules that act under explicit
substitutions, such as the multiplicative rule.
-/
inductive SCtx where
  | hole : SCtx
  | es   : SCtx → Nat → Term → SCtx
deriving DecidableEq, Repr

/--
`plugW C t` fills the hole of a weak context `C` with the term `t`.

This is the basic operation that turns a context back into an ordinary term.
It is used heavily in the definition of weak reduction.
-/
def plugW : WCtx → Term → Term
  | WCtx.hole,        t => t
  | WCtx.appL C u,    t => Term.app (plugW C t) u
  | WCtx.appR s C,    t => Term.app s (plugW C t)
  | WCtx.esL C x u,   t => Term.es (plugW C t) x u
  | WCtx.esR s x C,   t => Term.es s x (plugW C t)

/--
`plugS S t` fills the hole of a substitution context `S` with the term `t`.

So if `S` is a chain of explicit substitutions, `plugS S t` places `t`
inside that chain.
-/
def plugS : SCtx → Term → Term
  | SCtx.hole,      t => t
  | SCtx.es S x u,  t => Term.es (plugS S t) x u

/--
Plugging a term into the empty weak context returns the term itself.
-/
@[simp] theorem plugW_hole (t : Term) : plugW WCtx.hole t = t := rfl

/--
Plugging a term into the empty substitution context returns the term itself.
-/
@[simp] theorem plugS_hole (t : Term) : plugS SCtx.hole t = t := rfl

/--
`composeW C D` composes two weak contexts.

The intended meaning is:

- first plug a term into `D`
- then plug the result into `C`

So `composeW C D` is the weak context obtained by replacing the hole of `C`
with the whole context `D`.
-/
def composeW : WCtx → WCtx → WCtx
  | WCtx.hole,       D => D
  | WCtx.appL C u,   D => WCtx.appL (composeW C D) u
  | WCtx.appR s C,   D => WCtx.appR s (composeW C D)
  | WCtx.esL C x u,  D => WCtx.esL (composeW C D) x u
  | WCtx.esR s x C,  D => WCtx.esR s x (composeW C D)

/--
Plugging into a composed weak context is the same as plugging in two steps.

In other words:

`plugW (composeW C D) t = plugW C (plugW D t)`

This is a basic structural lemma that makes context manipulation easier later.
-/
@[simp] theorem plugW_compose (C D : WCtx) (t : Term) :
    plugW (composeW C D) t = plugW C (plugW D t) := by
  induction C with
  | hole =>
      rfl
  | appL C u ih =>
      simp [composeW, plugW, ih]
  | appR s C ih =>
      simp [composeW, plugW, ih]
  | esL C x u ih =>
      simp [composeW, plugW, ih]
  | esR s x C ih =>
      simp [composeW, plugW, ih]

end SSC
