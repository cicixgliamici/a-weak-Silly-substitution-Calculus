# Reviewer Guide

## Question and contribution

This project mechanizes a fragment of weak Silly Substitution Calculus in Lean 4.
The main completed result connects two independently defined notions: a term has
no outgoing weak reduction step exactly when it belongs to the weak normal-form
grammar corresponding to Proposition 4.2 of the bundled paper.

The central statement is `normalForm_iff_weakNormalLike`:

```lean
NormalForm term ↔ WeakNormalLike term
```

## Suggested reading path

| Order | Source | What to inspect |
|---|---|---|
| 1 | [Paper implementation status](paper-implementation.md) | Scope, representation choices, and missing results |
| 2 | [Reduction](../SSC/Reduction.lean) | Root rules, labelled weak closures, and semantic `NormalForm` |
| 3 | [Normal forms](../SSC/NormalForms.lean) | Independent answer/inert grammar and its side conditions |
| 4 | [Characterization proof](../SSC/Theorems/WeakNormalImpliesNormal.lean) | Opening proof roadmap, soundness, completeness, and final equivalence |
| 5 | [Metatheory tests](../SSC/Tests/Metatheory.lean) | Explicit-substitution grammar branches and rejected redexes |
| 6 | [Strategy](../SSC/Strategy.lean) | CbS contexts and `yStep_implies_step`, the strategy inclusion theorem |

Use [the architecture](architecture.md) for the dependency direction and
[example reductions](example-reduction.md) for concrete traces.

## Reproduce the checks

With Elan installed, run from a fresh checkout:

```text
lake build
lake exe LeanSsc
```

The committed `lean-toolchain` selects Lean. Both `SSC` and `LeanSsc` are default
targets. The `SSC.*` build glob includes every module below `SSC/`, even modules
not imported by `SSC.lean`; tests are compile-time assertions and theorem examples.
The executable prints a loading confirmation rather than evaluating SSC terms.

In Bash, `bash scripts/check-proof-policy.sh` runs the same text lint used in CI.
It scans tracked Lean files for forbidden placeholder and axiom keywords, also in
comments. Kernel checking establishes the encoded statements; this lint supplies
an additional source-review guard and does not compute theorem dependencies.

## Review boundary

Terms use raw natural-number names; there is no alpha-equivalence quotient.
Paper correspondence and capture/binding conventions need mathematical review
alongside successful compilation. A checked equivalence proves the relationship
between the encoded predicates, not their faithfulness to the paper by itself.

Confluence, GC postponement, strategy determinism, multi-types, normalization, and
the abstract machine remain outside the completed development. Their status is
tracked in [the correspondence table](paper-implementation.md).
