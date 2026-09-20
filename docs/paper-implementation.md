# Paper Implementation Status

## Scope of this document

This document maps the Lean library to *Mirroring Call-by-Need, or Values Acting Silly*.
It records what is exact, what is only partial, and what has not been formalized. Passing
`lake build` means that the Lean statements are proved; it does not mean that every
statement from the paper has been represented faithfully.

The comparison currently focuses on the paper's weak SSC and CbS strategy. Section and
proposition numbers refer to the paper version stored in `docs/`.

## Status legend

- **Implemented**: represented in Lean with the intended mathematical content.
- **Partial**: useful scaffolding exists, but definitions or results are incomplete.
- **Different**: Lean currently implements a knowingly simplified rule.
- **Missing**: no substantive formalization yet.

## Correspondence table

| Paper component | Lean location | Status | Notes |
|---|---|---|---|
| Term grammar | `SSC/Syntax.lean` | Implemented | Variables use `Nat`; terms are not quotiented by alpha equivalence. |
| Values are abstractions | `SSC/Syntax.lean` | Implemented | Matches the paper's confluence-sensitive choice. |
| Free variables | `SSC/Syntax.lean` | Implemented | Duplicate-free and mechanically proved. |
| Shallow free variables, Definition 4.1 | `SSC/Syntax.lean` | Implemented | Includes a proof that `shfv(t)` is contained in `fv(t)`. |
| Terms modulo alpha equivalence | — | Missing | Fresh renaming and capture-avoiding substitution exist, but no alpha-equivalence relation or quotient is defined. |
| Weak contexts | `SSC/Contexts.lean` | Implemented | All positions except below lambda. |
| Substitution contexts | `SSC/Contexts.lean` | Implemented | Chains of explicit substitutions. |
| Multiplicative root rule | `SSC/Reduction.lean` | Implemented | Uses substitution contexts as in the paper. |
| Exponential root rule | `SSC/Reduction.lean` | Implemented | Performs one replacement at a distance and retains the ES. |
| GC by value root rule | `SSC/Reduction.lean` | Implemented | Preserves the substitution context: `t[x <- S<v>] -> S<t>`. |
| Labelled weak relations | `SSC/Reduction.lean` | Implemented | `MStep`, `EStep`, and `GCVStep`; their union is characterized by `step_iff_labelled`. |
| Weak contextual closure | `SSC/Reduction.lean` | Implemented | Expressed uniformly through `WeakClosure` and `WCtx`. |
| Weak normal-form grammar, Proposition 4.2 | `SSC/NormalForms.lean` | Partial | Explicit-substitution cases and side conditions are missing. |
| Normal-form characterization | `SSC/Theorems/WeakNormalImpliesNormal.lean` | Partial | Only soundness of the smaller grammar is proved. |
| GC postponement, Lemma 4.3 / Proposition 4.4 | — | Missing | Requires the paper-faithful `gcv` rule first. |
| Local termination, Proposition 4.5 | — | Missing | No transitive reduction framework is present yet. |
| Local confluence and commutation, Lemmas 4.6–4.7 | — | Missing | Double contexts and deformation lemmas are absent. |
| Confluence, Theorem 4.8 | — | Missing | Planned after the local rewriting infrastructure. |
| Silly multi-types, Sections 5–7 | — | Missing | No type syntax, typing relation, or quantitative indices yet. |
| Uniform normalization, Corollary 6.6 | — | Missing | Depends on type soundness and completeness. |
| CbS name contexts | `SSC/Strategy.lean` | Implemented | Matches the basic left-application and ES-target grammar. |
| CbS answers | `SSC/Strategy.lean` | Implemented | Values closed under answer-valued explicit substitutions. |
| CbS auxiliary contexts | `SSC/Strategy.lean` | Implemented | Contains both `a[x <- A]` and `A[x <- t]`. |
| CbS exponential rules | `SSC/Strategy.lean` | Implemented | Represents the asymmetric `A<e_Y>` and `Y<e_N>` closures. |
| Strategy inclusion | `SSC/Strategy.lean` | Implemented | `yStep_implies_step` proves `YStep` is contained in generic weak reduction. |
| CbS normal forms, Lemmas 11.2–11.3 | `SSC/Strategy.lean` | Partial | `Answer` and `StrictAnswer` are defined, but their normal-form characterizations are not proved. |
| Strategy determinism/diamond, Proposition 11.4 | — | Missing | No such theorem is claimed by the library. |
| Strategy GC postponement, Proposition 11.6 | — | Missing | Requires corrected contexts and step decomposition. |
| Silly MAM, Sections 9–10 | — | Missing | No machine states or transition system yet. |
| Tight types and maximality, Section 12 | — | Missing | Long-term quantitative metatheory. |

## Implemented syntax foundation

The first development phase strengthened the named representation without changing the
term grammar:

1. finite-set insertion, erasure, and union;
2. free and shallow-free variable analyses;
3. proofs that both analyses have no duplicates;
4. proof that shallow-free variables are free;
5. a bound on every free name;
6. fresh-name generation with freshness theorems;
7. binder-aware renaming;
8. capture-avoiding meta-substitution.

The meta-substitution operation is separate from the explicit substitution constructor.
The former is a Lean function used for metatheory; the latter is object-language syntax
whose behavior is governed by reduction.

## Phase 2 result and next semantic gaps

Phase 2 established the following chain:

```text
paper-faithful gcv
  -> exact root-rule families
  -> labelled weak closures
  -> corrected CbS context grammar
  -> proof that strategic steps are weak steps
```

The next work should complete the weak-normal-form grammar and its bidirectional
characterization. Postponement and confluence can then be built on the labelled relations.

## Updating this document

Every change that claims closer paper correspondence must update the table in the same
commit. A status may move to **Implemented** only when both the definition and its required
side conditions are represented in Lean. Tests alone are not sufficient when the paper
states a universal theorem.
