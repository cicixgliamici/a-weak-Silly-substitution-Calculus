# A Short Guide to Metatheory in Lean

## What metatheory means

A formal language has *syntax* and *rules*. Metatheory is the study of mathematical
properties of that language and those rules.

For this project, a term such as

```text
(lambda x. x) y
```

belongs to the object language, the Silly Substitution Calculus. A statement such as
"every term described by the normal-form grammar has no reduction step" is about the
calculus. It belongs to its metatheory.

Lean is the metalanguage used to define both the calculus and proofs about it. The Lean
kernel checks that each proof is built from the definitions and previously proved
theorems.

## The layers in this repository

The development follows four layers.

### 1. Syntax

`Term` defines the expressions of the object language:

```lean
inductive Term where
  | var : Nat → Term
  | lam : Nat → Term → Term
  | app : Term → Term → Term
  | es  : Term → Nat → Term → Term
```

Functions such as `fv` and `shfv` inspect syntax. Their supporting theorems establish
facts such as "every shallow-free variable is free". These are already small pieces of
syntactic metatheory.

### 2. Operational semantics

Relations such as `MRootStep`, `ERootStep`, and `GCVRootStep` define how terms reduce.
They are propositions rather than executable functions: a value of
`MRootStep source target` is evidence that the indicated multiplicative step is valid.

`WeakClosure` places a root step in a weak context. `Step` is the union of all three rule
families. Semantic normality is then defined negatively:

```lean
def NormalForm (term : Term) : Prop :=
  ¬ ∃ target, Step term target
```

Thus, proving `NormalForm t` means showing that every proposed outgoing step leads to a
contradiction.

### 3. Syntactic classifications

`WeakAnswer`, `Inert`, and `WeakNormalLike` form an inductive grammar. Unlike
`NormalForm`, this grammar explains *why* a term is normal by recording its shape and the
side conditions on its explicit substitutions.

For example, an answer-valued replacement requires:

```lean
x ∈ fv body
x ∉ shfv body
```

The first condition prevents value garbage collection. The second prevents an
exponential step. Keeping these conditions in the grammar makes the mathematical
classification visible rather than hiding it inside `NormalForm`.

### 4. Metatheorems connecting the layers

The main result currently proved by the project is:

```lean
theorem normalForm_iff_weakNormalLike :
    NormalForm term ↔ WeakNormalLike term
```

Its two directions have different roles:

- **Soundness:** `WeakNormalLike term → NormalForm term`. Every term accepted by the
  grammar really has no outgoing step.
- **Completeness:** `NormalForm term → WeakNormalLike term`. The grammar describes all
  weak normal forms, rather than only a convenient subset.

This separation is useful in formalization. The operational definition and the grammar
are defined independently; the theorem proves that they agree.

## Common Lean proof patterns

### Structural induction

Syntax-directed statements are normally proved by induction on a term, context, or
grammar derivation. Each constructor becomes one proof case. For a term induction, the
application case receives induction hypotheses for both children.

### Inversion by cases

Reduction relations and grammars are inductive propositions. `cases` reveals which
constructor could have produced a hypothesis. Impossible combinations, such as a root
multiplicative step whose source is a variable, disappear by constructor disjointness.

### Context lifting

Local rewriting results must be reusable inside larger terms. The theorem
`weakClosure_plugW` says that a step remains valid after placing both endpoints in the
same weak context. Its contrapositive use gives `normal_of_plugW_normal`: every selected
subterm of a normal weak term is normal.

### Witness construction

Existential propositions require concrete witnesses. To prove

```lean
∃ context, plugW context (Term.var x) = term
```

the proof constructs the path from the root of `term` to the selected occurrence. The
result is then used to build an exponential redex.

### Side conditions as rule exclusions

Side conditions should have an operational explanation:

| Condition or shape | Rule excluded |
|---|---|
| inert function head | multiplicative (`m`) |
| `x ∉ shfv body` | exponential (`e`) |
| inert replacement | value garbage collection (`gcv`) |
| `x ∈ fv body` for an answer replacement | value garbage collection (`gcv`) |

This table is the core idea behind the soundness proof.

## What tests mean for proofs

Lean examples are compile-time regression tests. They are useful for checking that public
theorems remain convenient to apply and that representative terms fall into the expected
classes. They do not replace universal theorems: ten checked examples of normal terms do
not prove that the grammar is sound. The quantified theorem does.

The metatheory tests deliberately include both positive and negative examples:

- construction of each normal explicit-substitution form;
- rejection of a beta redex;
- rejection of an exponential redex;
- rejection of a garbage-collection redex;
- use of both directions of the normal-form characterization.

## Natural next steps

Further rewriting metatheory usually introduces:

1. reflexive-transitive closure, to describe reduction sequences;
2. labelled sequence lengths, to count different rule families;
3. local postponement diagrams;
4. confluence and commutation properties;
5. normalization results.

Each global theorem should be assembled from small structural lemmas. This makes kernel
errors local, exposes hidden assumptions, and keeps the development reviewable.
