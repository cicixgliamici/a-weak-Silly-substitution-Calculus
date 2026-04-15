import SSC.Decompose

namespace SSC

open Term

inductive RootStep : Term → Term → Prop where
  | m :
      RootStep
        (Term.app (plugS S (Term.lam x t)) u)
        (plugS S (Term.es t x u))

  | e :
      RootStep
        (Term.es (plugW C (Term.var x)) x u)
        (Term.es (plugW C u) x u)

  | gcv :
      IsValue v →
      x ∉ fv t →
      RootStep (Term.es t x v) t

/--
Weak reduction as existential contextual closure of root reduction.
This formulation is easier to reason about for first normal-form proofs.
-/
def Step (s t : Term) : Prop :=
  ∃ C r u, RootStep r u ∧ s = plugW C r ∧ t = plugW C u

notation:50 t " ⟶root " u => RootStep t u
notation:50 t " ⟶ " u => Step t u

def NormalForm (t : Term) : Prop :=
  ¬ ∃ u, Step t u

theorem root_implies_step {t u : Term} (h : RootStep t u) : Step t u := by
  refine ⟨WCtx.hole, t, u, h, ?_, ?_⟩
  · simp [plugW]
  · simp [plugW]

theorem step_m_top (x : Nat) (t u : Term) :
    Term.app (Term.lam x t) u ⟶ Term.es t x u := by
  apply root_implies_step
  simpa [plugS] using (RootStep.m (S := SCtx.hole) (x := x) (t := t) (u := u))

theorem step_e_top (x : Nat) (u : Term) :
    Term.es (Term.var x) x u ⟶ Term.es u x u := by
  apply root_implies_step
  simpa [plugW] using (RootStep.e (C := WCtx.hole) (x := x) (u := u))

theorem step_e_var_top (x : Nat) (u : Term) :
    Term.es (Term.var x) x u ⟶ u[x↦u] := by
  simpa using step_e_top x u

end SSC
