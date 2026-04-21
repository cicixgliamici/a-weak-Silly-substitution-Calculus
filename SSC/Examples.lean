import SSC.Reduction
import SSC.Strategy

namespace SSC

open Term

/--
The identity function: `λx.x`
-/
def idTerm : Term :=
  Term.lam 0 (Term.var 0)

/--
A constant function: `λx.λy.x`
-/
def constTerm : Term :=
  Term.lam 0 (Term.lam 1 (Term.var 0))

/--
A simple top-level application used to illustrate the multiplicative rule.

Informally:
`(λx.x) y`
-/
def exM : Term :=
  Term.app (Term.lam 0 (Term.var 0)) (Term.var 7)

/--
Sanity check: `exM` performs a top-level multiplicative step.

The application of a lambda to an argument turns into an explicit substitution.
-/
example : exM ⟶ Term.es (Term.var 0) 0 (Term.var 7) := by
  exact step_m_top 0 (Term.var 0) (Term.var 7)

/--
A simple top-level explicit substitution used to illustrate the exponential rule.

Informally:
`x[x ↦ u]`
-/
def exE : Term :=
  Term.es (Term.var 3) 3 (Term.var 9)

/--
Sanity check: `exE` performs a top-level exponential step.

The distinguished variable occurrence is replaced by the substituted term,
while the explicit substitution remains around the result in this prototype.
-/
example : exE ⟶ Term.es (Term.var 9) 3 (Term.var 9) := by
  exact step_e_top 3 (Term.var 9)

/--
A simple example for garbage collection by value.

Here the substituted value is the identity function, and the variable being
substituted does not occur free in the target term.
-/
def exGC : Term :=
  Term.es (Term.var 4) 0 idTerm

/--
Sanity check: `exGC` reduces by garbage collection by value.

Since the variable `0` does not occur free in `var 4`, the explicit
substitution can be erased.
-/
example : exGC ⟶ Term.var 4 := by
  apply root_implies_step
  apply RootStep.gcv
  · trivial
  · simp [fv]

/--
A weak-context example.

We place `exM` on the left-hand side of a larger application, showing that
a root step can also be lifted through a weak context.
-/
def exCtx : Term :=
  Term.app exM (Term.var 99)

/--
Sanity check: `exCtx` reduces by performing the multiplicative step inside
a weak context.

This illustrates weak contextual closure of root reduction.
-/
example : exCtx ⟶ Term.app (Term.es (Term.var 0) 0 (Term.var 7)) (Term.var 99) := by
  refine ⟨WCtx.appL WCtx.hole (Term.var 99), exM, Term.es (Term.var 0) 0 (Term.var 7), ?_, ?_, ?_⟩
  · simpa [exM, plugS] using
      (RootStep.m (S := SCtx.hole) (x := 0) (t := Term.var 0) (u := Term.var 7))
  · simp [exCtx, exM, plugW]
  · simp [plugW]

/--
Omega combinator. Diverges under generic weak reduction.
-/
def deltaTerm : Term := Term.lam 0 (Term.app (Term.var 0) (Term.var 0))
def omegaTerm : Term := Term.app deltaTerm deltaTerm

/--
The paper's specific example for silly evaluation (Example 7.1).
`t := (λy.λx.x(λw.x)) Ω (I I)`
In CbS, this term triggers silly duplications and evaluates divergently,
while in CbN it would terminate and erase `Ω`.
-/
def sillyExTerm : Term :=
  let f := Term.lam 1 (Term.lam 0 (Term.app (Term.var 0) (Term.lam 2 (Term.var 0))))
  let arg1 := omegaTerm
  let arg2 := Term.app idTerm idTerm
  Term.app (Term.app f arg1) arg2

/--
Sanity check: `sillyExTerm` first evaluates via a multiplicative step under CbS.
This is because `YStep` multiplicative rules allow reduction in `YCtx`,
and the empty context is a valid `YCtx`.
-/
example : sillyExTerm ⟶y
  plugY (YCtx.mk ACtx.hole (NCtx.appL NCtx.hole (Term.app idTerm idTerm)))
    (Term.es (Term.lam 0 (Term.app (Term.var 0) (Term.lam 2 (Term.var 0)))) 1 omegaTerm) := by
  -- This step proves that the first step is indeed multiplicative, substituting Ω for y.
  apply YStep.y_m (Y := YCtx.mk ACtx.hole (NCtx.appL NCtx.hole (Term.app idTerm idTerm)))
                  (S := SCtx.hole)

end SSC
