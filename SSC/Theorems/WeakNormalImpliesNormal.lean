import SSC.NormalForms

/-!
# Weak Normalization Proofs

This module contains the formal, mechanically verified proofs regarding the
normalization properties of the calculus. Specifically, it proves that terms
identified as `Inert` or `WeakNormalLike` are indeed in Normal Form (i.e.,
they cannot take any further weak reduction steps).
-/

namespace SSC

open Term

theorem var_normal (x : Nat) : NormalForm (Term.var x) := by
  intro h
  rcases h with ⟨u, C, r, s, hroot, hs, ht⟩
  cases C <;> simp [plugW] at hs
  · cases hs
    cases hroot

theorem lam_normal (x : Nat) (t : Term) : NormalForm (Term.lam x t) := by
  intro h
  rcases h with ⟨u, C, r, s, hroot, hs, ht⟩
  cases C <;> simp [plugW] at hs
  · cases hs
    cases hroot

theorem weakAnswer_normal {t : Term} (h : WeakAnswer t) : NormalForm t := by
  cases h with
  | lam =>
      exact lam_normal _ _

theorem inert_not_plugS_lam {i : Term} (hi : Inert i) (S : SCtx) (x : Nat) (t : Term) :
    i ≠ plugS S (Term.lam x t) := by
  intro heq
  induction S with
  | hole =>
      simp [plugS] at heq
      cases hi <;> contradiction
  | es S' y v ih =>
      simp [plugS] at heq
      cases hi <;> contradiction

mutual
theorem inert_normal : {t : Term} → Inert t → NormalForm t
  | _, .var => var_normal _
  | _, @Inert.app i n hi hn => by
      have ih_i := inert_normal hi
      have ih_n := weakNormalLike_normal hn
      intro hstep
      rcases hstep with ⟨u, C, r, s, hroot, hs, ht⟩
      cases C with
      | hole =>
          simp [plugW] at hs
          subst hs
          cases hroot
          exact inert_not_plugS_lam hi _ _ _ rfl
      | appL C' u' =>
          simp [plugW] at hs
          rcases hs with ⟨h1, h2⟩
          have hstep_i : Step i (plugW C' s) := by
            refine ⟨C', r, s, hroot, h1, rfl⟩
          exact ih_i ⟨plugW C' s, hstep_i⟩
      | appR s' C' =>
          simp [plugW] at hs
          rcases hs with ⟨h1, h2⟩
          have hstep_n : Step n (plugW C' s) := by
            refine ⟨C', r, s, hroot, h2, rfl⟩
          exact ih_n ⟨plugW C' s, hstep_n⟩
      | esL C' x u' =>
          simp [plugW] at hs
      | esR s' x C' =>
          simp [plugW] at hs

theorem weakNormalLike_normal : {t : Term} → WeakNormalLike t → NormalForm t
  | _, .answer ha => weakAnswer_normal ha
  | _, .inert hi => inert_normal hi
end

end SSC
