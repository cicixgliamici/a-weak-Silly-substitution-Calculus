# Example Reduction — A Weak Silly Substitution Calculus

This document gives a few compact reduction traces illustrating the intuition behind explicit substitution.

The examples are deliberately small: their purpose is to make the repository easier to inspect and reason about.

---

## Example 1 — Identity-like behavior

Start with:

```text
(λx.x) y
````

### Step 1 — beta step with explicit substitution

```text
(λx.x) y  →  x[x := y]
```

Instead of immediately replacing `x` by `y` as a meta-operation, the calculus records substitution explicitly.

### Step 2 — variable hit

```text
x[x := y]  →  y
```

So the full trace is:

```text
(λx.x) y  →  x[x := y]  →  y
```

---

## Example 2 — Application structure

Start with:

```text
(λx. x z) u
```

### Step 1 — beta step with explicit substitution

```text
(λx. x z) u  →  (x z)[x := u]
```

### Step 2 — propagate through application

```text
(x z)[x := u]  →  (x[x := u]) (z[x := u])
```

### Step 3 — resolve variable hit and miss

```text
x[x := u]  →  u
z[x := u]  →  z
```

So the full trace is:

```text
(λx. x z) u
→ (x z)[x := u]
→ (x[x := u]) (z[x := u])
→ u z
```

---

## Example 3 — Why explicit substitution is useful

Consider again:

```text
(λx.t) u
```

In a standard presentation, one often writes directly:

```text
t{x := u}
```

as if substitution happened invisibly in one meta-level step.

In an explicit substitution calculus, we instead write:

```text
(λx.t) u  →  t[x := u]
```

This makes substitution itself part of the computational story.

That is useful because it allows us to reason more carefully about:

* where substitution is located
* how it propagates
* which rules are needed
* and what happens near binders

---

## What these examples show

These traces illustrate three key ideas:

* beta-reduction can expose substitution instead of hiding it
* substitution can propagate structurally through terms
* explicit substitution turns a meta-level concept into a first-class object of study

---

## Next natural example to add

A good future extension would be an example involving abstraction and variable-capture concerns, together with a note on why freshness conditions matter.
