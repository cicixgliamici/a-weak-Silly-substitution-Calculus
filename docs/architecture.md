# Project Architecture

## Design goals

The library is organized as a small metatheory project rather than as an evaluator. Its
main architectural rules are:

- syntax must not depend on operational semantics;
- contexts must not depend on particular reduction strategies;
- the generic weak calculus must precede strategic restrictions;
- syntactic normal forms and their semantic soundness remain separate;
- tests import public definitions and theorems rather than reimplementing them;
- global results are assembled from named local lemmas.

## Dependency direction

```text
Syntax
  -> Contexts
      -> Decompose
          -> Reduction
              -> Strategy
              -> NormalForms
                  -> WeakNormalImpliesNormal

Syntax / Contexts / Reduction / Strategy
  -> Examples
  -> Tests

All library modules
  -> SSC.lean
  -> Main.lean
```

Imports should follow this direction. A lower layer must not import a theorem from a
higher layer merely to simplify a proof.

## Module responsibilities

### `SSC.Syntax`

Owns the term datatype and operations whose meaning is independent of evaluation:

- `Term`, `IsValue`, and structural size;
- finite variable sets;
- `fv`, `shfv`, and `Closed`;
- maximum and fresh names;
- binder renaming;
- capture-avoiding meta-substitution;
- structural invariants and membership lemmas.

`VarSet` is a dependency-free, duplicate-free list representation. Public analyses prove
the `Nodup` invariant, so later metatheory can reason extensionally through membership
lemmas instead of relying on list layout.

### `SSC.Contexts`

Owns one-hole weak and substitution contexts, their plugging operations, and context
composition. This layer is reusable by both the generic calculus and strategies.

### `SSC.Decompose`

Contains experimental witnesses for important shapes such as a variable inside a weak
context or a lambda inside a substitution context. It should eventually grow into proven
decomposition and uniqueness lemmas.

### `SSC.Reduction`

Owns primitive root steps, their weak contextual closure, and semantic normality. It must
not silently identify the generic calculus with a particular evaluation strategy.

### `SSC.Strategy`

Owns the restricted Call-by-Silly contexts and strategic steps. Its architectural contract
is witnessed by `yStep_implies_step`: every strategic step is a generic weak step.

### `SSC.NormalForms`

Owns inductive grammars that classify normal terms. Keeping these predicates outside
`Reduction` avoids building the desired characterization into semantic normality by
definition.

### `SSC.Theorems`

Contains results that connect independently defined layers. Complex files begin with a
proof roadmap and arrange helper lemmas in dependency order.

### Examples and tests

`SSC.Examples` presents named terms and checked derivations. `SSC.Tests` contains compact
regressions for computation and theorem application. Tests are part of `lake build`.

## Proof organization convention

For a non-trivial theorem, the file should present its logical ladder before the proof.
For example:

```text
context shape exclusion
  -> base normal forms
  -> closure over inert applications
  -> mutual grammar soundness
  -> public normal-form theorem
```

The helper declarations then appear in that order. Private helpers are preferred when
they have no reusable mathematical meaning; reusable structural facts remain public and
documented.

Inside a long case split, comments should explain why each constructor is impossible or
which induction hypothesis closes it. Comments should not merely restate tactic syntax.

## Verification boundary

`lake build` is the authoritative check. It verifies all imported examples and tests but
does not establish correspondence with the paper by itself. That correspondence is a
separate review obligation tracked in [Paper implementation status](paper-implementation.md).
