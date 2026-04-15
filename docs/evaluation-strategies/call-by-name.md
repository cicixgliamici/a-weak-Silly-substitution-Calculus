# Call-by-Name

## Core idea

In **call-by-name (CbN)**, a function argument is **not evaluated before** the function is applied.

Instead, the unevaluated argument expression is substituted into the function body, and evaluation proceeds only if that argument is actually needed.

## Informal example

Consider:

`(\x. 1) Ω`

where `Ω` is a diverging term.

Under call-by-name, the argument `Ω` is never used, because the function body does not depend on `x`.

So the result is simply:

`1`

This is the key intuition behind call-by-name:

> do not evaluate arguments unless they are actually needed.

## Strength

Call-by-name is often described as **wise with respect to erasure**.

That means:

- if an argument is never used,
- call-by-name avoids evaluating it.

This is an important theoretical feature, because it can preserve termination in cases where stricter strategies diverge.

## Weakness

Call-by-name can be **wasteful with duplication**.

If the function uses its argument more than once, then the same expression may be evaluated multiple times.

For example, informally:

`(\x. x + x) expensive`

Under call-by-name, `expensive` may be recomputed twice.

So call-by-name is good at avoiding useless work, but bad at sharing repeated work.

## Why it matters in theory

Call-by-name plays a central role in the theory of the lambda calculus because:

- it gives a clean operational baseline
- it makes substitution behavior very visible
- it is closely connected to classic foundational studies of evaluation

## Summary

### Main advantage
- avoids evaluating unused arguments

### Main drawback
- may duplicate expensive computations

### Best one-line intuition
- "Evaluate arguments only when they are needed, but do not share them."

## Quick contrast with call-by-value

Term:

`(\x. 1) Ω`

- **CbN**: returns `1`
- **CbV**: diverges

This already shows that evaluation strategy affects more than efficiency.  
It can affect whether a term terminates at all.
