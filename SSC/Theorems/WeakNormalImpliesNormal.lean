import SSC.NormalForms

/-!
# Characterization of Weak Normal Forms

This module proves both directions of Proposition 4.2. With raw names, one bridge is
explicit: if a normal term decomposes as `W⟨x⟩`, then `x` is shallow-free. A context
that captured `x` would itself expose an exponential redex.

## Proof roadmap

```text
shallow occurrence -> weak-context decomposition
normal decomposition -> shallow occurrence
answer/inert head-shape lemmas
grammar soundness
semantic completeness
```

Soundness excludes each possible root rule from the grammar side conditions. Completeness
reads those conditions back from the absence of multiplicative, exponential, and garbage-
collection steps.
-/

namespace SSC

open Term

/-- A shallow-free occurrence determines a weak-context decomposition. -/
theorem exists_plugW_var_of_mem_shfv {x : Nat} {term : Term}
    (occurs : x ∈ shfv term) : ∃ context, plugW context (Term.var x) = term := by
  induction term with
  | var y =>
      simp [shfv] at occurs
      subst y
      exact ⟨WCtx.hole, rfl⟩
  | lam y body => simp [shfv] at occurs
  | app function argument functionIH argumentIH =>
      simp [shfv] at occurs
      rcases occurs with inFunction | inArgument
      · rcases functionIH inFunction with ⟨context, equation⟩
        exact ⟨WCtx.appL context argument, by simp [plugW, equation]⟩
      · rcases argumentIH inArgument with ⟨context, equation⟩
        exact ⟨WCtx.appR function context, by simp [plugW, equation]⟩
  | es body binder replacement bodyIH replacementIH =>
      simp [shfv] at occurs
      rcases occurs with inBody | inReplacement
      · rcases bodyIH inBody.2 with ⟨context, equation⟩
        exact ⟨WCtx.esL context binder replacement, by simp [plugW, equation]⟩
      · rcases replacementIH inReplacement with ⟨context, equation⟩
        exact ⟨WCtx.esR body binder context, by simp [plugW, equation]⟩

/-- In a normal term, a weak-context-selected variable is shallow-free. -/
theorem mem_shfv_plugW_var_of_normal (context : WCtx) (x : Nat)
    (normal : NormalForm (plugW context (Term.var x))) :
    x ∈ shfv (plugW context (Term.var x)) := by
  induction context with
  | hole => simp [plugW, shfv]
  | appL context argument ih =>
      have childNormal := normal_of_plugW_normal (WCtx.appL WCtx.hole argument) normal
      simp [plugW, shfv, ih childNormal]
  | appR function context ih =>
      have childNormal := normal_of_plugW_normal (WCtx.appR function WCtx.hole) normal
      simp [plugW, shfv, ih childNormal]
  | esL context binder replacement ih =>
      by_cases sameName : x = binder
      · subst binder
        exfalso
        -- Crossing a binder named `x` would make this explicit substitution an e-redex.
        apply normal
        refine ⟨Term.es (plugW context replacement) x replacement, ?_⟩
        apply root_implies_step
        exact RootStep.e (ERootStep.intro (C := context))
      · have childNormal :=
          normal_of_plugW_normal (WCtx.esL WCtx.hole binder replacement) normal
        simp [plugW, shfv, sameName, ih childNormal]
  | esR body binder context ih =>
      have childNormal := normal_of_plugW_normal (WCtx.esR body binder WCtx.hole) normal
      simp [plugW, shfv, ih childNormal]

/-- Weak answers are values surrounded by a substitution context. -/
theorem weakAnswer_eq_plugS_value : {term : Term} → WeakAnswer term →
    ∃ context value, IsValue value ∧ term = plugS context value
  | _, .lam => ⟨SCtx.hole, Term.lam _ _, trivial, rfl⟩
  | _, @WeakAnswer.esInert body replacement x bodyAnswer replacementInert unused => by
      rcases weakAnswer_eq_plugS_value bodyAnswer with
        ⟨context, value, isValue, equation⟩
      exact ⟨SCtx.es context x replacement, value, isValue, by simp [plugS, equation]⟩
  | _, @WeakAnswer.esAnswer body replacement x bodyAnswer replacementAnswer occurs unused => by
      rcases weakAnswer_eq_plugS_value bodyAnswer with
        ⟨context, value, isValue, equation⟩
      exact ⟨SCtx.es context x replacement, value, isValue, by simp [plugS, equation]⟩

/-- An inert term cannot be a value surrounded by explicit substitutions. -/
theorem inert_not_plugS_value {term : Term} (inert : Inert term)
    (context : SCtx) (value : Term) (isValue : IsValue value) :
    term ≠ plugS context value := by
  cases inert with
  | var =>
      intro equation
      cases context <;> cases value <;> simp [plugS, IsValue] at isValue equation
  | app headInert argumentNormal =>
      intro equation
      cases context <;> cases value <;> simp [plugS, IsValue] at isValue equation
  | esInert bodyInert replacementInert unused =>
      intro equation
      cases context with
      | hole =>
          simp [plugS] at equation
          subst value
          cases isValue
      | es context binder argument =>
          simp [plugS] at equation
          exact inert_not_plugS_value bodyInert context value isValue equation.1
  | esAnswer bodyInert replacementAnswer occurs unused =>
      intro equation
      cases context with
      | hole =>
          simp [plugS] at equation
          subst value
          cases isValue
      | es context binder argument =>
          simp [plugS] at equation
          exact inert_not_plugS_value bodyInert context value isValue equation.1

/-- Variables are weak-normal. -/
theorem var_normal (x : Nat) : NormalForm (Term.var x) := by
  intro reducible
  rcases reducible with ⟨target, context, redex, contractum, root, sourceEq, targetEq⟩
  cases context <;> simp [plugW] at sourceEq
  · cases sourceEq
    cases root <;> rename_i impossible <;> cases impossible

/-- Weak evaluation does not enter abstractions. -/
theorem lam_normal (x : Nat) (body : Term) : NormalForm (Term.lam x body) := by
  intro reducible
  rcases reducible with ⟨target, context, redex, contractum, root, sourceEq, targetEq⟩
  cases context <;> simp [plugW] at sourceEq
  · cases sourceEq
    cases root <;> rename_i impossible <;> cases impossible

/-- Assemble normality of an explicit substitution from its local exclusions. -/
private theorem es_normal {body replacement : Term} {x : Nat}
    (bodyNormal : NormalForm body) (replacementNormal : NormalForm replacement)
    (noOccurrence : ∀ context, body ≠ plugW context (Term.var x))
    (relevantValue : ∀ context value, IsValue value →
      replacement = plugS context value → x ∈ fv body) :
    NormalForm (Term.es body x replacement) := by
  intro reducible
  rcases reducible with ⟨target, context, redex, contractum, root, sourceEq, targetEq⟩
  cases context with
  | hole =>
      -- At the root, constructor shape rules out m; the two hypotheses rule out e/gcv.
      simp [plugW] at sourceEq
      cases root with
      | m impossible =>
          cases impossible
          simp at sourceEq
      | e exponential =>
          cases exponential with
          | intro =>
              simp at sourceEq
              apply noOccurrence _
              rw [sourceEq.2.1]
              exact sourceEq.1
      | gcv garbage =>
          cases garbage with
          | intro isValue unused =>
              simp at sourceEq
              apply unused
              rw [← sourceEq.2.1, ← sourceEq.1]
              exact relevantValue _ _ isValue sourceEq.2.2
  | appL context argument => simp [plugW] at sourceEq
  | appR function context => simp [plugW] at sourceEq
  | esL context binder argument =>
      -- A redex selected in the target contradicts normality of the target.
      simp [plugW] at sourceEq
      have childStep : Step body (plugW context contractum) := by
        refine ⟨context, redex, contractum, root, sourceEq.1, rfl⟩
      exact bodyNormal ⟨_, childStep⟩
  | esR sourceBody binder context =>
      -- The replacement is also a weak position, so it must be normal independently.
      simp [plugW] at sourceEq
      have childStep : Step replacement (plugW context contractum) := by
        refine ⟨context, redex, contractum, root, sourceEq.2.2, rfl⟩
      exact replacementNormal ⟨_, childStep⟩

mutual

/-- Every weak answer generated by Proposition 4.2 is weak-normal. -/
theorem weakAnswer_normal : {term : Term} → WeakAnswer term → NormalForm term
  | _, .lam => lam_normal _ _
  | _, @WeakAnswer.esInert body replacement x bodyAnswer replacementInert unused => by
      have bodyNormal := weakAnswer_normal bodyAnswer
      have replacementNormal := inert_normal replacementInert
      apply es_normal bodyNormal replacementNormal
      · intro context equation
        have shallow := mem_shfv_plugW_var_of_normal context x (equation ▸ bodyNormal)
        exact unused (equation ▸ shallow)
      · intro context value isValue equation
        exact False.elim (inert_not_plugS_value replacementInert context value isValue equation)
  | _, @WeakAnswer.esAnswer body replacement x bodyAnswer replacementAnswer occurs unused => by
      have bodyNormal := weakAnswer_normal bodyAnswer
      have replacementNormal := weakAnswer_normal replacementAnswer
      apply es_normal bodyNormal replacementNormal
      · intro context equation
        have shallow := mem_shfv_plugW_var_of_normal context x (equation ▸ bodyNormal)
        exact unused (equation ▸ shallow)
      · intro context value isValue equation
        exact occurs

/-- Every inert term generated by Proposition 4.2 is weak-normal. -/
theorem inert_normal : {term : Term} → Inert term → NormalForm term
  | _, .var => var_normal _
  | _, @Inert.app head argument headInert argumentGrammar => by
      have headNormal := inert_normal headInert
      have argumentNormal := weakNormalLike_normal argumentGrammar
      intro reducible
      rcases reducible with ⟨target, context, redex, contractum, root, sourceEq, targetEq⟩
      cases context with
      | hole =>
          simp [plugW] at sourceEq
          subst redex
          cases root with
          | m multiplicative =>
              cases multiplicative
              exact inert_not_plugS_value headInert _ _ (by trivial) rfl
          | e impossible => cases impossible
          | gcv impossible => cases impossible
      | appL context otherArgument =>
          simp [plugW] at sourceEq
          exact headNormal ⟨_, ⟨context, redex, contractum, root, sourceEq.1, rfl⟩⟩
      | appR function context =>
          simp [plugW] at sourceEq
          exact argumentNormal ⟨_, ⟨context, redex, contractum, root, sourceEq.2, rfl⟩⟩
      | esL context binder replacement => simp [plugW] at sourceEq
      | esR body binder context => simp [plugW] at sourceEq
  | _, @Inert.esInert body replacement x bodyInert replacementInert unused => by
      have bodyNormal := inert_normal bodyInert
      have replacementNormal := inert_normal replacementInert
      apply es_normal bodyNormal replacementNormal
      · intro context equation
        have shallow := mem_shfv_plugW_var_of_normal context x (equation ▸ bodyNormal)
        exact unused (equation ▸ shallow)
      · intro context value isValue equation
        exact False.elim (inert_not_plugS_value replacementInert context value isValue equation)
  | _, @Inert.esAnswer body replacement x bodyInert replacementAnswer occurs unused => by
      have bodyNormal := inert_normal bodyInert
      have replacementNormal := weakAnswer_normal replacementAnswer
      apply es_normal bodyNormal replacementNormal
      · intro context equation
        have shallow := mem_shfv_plugW_var_of_normal context x (equation ▸ bodyNormal)
        exact unused (equation ▸ shallow)
      · intro context value isValue equation
        exact occurs

/-- Every term in the weak-normal grammar is semantically normal. -/
theorem weakNormalLike_normal : {term : Term} → WeakNormalLike term → NormalForm term
  | _, .answer answer => weakAnswer_normal answer
  | _, .inert inert => inert_normal inert

end

/-- Semantic normality implies membership in the grammar of Proposition 4.2. -/
theorem normal_weakNormalLike {term : Term} (normal : NormalForm term) :
    WeakNormalLike term := by
  induction term with
  | var x => exact .inert .var
  | lam x body => exact .answer .lam
  | app function argument functionIH argumentIH =>
      have functionNormal := normal_of_plugW_normal (WCtx.appL WCtx.hole argument) normal
      have argumentNormal := normal_of_plugW_normal (WCtx.appR function WCtx.hole) normal
      have functionGrammar := functionIH functionNormal
      have argumentGrammar := argumentIH argumentNormal
      cases functionGrammar with
      | answer functionAnswer =>
          -- Answers expose a value through `SCtx`; applied answers therefore form m-redexes.
          rcases weakAnswer_eq_plugS_value functionAnswer with
            ⟨context, value, isValue, equation⟩
          cases value with
          | lam binder body =>
              exfalso
              apply normal
              refine ⟨plugS context (Term.es body binder argument), ?_⟩
              apply root_implies_step
              rw [equation]
              exact RootStep.m MRootStep.intro
          | var x => cases isValue
          | app left right => cases isValue
          | es body binder replacement => cases isValue
      | inert functionInert => exact .inert (.app functionInert argumentGrammar)
  | es body binder replacement bodyIH replacementIH =>
      have bodyNormal := normal_of_plugW_normal (WCtx.esL WCtx.hole binder replacement) normal
      have replacementNormal := normal_of_plugW_normal (WCtx.esR body binder WCtx.hole) normal
      have bodyGrammar := bodyIH bodyNormal
      have replacementGrammar := replacementIH replacementNormal
      have notShallow : binder ∉ shfv body := by
        intro occurs
        -- A shallow occurrence gives exactly the context needed by the e-root rule.
        rcases exists_plugW_var_of_mem_shfv occurs with ⟨context, equation⟩
        apply normal
        refine ⟨Term.es (plugW context replacement) binder replacement, ?_⟩
        apply root_implies_step
        rw [← equation]
        exact RootStep.e ERootStep.intro
      cases bodyGrammar with
      | answer bodyAnswer =>
          cases replacementGrammar with
          | inert replacementInert =>
              exact .answer (.esInert bodyAnswer replacementInert notShallow)
          | answer replacementAnswer =>
              have occurs : binder ∈ fv body := by
                by_cases present : binder ∈ fv body
                · exact present
                · exfalso
                  -- An unused answer is a value under `SCtx`, hence a gcv redex.
                  rcases weakAnswer_eq_plugS_value replacementAnswer with
                    ⟨context, value, isValue, equation⟩
                  apply normal
                  refine ⟨plugS context body, ?_⟩
                  apply root_implies_step
                  rw [equation]
                  exact RootStep.gcv (GCVRootStep.intro isValue present)
              exact .answer (.esAnswer bodyAnswer replacementAnswer occurs notShallow)
      | inert bodyInert =>
          cases replacementGrammar with
          | inert replacementInert =>
              exact .inert (.esInert bodyInert replacementInert notShallow)
          | answer replacementAnswer =>
              have occurs : binder ∈ fv body := by
                by_cases present : binder ∈ fv body
                · exact present
                · exfalso
                  -- The same relevance argument applies when the target is inert.
                  rcases weakAnswer_eq_plugS_value replacementAnswer with
                    ⟨context, value, isValue, equation⟩
                  apply normal
                  refine ⟨plugS context body, ?_⟩
                  apply root_implies_step
                  rw [equation]
                  exact RootStep.gcv (GCVRootStep.intro isValue present)
              exact .inert (.esAnswer bodyInert replacementAnswer occurs notShallow)

/-- The grammar of Proposition 4.2 exactly characterizes weak normal forms. -/
theorem normalForm_iff_weakNormalLike {term : Term} :
    NormalForm term ↔ WeakNormalLike term :=
  ⟨normal_weakNormalLike, weakNormalLike_normal⟩

end SSC
