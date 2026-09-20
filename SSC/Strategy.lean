import SSC.Reduction

/-!
# Call-by-Silly Strategy

This module implements the context grammar and four strategic rule families from Figure 9
of the paper. It also proves the fundamental safety boundary: every CbS step is a step of
the generic weak SSC.

## Construction ladder

```text
Answer
  -> NCtx / ACtx
  -> YCtx = ACtx composed with NCtx
  -> YStep
  -> yStep_implies_step
```

The strategy is defined for arbitrary terms at the relation level. Paper results about
normal forms and determinism additionally assume shallow-closed or closed source terms;
those results belong to later phases.
-/

namespace SSC

open Term

/-- Answers are values followed by zero or more answer-valued explicit substitutions. -/
inductive Answer : Term → Prop where
  | val : IsValue term → Answer term
  | es : Answer body → Answer argument → Answer (Term.es body x argument)

/-- Strict answers retain only substitutions whose variables occur in their targets. -/
inductive StrictAnswer : Term → Prop where
  | val : IsValue term → StrictAnswer term
  | es :
      StrictAnswer body →
      StrictAnswer argument →
      x ∈ fv body →
      StrictAnswer (Term.es body x argument)

/-- Values have no shallow free variables because weak evaluation stops at lambdas. -/
theorem value_shfv_empty {term : Term} (h : IsValue term) : shfv term = [] := by
  cases term <;> simp [IsValue, shfv] at h ⊢

/-- Every answer has no free occurrence outside abstractions. -/
theorem answer_shfv_empty {term : Term} (h : Answer term) : shfv term = [] := by
  induction h with
  | val isValue =>
      exact value_shfv_empty isValue
  | es bodyAnswer argumentAnswer bodyIH argumentIH =>
      simp [shfv, bodyIH, argumentIH, VarSet.erase, VarSet.union]

/-- Strict answers are answers with an additional relevance condition. -/
theorem strictAnswer_to_answer {term : Term} (h : StrictAnswer term) : Answer term := by
  induction h with
  | val isValue => exact Answer.val isValue
  | es bodyStrict argumentStrict occurs bodyIH argumentIH =>
      exact Answer.es bodyIH argumentIH

/-- Name contexts evaluate function positions and explicit-substitution targets. -/
inductive NCtx where
  | hole : NCtx
  | appL : NCtx → Term → NCtx
  | esL : NCtx → Nat → Term → NCtx
deriving DecidableEq, Repr

/-- Fill the hole of a name context. -/
def plugN : NCtx → Term → Term
  | NCtx.hole, term => term
  | NCtx.appL N argument, term => Term.app (plugN N term) argument
  | NCtx.esL N x argument, term => Term.es (plugN N term) x argument

/--
Auxiliary contexts evaluate through explicit substitutions after name evaluation stops.

`esR` represents `answer[x <- A]`; `esL` represents `A[x <- term]`. Keeping both
constructors is essential: the paper uses the left constructor to cross existing
substitutions and the right constructor to evaluate the stored answer copy.
-/
inductive ACtx where
  | hole : ACtx
  | esR : (answer : Term) → Answer answer → (x : Nat) → ACtx → ACtx
  | esL : ACtx → Nat → Term → ACtx

/-- Fill the hole of an auxiliary context. -/
def plugA : ACtx → Term → Term
  | ACtx.hole, term => term
  | ACtx.esR answer _ x A, term => Term.es answer x (plugA A term)
  | ACtx.esL A x argument, term => Term.es (plugA A term) x argument

/-- A silly context rigidly composes an auxiliary context around a name context. -/
inductive YCtx where
  | mk : ACtx → NCtx → YCtx

/-- Fill the hole of a silly context. -/
def plugY : YCtx → Term → Term
  | YCtx.mk A N, term => plugA A (plugN N term)

/-- Embed a name context into the generic weak-context grammar. -/
def toWCtxN : NCtx → WCtx
  | NCtx.hole => WCtx.hole
  | NCtx.appL N argument => WCtx.appL (toWCtxN N) argument
  | NCtx.esL N x argument => WCtx.esL (toWCtxN N) x argument

/-- Embed an auxiliary context into the generic weak-context grammar. -/
def toWCtxA : ACtx → WCtx
  | ACtx.hole => WCtx.hole
  | ACtx.esR answer _ x A => WCtx.esR answer x (toWCtxA A)
  | ACtx.esL A x argument => WCtx.esL (toWCtxA A) x argument

/-- Embed a silly context into the generic weak-context grammar. -/
def toWCtxY : YCtx → WCtx
  | YCtx.mk A N => composeW (toWCtxA A) (toWCtxN N)

@[simp] theorem plug_toWCtxN (N : NCtx) (term : Term) :
    plugW (toWCtxN N) term = plugN N term := by
  induction N with
  | hole => rfl
  | appL N argument ih => simp [toWCtxN, plugW, plugN, ih]
  | esL N x argument ih => simp [toWCtxN, plugW, plugN, ih]

@[simp] theorem plug_toWCtxA (A : ACtx) (term : Term) :
    plugW (toWCtxA A) term = plugA A term := by
  induction A with
  | hole => rfl
  | esR answer proof x A ih => simp [toWCtxA, plugW, plugA, ih]
  | esL A x argument ih => simp [toWCtxA, plugW, plugA, ih]

@[simp] theorem plug_toWCtxY (Y : YCtx) (term : Term) :
    plugW (toWCtxY Y) term = plugY Y term := by
  cases Y with
  | mk A N =>
      simp [toWCtxY, plugY, plugW_compose]

/--
The Call-by-Silly strategy, following the four closures in Figure 9.

- `y_m` closes the multiplicative root rule under a silly context.
- `y_eAY` closes an exponential rule under `A`, selecting its occurrence with `Y`.
- `y_eYN` closes an exponential rule under `Y`, selecting its occurrence with `N`.
- `y_gcv` closes the paper-faithful value-GC rule under a silly context.
-/
inductive YStep : Term → Term → Prop where
  | y_m :
      YStep
        (plugY Y (Term.app (plugS S (Term.lam x body)) argument))
        (plugY Y (plugS S (Term.es body x argument)))
  | y_eAY :
      YStep
        (plugA A (Term.es (plugY Y (Term.var x)) x replacement))
        (plugA A (Term.es (plugY Y replacement) x replacement))
  | y_eYN :
      YStep
        (plugY Y (Term.es (plugN N (Term.var x)) x replacement))
        (plugY Y (Term.es (plugN N replacement) x replacement))
  | y_gcv :
      IsValue value →
      x ∉ fv body →
      YStep
        (plugY Y (Term.es body x (plugS S value)))
        (plugY Y (plugS S body))

notation:50 source " ⟶y " target => YStep source target

/--
Every strategic step is a generic weak step.

Proof ladder: embed the outer strategic context into `WCtx`, build the matching labelled
root step, and use the three plugging-compatibility lemmas above to identify both sides.
-/
theorem yStep_implies_step {source target : Term} (h : YStep source target) :
    Step source target := by
  cases h with
  | y_m =>
      rename_i Y S x body argument
      refine ⟨toWCtxY Y,
        Term.app (plugS S (Term.lam x body)) argument,
        plugS S (Term.es body x argument),
        RootStep.m MRootStep.intro, ?_, ?_⟩
      · simp
      · simp
  | y_eAY =>
      rename_i A Y x replacement
      refine ⟨toWCtxA A,
        Term.es (plugY Y (Term.var x)) x replacement,
        Term.es (plugY Y replacement) x replacement,
        RootStep.e ?_, ?_, ?_⟩
      · simpa using
          (ERootStep.intro (C := toWCtxY Y) (x := x) (replacement := replacement))
      · simp
      · simp
  | y_eYN =>
      rename_i Y N x replacement
      refine ⟨toWCtxY Y,
        Term.es (plugN N (Term.var x)) x replacement,
        Term.es (plugN N replacement) x replacement,
        RootStep.e ?_, ?_, ?_⟩
      · simpa using
          (ERootStep.intro (C := toWCtxN N) (x := x) (replacement := replacement))
      · simp
      · simp
  | y_gcv isValue unused =>
      rename_i value body x Y S
      refine ⟨toWCtxY Y,
        Term.es body x (plugS S value),
        plugS S body,
        RootStep.gcv ?_, ?_, ?_⟩
      · exact GCVRootStep.intro (S := S) isValue unused
      · simp
      · simp

end SSC
