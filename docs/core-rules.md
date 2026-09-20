# Core Rules Implemented in Lean

This document describes the operational system that the repository implements today. The
root rules and CbS context grammar now follow the paper; missing higher metatheory is
tracked in [Paper implementation status](paper-implementation.md).

## Terms and binding

Terms have grammar

```text
t, u ::= x | λx.t | t u | t[x <- u]
```

Both `λx.t` and `t[x <- u]` bind `x` in `t`. The explicit-substitution binder does not
scope over `u`.

Lean represents names with natural numbers. The syntax is not quotiented by alpha
equivalence. Instead, `freshName`, `renameBound`, and `subst` provide the basic machinery
for capture-avoiding meta-level operations.

Only abstractions are values:

```text
v ::= λx.t
```

This choice is important for value garbage collection and agrees with the paper.

## Variable sets

`fv(t)` contains the free names of `t`. `shfv(t)` contains only free names occurring
outside lambda abstractions. Both are implemented as duplicate-free finite collections.

The library proves:

```text
shfv(t) subset-of fv(t)
freshName(t, u) not-in fv(t)
freshName(t, u) not-in fv(u)
```

## Contexts

A weak context places one hole anywhere except under a lambda:

```text
W ::= <.> | W t | t W | W[x <- t] | t[x <- W]
```

A substitution context is a list of explicit substitutions:

```text
S ::= <.> | S[x <- t]
```

`plugW W t` and `plugS S t` fill their respective holes. Weak-context composition is
defined and its plugging law is proved.

## Root reduction

The calculus has three independently represented root relations.

### Multiplicative step

```text
S<λx.t> u  ->m  S<t[x <- u]>
```

This is beta reduction at a distance: the argument becomes an explicit substitution.

### Exponential step

```text
W<x>[x <- u]  ->e  W<u>[x <- u]
```

One selected occurrence is replaced. The explicit substitution remains, so duplication
is a linear micro-step rather than global propagation through the term.

### Value garbage collection

```text
t[x <- S<v>]  ->gcv  S<t>
    when x not-in fv(t)
```

The substitution context around the value is preserved because its stored terms may
contain computations that cannot be erased with the value.

## Weak reduction and normality

`MStep`, `EStep`, and `GCVStep` close the corresponding root relations under weak
contexts. `Step`, written `->`, is exactly their union. Therefore reduction may occur in
applications and either side of an explicit substitution, but never under a lambda.

A term is in `NormalForm` when no weak step starts from it.

The current syntactic normal-form grammar is partial: it covers lambdas, variables, and
applications with an inert head, but not all normal explicit substitutions from the
paper. The library proves soundness of this grammar, not completeness.

## Strategic reduction

`Strategy.lean` contains the paper's name, auxiliary, and silly contexts and the four CbS
step constructors. Both auxiliary productions `a[x <- A]` and `A[x <- t]` are represented,
and the two exponential rules preserve their asymmetric `A/Y` and `Y/N` placement.

The library proves that every strategic step is a generic weak step. Determinism, diamond,
and strategic normal-form characterization are not yet claimed.
