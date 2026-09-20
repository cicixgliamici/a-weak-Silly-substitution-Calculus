/-!
# Abstract Syntax Tree of the Weak Silly Substitution Calculus

This module defines terms, finite sets of variable names, free-variable analyses,
fresh names, renaming, and capture-avoiding meta-level substitution.
-/

namespace SSC

/-- Terms of the calculus, including explicit substitutions. -/
inductive Term where
  | var : Nat → Term
  | lam : Nat → Term → Term
  | app : Term → Term → Term
  | es  : Term → Nat → Term → Term
deriving DecidableEq, Repr

open Term

/--
Finite sets of variable names.

The project deliberately stays dependency-free, so a finite set is represented by a
duplicate-free list. The operations below preserve that invariant and provide the small
set API required by the formalization.
-/
abbrev VarSet := List Nat

namespace VarSet

/-- Insert a name unless it is already present. -/
def insert (x : Nat) (xs : VarSet) : VarSet :=
  if x ∈ xs then xs else x :: xs

/-- Remove every occurrence of a name, not just the first one. -/
def erase (x : Nat) (xs : VarSet) : VarSet :=
  xs.filter (· != x)

/-- Set union, preserving the no-duplicates invariant. -/
def union (xs ys : VarSet) : VarSet :=
  xs.foldr insert ys

@[simp] theorem mem_insert {x y : Nat} {xs : VarSet} :
    x ∈ insert y xs ↔ x = y ∨ x ∈ xs := by
  simp only [insert]
  split <;> simp_all

@[simp] theorem mem_erase {x y : Nat} {xs : VarSet} :
    x ∈ erase y xs ↔ x ≠ y ∧ x ∈ xs := by
  simp [erase, and_comm]

@[simp] theorem mem_union {x : Nat} {xs ys : VarSet} :
    x ∈ union xs ys ↔ x ∈ xs ∨ x ∈ ys := by
  induction xs with
  | nil => simp [union]
  | cons head tail ih =>
      unfold union
      simp only [List.foldr, mem_insert, List.mem_cons]
      have tailMembership :
          x ∈ List.foldr insert ys tail ↔ x ∈ tail ∨ x ∈ ys := by
        simpa [union] using ih
      simp [tailMembership, or_assoc]

/-- Insertion preserves the finite-set representation invariant. -/
theorem nodup_insert {x : Nat} {xs : VarSet} (hxs : xs.Nodup) :
    (insert x xs).Nodup := by
  simp only [insert]
  split
  · exact hxs
  · exact List.nodup_cons.mpr ⟨by assumption, hxs⟩

/-- Removing a name preserves the finite-set representation invariant. -/
theorem nodup_erase {x : Nat} {xs : VarSet} (hxs : xs.Nodup) :
    (erase x xs).Nodup := by
  exact hxs.filter _

/-- Union preserves the finite-set representation invariant. -/
theorem nodup_union {xs ys : VarSet} (hxs : xs.Nodup) (hys : ys.Nodup) :
    (union xs ys).Nodup := by
  induction xs with
  | nil => exact hys
  | cons head tail ih =>
      simp only [union, List.foldr]
      apply nodup_insert
      apply ih
      exact hxs.tail

end VarSet

/-- Only lambda abstractions are values in the SSC. -/
def IsValue : Term → Prop
  | lam _ _ => True
  | _       => False

/-- Structural size of a term. -/
def size : Term → Nat
  | var _     => 1
  | lam _ t   => 1 + size t
  | app t u   => 1 + size t + size u
  | es t _ u  => 1 + size t + size u

/-- The finite set of free variables of a term. -/
def fv : Term → VarSet
  | var x     => [x]
  | lam x t   => VarSet.erase x (fv t)
  | app t u   => VarSet.union (fv t) (fv u)
  | es t x u  => VarSet.union (VarSet.erase x (fv t)) (fv u)

/-- The free variables occurring outside lambda abstractions. -/
def shfv : Term → VarSet
  | var x     => [x]
  | lam _ _   => []
  | app t u   => VarSet.union (shfv t) (shfv u)
  | es t x u  => VarSet.union (VarSet.erase x (shfv t)) (shfv u)

/-- A term is closed when its finite set of free variables is empty. -/
def Closed (t : Term) : Prop :=
  fv t = []

/-- Closedness is decidable because `fv` is a computable finite set. -/
instance closedDecidable (t : Term) : Decidable (Closed t) :=
  if h : fv t = [] then isTrue h else isFalse h

/-- Convenient notation for explicit substitutions. -/
notation:70 t "[" x "↦" u "]" => Term.es t x u

/-- Maximum name occurring in a term, including binder names. -/
def maxName : Term → Nat
  | var x     => x
  | lam x t   => max x (maxName t)
  | app t u   => max (maxName t) (maxName u)
  | es t x u  => max x (max (maxName t) (maxName u))

/-- Produce a name fresh for both terms. -/
def freshName (t u : Term) : Nat :=
  max (maxName t) (maxName u) + 1

/--
Rename occurrences bound by the surrounding binder from `oldName` to `newName`.

An inner binder using `oldName` shadows the surrounding binder, so recursion stops in
its scope. In an explicit substitution the binder scopes only over the target term.

This low-level operation assumes that `newName` is fresh for the renamed scope. The public
capture-avoiding substitution satisfies that precondition with `freshName`.
-/
def renameBound (oldName newName : Nat) : Term → Term
  | var x =>
      if x = oldName then var newName else var x
  | lam x body =>
      if x = oldName then lam x body
      else lam x (renameBound oldName newName body)
  | app function argument =>
      app (renameBound oldName newName function)
          (renameBound oldName newName argument)
  | es body x replacement =>
      let renamedBody :=
        if x = oldName then body else renameBound oldName newName body
      es renamedBody x (renameBound oldName newName replacement)

/--
Fuelled capture-avoiding substitution.

Fuel makes termination explicit when a conflicting binder must first be alpha-renamed.
The public `subst` operation supplies the structural size of the source term.

The binder cases follow this decision ladder:

```text
binder shadows the substituted name -> keep the scoped body unchanged
no capture risk                       -> recurse under the binder
capture risk                          -> choose fresh, rename binder, then recurse
```

For `es body y argument`, `y` binds only in `body`; substitution always continues in
`argument`. This asymmetry is the main reason the case is written out explicitly.
-/
def substFuel : Nat → Term → Nat → Term → Term
  | 0, term, _, _ => term
  | _fuel + 1, var y, x, replacement =>
      if y = x then replacement else var y
  | fuel + 1, lam y body, x, replacement =>
      if y = x then
        lam y body
      else if y ∈ fv replacement then
        let fresh := freshName body replacement
        lam fresh (substFuel fuel (renameBound y fresh body) x replacement)
      else
        lam y (substFuel fuel body x replacement)
  | fuel + 1, app function argument, x, replacement =>
      app (substFuel fuel function x replacement)
          (substFuel fuel argument x replacement)
  | fuel + 1, es body y argument, x, replacement =>
      let substitutedArgument := substFuel fuel argument x replacement
      if y = x then
        es body y substitutedArgument
      else if y ∈ fv replacement then
        let fresh := freshName body replacement
        es (substFuel fuel (renameBound y fresh body) x replacement)
           fresh substitutedArgument
      else
        es (substFuel fuel body x replacement) y substitutedArgument

/-- Capture-avoiding meta-level substitution `term{x ↦ replacement}`. -/
def subst (term : Term) (x : Nat) (replacement : Term) : Term :=
  substFuel (size term) term x replacement

/-- Capture-avoiding renaming of a free variable. -/
def renameFree (term : Term) (oldName newName : Nat) : Term :=
  subst term oldName (var newName)

@[simp] theorem mem_var_fv (x y : Nat) : x ∈ fv (var y) ↔ x = y := by
  simp [fv]

@[simp] theorem mem_lam_fv (x y : Nat) (body : Term) :
    x ∈ fv (lam y body) ↔ x ≠ y ∧ x ∈ fv body := by
  simp [fv]

@[simp] theorem mem_app_fv (x : Nat) (function argument : Term) :
    x ∈ fv (app function argument) ↔ x ∈ fv function ∨ x ∈ fv argument := by
  simp [fv]

@[simp] theorem mem_es_fv (x y : Nat) (body replacement : Term) :
    x ∈ fv (es body y replacement) ↔
      (x ≠ y ∧ x ∈ fv body) ∨ x ∈ fv replacement := by
  simp [fv]

/-- `fv` always satisfies the duplicate-free representation invariant. -/
theorem fv_nodup (term : Term) : (fv term).Nodup := by
  induction term with
  | var x => simp [fv]
  | lam x body ih =>
      exact VarSet.nodup_erase ih
  | app function argument functionIH argumentIH =>
      exact VarSet.nodup_union functionIH argumentIH
  | es body x replacement bodyIH replacementIH =>
      exact VarSet.nodup_union (VarSet.nodup_erase bodyIH) replacementIH

/-- `shfv` always satisfies the duplicate-free representation invariant. -/
theorem shfv_nodup (term : Term) : (shfv term).Nodup := by
  induction term with
  | var x => simp [shfv]
  | lam x body => simp [shfv]
  | app function argument functionIH argumentIH =>
      exact VarSet.nodup_union functionIH argumentIH
  | es body x replacement bodyIH replacementIH =>
      exact VarSet.nodup_union (VarSet.nodup_erase bodyIH) replacementIH

/-- Every shallow free variable is also free. -/
theorem mem_fv_of_mem_shfv {x : Nat} {term : Term} (h : x ∈ shfv term) :
    x ∈ fv term := by
  induction term with
  | var y =>
      simpa [shfv, fv] using h
  | lam y body =>
      simp [shfv] at h
  | app function argument functionIH argumentIH =>
      simp [shfv] at h
      simp only [mem_app_fv]
      exact h.elim (fun hf => Or.inl (functionIH hf))
        (fun ha => Or.inr (argumentIH ha))
  | es body y replacement bodyIH replacementIH =>
      simp [shfv] at h
      simp only [mem_es_fv]
      exact h.elim
        (fun hb => Or.inl ⟨hb.1, bodyIH hb.2⟩)
        (fun hr => Or.inr (replacementIH hr))

/--
Every free name is bounded by `maxName`.

Proof ladder: unfold membership by term shape, apply the induction hypothesis to the
selected child, then lift its bound through the appropriate branch of `Nat.max`.
-/
theorem mem_fv_le_maxName {x : Nat} {term : Term} (h : x ∈ fv term) :
    x ≤ maxName term := by
  induction term with
  | var y =>
      exact Nat.le_of_eq ((mem_var_fv x y).mp h)
  | lam y body ih =>
      have bodyBound := ih (mem_lam_fv x y body |>.mp h).2
      exact Nat.le_trans bodyBound (Nat.le_max_right y (maxName body))
  | app function argument functionIH argumentIH =>
      rcases (mem_app_fv x function argument).mp h with hf | ha
      · exact Nat.le_trans (functionIH hf) (Nat.le_max_left _ _)
      · exact Nat.le_trans (argumentIH ha) (Nat.le_max_right _ _)
  | es body y replacement bodyIH replacementIH =>
      rcases (mem_es_fv x y body replacement).mp h with hb | hr
      · exact Nat.le_trans (bodyIH hb.2)
          (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _))
      · exact Nat.le_trans (replacementIH hr)
          (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _))

/-- The generated name is fresh for the first input term. -/
theorem freshName_not_mem_fv_left (t u : Term) : freshName t u ∉ fv t := by
  intro h
  have bound := mem_fv_le_maxName h
  have freshIsGreater : maxName t < freshName t u := by
    apply Nat.lt_succ_of_le
    exact Nat.le_max_left _ _
  exact (Nat.not_le_of_gt freshIsGreater) bound

/-- The generated name is fresh for the second input term. -/
theorem freshName_not_mem_fv_right (t u : Term) : freshName t u ∉ fv u := by
  intro h
  have bound := mem_fv_le_maxName h
  have freshIsGreater : maxName u < freshName t u := by
    apply Nat.lt_succ_of_le
    exact Nat.le_max_right _ _
  exact (Nat.not_le_of_gt freshIsGreater) bound

@[simp] theorem subst_var_same (x : Nat) (replacement : Term) :
    subst (var x) x replacement = replacement := by
  simp [subst, size, substFuel]

@[simp] theorem subst_var_of_ne {x y : Nat} (h : y ≠ x) (replacement : Term) :
    subst (var y) x replacement = var y := by
  simp [subst, size, substFuel, h]

@[simp] theorem subst_lam_shadow (x : Nat) (body replacement : Term) :
    subst (lam x body) x replacement = lam x body := by
  unfold subst
  rw [show size (lam x body) = Nat.succ (size body) by
    simp [size, Nat.add_comm]]
  simp [substFuel]

/-- A small recognizer for variables. -/
def isVar : Term → Prop
  | var _ => True
  | _     => False

/-- A small recognizer for lambda abstractions. -/
def isLam : Term → Prop
  | lam _ _ => True
  | _       => False

end SSC
