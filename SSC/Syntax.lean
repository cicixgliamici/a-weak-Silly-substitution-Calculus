namespace SSC

inductive Term where
  | var : Nat → Term
  | lam : Nat → Term → Term
  | app : Term → Term → Term
  | es  : Term → Nat → Term → Term
deriving DecidableEq, Repr

open Term

def IsValue : Term → Prop
  | lam _ _ => True
  | _       => False

def size : Term → Nat
  | var _     => 1
  | lam _ t   => 1 + size t
  | app t u   => 1 + size t + size u
  | es t _ u  => 1 + size t + size u

def fv : Term → List Nat
  | var x     => [x]
  | lam x t   => (fv t).erase x
  | app t u   => fv t ++ fv u
  | es t x u  => (fv t).erase x ++ fv u

def shfv : Term → List Nat
  | var x     => [x]
  | lam _ _   => []
  | app t u   => shfv t ++ shfv u
  | es t x u  => (shfv t).erase x ++ fv u

def Closed (t : Term) : Prop :=
  fv t = []

notation:70 t "[" x "↦" u "]" => Term.es t x u

def isVar : Term → Prop
  | var _ => True
  | _     => False

def isLam : Term → Prop
  | lam _ _ => True
  | _       => False

end SSC
