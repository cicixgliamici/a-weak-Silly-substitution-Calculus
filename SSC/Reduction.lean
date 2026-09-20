import SSC.Decompose

/-!
# Paper-Faithful Weak Reduction Rules

The weak SSC has three independent root relations. Each relation is closed under weak
contexts, yielding labelled weak steps. Their union is the generic weak step `Step`.

## Definition ladder

```text
MRootStep / ERootStep / GCVRootStep
  -> RootStep
  -> WeakClosure
  -> MStep / EStep / GCVStep
  -> Step
  -> NormalForm
```

Keeping labels at both root and weak level is necessary for later postponement,
commutation, and quantitative proofs.
-/

namespace SSC

open Term

/-- Multiplicative (explicit beta) reduction at a distance. -/
inductive MRootStep : Term → Term → Prop where
  | intro :
      MRootStep
        (Term.app (plugS S (Term.lam x body)) argument)
        (plugS S (Term.es body x argument))

/-- Exponential reduction replaces one occurrence selected by a weak context. -/
inductive ERootStep : Term → Term → Prop where
  | intro :
      ERootStep
        (Term.es (plugW C (Term.var x)) x replacement)
        (Term.es (plugW C replacement) x replacement)

/--
Garbage collection by value, including the substitution context around the value.

The context is preserved on the target because its substitutions may contain computations
that cannot be erased together with the value.
-/
inductive GCVRootStep : Term → Term → Prop where
  | intro :
      IsValue value →
      x ∉ fv body →
      GCVRootStep
        (Term.es body x (plugS S value))
        (plugS S body)

/-- Tagged union of the three primitive root relations. -/
inductive RootStep : Term → Term → Prop where
  | m : MRootStep source target → RootStep source target
  | e : ERootStep source target → RootStep source target
  | gcv : GCVRootStep source target → RootStep source target

/-- Contextual closure of a relation under weak contexts. -/
def WeakClosure (relation : Term → Term → Prop) (source target : Term) : Prop :=
  ∃ C redex contractum,
    relation redex contractum ∧
    source = plugW C redex ∧
    target = plugW C contractum

/-- Weak multiplicative steps. -/
abbrev MStep := WeakClosure MRootStep

/-- Weak exponential steps. -/
abbrev EStep := WeakClosure ERootStep

/-- Weak garbage-collection-by-value steps. -/
abbrev GCVStep := WeakClosure GCVRootStep

/-- Generic weak reduction, containing all three labelled weak relations. -/
abbrev Step := WeakClosure RootStep

/-- The non-erasing fragment consists of multiplicative or exponential weak steps. -/
def NonErasingStep (source target : Term) : Prop :=
  MStep source target ∨ EStep source target

notation:50 source " ⟶mroot " target => MRootStep source target
notation:50 source " ⟶eroot " target => ERootStep source target
notation:50 source " ⟶gcvroot " target => GCVRootStep source target
notation:50 source " ⟶root " target => RootStep source target
notation:50 source " ⟶m " target => MStep source target
notation:50 source " ⟶e " target => EStep source target
notation:50 source " ⟶gcv " target => GCVStep source target
notation:50 source " ⟶ " target => Step source target

/-- A term is in normal form when it has no outgoing generic weak step. -/
def NormalForm (term : Term) : Prop :=
  ¬ ∃ target, Step term target

/-- Any root step induces a weak step through the empty weak context. -/
theorem root_implies_step {source target : Term} (h : RootStep source target) :
    Step source target := by
  exact ⟨WCtx.hole, source, target, h, by simp [plugW], by simp [plugW]⟩

/-- Every labelled multiplicative step is a generic weak step. -/
theorem mStep_implies_step {source target : Term} (h : MStep source target) :
    Step source target := by
  rcases h with ⟨C, redex, contractum, hroot, hs, ht⟩
  exact ⟨C, redex, contractum, RootStep.m hroot, hs, ht⟩

/-- Every labelled exponential step is a generic weak step. -/
theorem eStep_implies_step {source target : Term} (h : EStep source target) :
    Step source target := by
  rcases h with ⟨C, redex, contractum, hroot, hs, ht⟩
  exact ⟨C, redex, contractum, RootStep.e hroot, hs, ht⟩

/-- Every labelled value-GC step is a generic weak step. -/
theorem gcvStep_implies_step {source target : Term} (h : GCVStep source target) :
    Step source target := by
  rcases h with ⟨C, redex, contractum, hroot, hs, ht⟩
  exact ⟨C, redex, contractum, RootStep.gcv hroot, hs, ht⟩

/-- Generic weak reduction is exactly the union of its three labelled components. -/
theorem step_iff_labelled {source target : Term} :
    Step source target ↔
      MStep source target ∨ EStep source target ∨ GCVStep source target := by
  constructor
  · intro h
    rcases h with ⟨C, redex, contractum, hroot, hs, ht⟩
    cases hroot with
    | m hm => exact Or.inl ⟨C, redex, contractum, hm, hs, ht⟩
    | e he => exact Or.inr (Or.inl ⟨C, redex, contractum, he, hs, ht⟩)
    | gcv hgcv => exact Or.inr (Or.inr ⟨C, redex, contractum, hgcv, hs, ht⟩)
  · intro h
    rcases h with hm | he | hgcv
    · exact mStep_implies_step hm
    · exact eStep_implies_step he
    · exact gcvStep_implies_step hgcv

/-- Top-level multiplicative reduction with an empty substitution context. -/
theorem step_m_top (x : Nat) (body argument : Term) :
    Term.app (Term.lam x body) argument ⟶ Term.es body x argument := by
  apply root_implies_step
  apply RootStep.m
  simpa [plugS] using
    (MRootStep.intro (S := SCtx.hole) (x := x) (body := body) (argument := argument))

/-- Top-level exponential replacement with an empty occurrence context. -/
theorem step_e_top (x : Nat) (replacement : Term) :
    Term.es (Term.var x) x replacement ⟶ Term.es replacement x replacement := by
  apply root_implies_step
  apply RootStep.e
  simpa [plugW] using
    (ERootStep.intro (C := WCtx.hole) (x := x) (replacement := replacement))

/-- Convenient notation-oriented specialization of `step_e_top`. -/
theorem step_e_var_top (x : Nat) (replacement : Term) :
    Term.es (Term.var x) x replacement ⟶ replacement[x ↦ replacement] := by
  simpa using step_e_top x replacement

/-- Top-level value garbage collection with an empty substitution context. -/
theorem step_gcv_top {body value : Term} {x : Nat}
    (isValue : IsValue value) (unused : x ∉ fv body) :
    Term.es body x value ⟶ body := by
  apply root_implies_step
  apply RootStep.gcv
  simpa [plugS] using
    (GCVRootStep.intro (S := SCtx.hole) isValue unused)

end SSC
