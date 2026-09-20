# A Weak Silly Substitution Calculus

This repository is a Lean 4 mechanization of a growing fragment of the weak Silly
Substitution Calculus (SSC) introduced in *Mirroring Call-by-Need, or Values Acting
Silly* by Beniamino Accattoli and Adrienne Lancelot.

The project is intentionally explicit about its boundary: it contains a verified
prototype, not yet the complete paper development. Every theorem in the Lean library is
kernel-checked and the source contains no `sorry`, `admit`, or project axioms.

## What is implemented

The current library provides:

- named lambda terms with explicit substitutions;
- duplicate-free finite sets of free and shallow free variables;
- fresh-name generation, binder renaming, and capture-avoiding meta-substitution;
- weak and substitution contexts with plugging and composition;
- paper-faithful multiplicative, exponential, and value-garbage-collection root rules;
- separately labelled weak closures and their generic union;
- the four-rule Call-by-Silly strategy from the paper;
- a checked proof that every CbS step is a generic weak SSC step;
- a partial grammar of weak normal forms;
- a checked proof that every term in that partial grammar is weak-normal;
- compile-time examples and tests.

The exact correspondence—and current differences—between the Lean code and the paper
are recorded in [Paper implementation status](docs/paper-implementation.md).

## Start here

1. [Project architecture](docs/architecture.md) explains module boundaries and dependency
   direction.
2. [Core rules](docs/core-rules.md) describes the semantics currently implemented.
3. [Paper implementation status](docs/paper-implementation.md) maps the paper to Lean and
   lists known gaps without overstating completeness.
4. [Example reductions](docs/example-reduction.md) gives traces that agree with the Lean
   rules.
5. [Evaluation strategies](docs/evaluation-strategies/README.md) provides background on
   call-by-name, call-by-value, and call-by-need.

The source paper and its LaTeX material are included under `docs/` for reference.

## Source map

| Module | Responsibility |
|---|---|
| `SSC/Syntax.lean` | Terms, variable sets, free variables, freshness, renaming, substitution |
| `SSC/Contexts.lean` | Weak and substitution contexts, plugging, composition |
| `SSC/Decompose.lean` | Experimental decomposition witnesses and predicates |
| `SSC/Reduction.lean` | Labelled root rules, weak closures, their union, and normality |
| `SSC/Strategy.lean` | Paper CbS contexts, strategic reduction, and inclusion in weak reduction |
| `SSC/NormalForms.lean` | Partial syntax of weak answers and inert terms |
| `SSC/Theorems/WeakNormalImpliesNormal.lean` | Soundness of the partial normal-form grammar |
| `SSC/Examples.lean` | Checked reduction examples |
| `SSC/Tests/` | Compile-time regression tests |

`SSC.lean` is the library entry point. `Main.lean` builds the small `LeanSsc`
executable and imports the complete checked development.

## Build and verification

The project pins Lean in `lean-toolchain` and has no external Lean package dependency.

```text
lake build
lake exe LeanSsc
```

`lake build` checks definitions, proofs, examples, and tests. GitHub Actions runs the same
command for pushes and pull requests to `main`.

For editor and Lake setup details, see [Lean 4 and Lake guide](docs/lean4-lake-guide.md).

## Formalization policy

- Definitions are separated from derived results.
- Difficult proofs include a local proof roadmap listing their dependency chain.
- Comments explain semantic or proof-design decisions, not merely syntax.
- Paper correspondence is documented independently from aspirational work.
- New metatheory should first establish small structural lemmas, then local results, and
  only then global theorems.

The next major milestone is the complete bidirectional characterization of weak normal
forms, followed by postponement and confluence infrastructure.

## License

See [LICENSE](LICENSE).
