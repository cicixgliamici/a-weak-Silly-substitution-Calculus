# A Weak Silly Substitution Calculus

This repository is a small theoretical and technical project centered on a custom substitution calculus.

Its purpose is to explore a formal system in a way that is both:
- **conceptually readable**, and
- **technically inspectable**.

The repository is intended as a compact space for studying a calculus, its syntax and rules, and the computational or proof-theoretic intuitions that motivate it.

---

## Why this repository matters

This project is useful as a small but focused artifact for anyone interested in:
- formal systems,
- substitution mechanisms,
- rewriting and reduction behavior,
- programming-language theory,
- and logic-oriented computational models.

Rather than trying to be large, the goal of the repository is to be **precise, understandable, and extensible**.

It is meant to show an interest in rigorous theoretical computer science through a repository that can later grow into:
- notes,
- examples,
- formal rules,
- reduction traces,
- or even mechanized formalization.

---

## Repository goal

The main goal of the project is to document and study a substitution-based formal calculus by making explicit:
- the syntax of terms,
- the role of substitution,
- the operational or reduction rules,
- and the main intuitions behind the system.

Depending on the current state of the repository, this may include theoretical notes, examples, implementation sketches, or experimental formalization material.

---

## Suggested reading path

If you are reviewing the repository, the recommended path is:

1. Read this README to understand the purpose of the project.
2. Inspect the core files that define the calculus or its notation.
3. Look for examples, rules, or traces illustrating how substitution behaves.
4. Check whether the repository includes implementation notes, formal derivations, or future formalization directions.

---

## What this repository is trying to demonstrate

This repository is primarily meant to demonstrate:
- interest in **formal reasoning**,
- comfort with **abstract computational systems**,
- willingness to work on **small but rigorous theoretical artifacts**,
- and the ability to structure a repository around a precise conceptual object rather than around a generic software project.

---

## Current scope

At the moment, the repository should be understood as a focused project around a specific calculus rather than as a fully mature framework.

Its value lies in the clarity of the underlying formal object and in the possibility of extending it with:
- worked examples,
- derivation notes,
- reduction semantics,
- comparisons with lambda-calculus style substitutions,
- or mechanized reasoning tools.

---

## Future directions

Natural future extensions include:
- a formal presentation of syntax and rules,
- worked reduction examples,
- a small interpreter or reducer,
- mechanized formalization in Lean / Coq / Isabelle,
- and comparisons with standard calculi from programming-language theory.

These are directions for growth, not claims about what is already fully present.

---

## Positioning

This repository is best read as a compact theory-oriented project at the intersection of:
- logic,
- rewriting,
- substitution models,
- and programming-language foundations.

---

## Repository Structure

To help reviewers and contributors navigate the mechanization, here is a map of the Lean 4 source files:

* `SSC.lean` / `Main.lean`: Entry points for the library and the executable.
* **`SSC/Syntax.lean`**: Defines the AST of the calculus (`Term`), values, and free variable calculation (`fv`, `shfv`).
* **`SSC/Contexts.lean`**: Defines Weak Contexts (`WCtx`) and Substitution Contexts (`SCtx`) and their plugging operations.
* **`SSC/Reduction.lean`**: Defines the root reduction rules (`RootStep`) and the weak contextual closure (`Step` or `⟶`).
* **`SSC/Strategy.lean`**: Defines Call-by-Silly contexts (`YCtx`) and its strict reduction strategy (`YStep` or `⟶y`).
* **`SSC/NormalForms.lean`**: Defines the inductive grammar for normal forms (`Inert`, `WeakNormalLike`, `WeakAnswer`).
* **`SSC/Theorems/`**: Contains formal, mechanically-verified proofs. For example, `WeakNormalImpliesNormal.lean` proves that inert terms cannot reduce.
* **`SSC/Tests/`**: A compile-time verified test suite for syntax, contexts, and reduction examples. Evaluated automatically on `lake build`.

---

## Minimal formal core

The repository can be made immediately more concrete by adding a compact formal core.

### Informal term grammar

A minimal syntax for terms could be presented as:

```text
t ::= x
    | λx.t
    | t t
    | t[x := t]
````

where:

* `x` ranges over variables
* `λx.t` is abstraction
* `t t` is application
* `t[x := u]` is an explicit substitution form

This is intentionally small: the goal is to make substitution part of the syntax rather than treating it only as a meta-operation.

---

## Intuition

The key idea is that substitution is represented explicitly inside terms.

Instead of saying only at the meta-level that substitution happens “outside” the calculus, the system can expose it as a first-class syntactic object. This makes it easier to reason about:

* how substitution propagates,
* when it is delayed,
* how it interacts with variables and binders,
* and what operational rules are needed to reduce terms.

---

## Example reduction intuition

A standard motivating example is beta-reduction with explicit substitution:

```text
(λx.t) u  →  t[x := u]
```

Rather than performing substitution immediately as an external meta-step, the calculus records it explicitly.

From there, additional rules can describe how substitutions propagate through syntax.

For example, one may want rules of the following informal shape:

```text
x[x := u]       → u
y[x := u]       → y          if y ≠ x
(t1 t2)[x := u] → (t1[x := u]) (t2[x := u])
```

These examples are only illustrative, but they make the repository much easier to read because they show what kind of computational behavior the calculus is meant to capture.

---

## Why explicit substitution matters

Making substitution explicit is interesting because it helps connect:

* lambda-calculus style reduction
* implementation-oriented views of evaluation
* rewriting systems
* proof-theoretic and structural accounts of computation

This is one of the reasons calculi of explicit substitution are useful both in theory and in language implementation discussions.

---

## Lean 4 & Lake: Quick Reference

This project is built using [Lean 4](https://leanprover.github.io/) and its package manager, **Lake** (Lean Make). Lake is used to build the Lean project, manage dependencies, and execute binaries. 

Here are the main commands you'll need to run and interact with the code:

* `lake build`: Compiles the entire project and its dependencies. This is typically the first command you run after cloning the repository.
* `lake exe LeanSsc`: Runs the main executable defined in the `lakefile.toml`.
* `lake clean`: Removes build artifacts, providing a clean state for the next build.
* `lake update`: Updates the dependencies specified in the `lake-manifest.json` to their latest versions.

To use the Lean 4 interactive theorem proving features (like checking types or proofs), open any `.lean` file in an editor with the Lean 4 extension installed (such as VS Code). The Lean language server will automatically start checking the file.
