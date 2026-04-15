namespace SSC

/--
`Term` is the core syntax of our small calculus.

We model four kinds of terms:

- `var x`    : a variable
- `lam x t`  : a lambda abstraction `λx.t`
- `app t u`  : an application `t u`
- `es t x u` : an explicit substitution, informally `t[x ↦ u]`

This is the main syntactic object used throughout the project.
-/
inductive Term where
  | var : Nat → Term
  | lam : Nat → Term → Term
  | app : Term → Term → Term
  | es  : Term → Nat → Term → Term
deriving DecidableEq, Repr

open Term

/--
`IsValue t` expresses whether `t` is considered a value.

In this project, as in the intended calculus, **only lambda abstractions are values**.
Variables are *not* values.
This matters for rules such as garbage collection by value.
-/
def IsValue : Term → Prop
  | lam _ _ => True
  | _       => False

/--
A simple structural size measure on terms.

This is useful for:
- sanity checks,
- simple structural inductions,
- and lightweight reasoning about syntax.
-/
def size : Term → Nat
  | var _     => 1
  | lam _ t   => 1 + size t
  | app t u   => 1 + size t + size u
  | es t _ u  => 1 + size t + size u

/--
`fv t` is the list of free variables of `t`.

This is a lightweight syntactic notion used in the project, for example
in the garbage-collection-by-value rule.

Notes:
- for `lam x t`, occurrences of `x` in `t` are bound, so we erase `x`
- for `es t x u`, the variable `x` is bound in `t` but not in `u`
-/
def fv : Term → List Nat
  | var x     => [x]
  | lam x t   => (fv t).erase x
  | app t u   => fv t ++ fv u
  | es t x u  => (fv t).erase x ++ fv u

/--
`shfv t` is the list of **shallow free variables** of `t`.

Intuitively, these are free variables that occur outside abstractions.

This notion is useful in the theory of weak reduction, where computation
does not proceed under lambda abstractions.

Notes:
- a lambda contributes no shallow free variables, because its body is under abstraction
- applications combine shallow free variables from both sides
- in `es t x u`, the variable `x` is bound in `t`
-/
def shfv : Term → List Nat
  | var x     => [x]
  | lam _ _   => []
  | app t u   => shfv t ++ shfv u
  | es t x u  => (shfv t).erase x ++ shfv u

/--
A term is `Closed` when it has no free variables.
-/
def Closed (t : Term) : Prop :=
  fv t = []

/--
Convenient notation for explicit substitutions.

Instead of writing `Term.es t x u`, we can write:

`t[x ↦ u]`
-/
notation:70 t "[" x "↦" u "]" => Term.es t x u

/--
A small recognizer for variables.

Useful in lightweight structural checks and future helper lemmas.
-/
def isVar : Term → Prop
  | var _ => True
  | _     => False

/--
A small recognizer for lambda abstractions.

Useful in lightweight structural checks and future helper lemmas.
-/
def isLam : Term → Prop
  | lam _ _ => True
  | _       => False

end SSC
