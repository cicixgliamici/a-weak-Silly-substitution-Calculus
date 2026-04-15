# Call-by-Value

## Core idea

In **call-by-value (CbV)**, a function argument is evaluated **before** the function is applied.

So in an application:

`f a`

the argument `a` is first reduced to a value, and only then passed to `f`.

## Informal example

Consider again:

`(\x. 1) Ω`

Under call-by-value, the machine first tries to evaluate `Ω`.

But `Ω` diverges.

So the whole term diverges.

This is the opposite behavior from call-by-name in this example.

## Strength

Call-by-value is often described as **wise with respect to duplication**.

That means:

- if a function uses its argument multiple times,
- the argument can be evaluated once,
- and the resulting value can then be reused.

This avoids repeated evaluation of the same computation.

## Weakness

Call-by-value is **wasteful with erasure**.

If a function never uses its argument, call-by-value may still evaluate that argument before the call.

So it can spend time reducing computations that are later discarded.

## Practical intuition

Call-by-value is a very natural operational model:

1. compute the argument
2. pass the resulting value
3. continue evaluation

This makes it intuitive in many programming settings, especially where effects and state matter.

## Summary

### Main advantage
- avoids repeated evaluation of the same argument

### Main drawback
- evaluates arguments even when they are never used

### Best one-line intuition
- "Evaluate first, then pass the value."

## Quick contrast with call-by-name

Term:

`(\x. 1) Ω`

- **CbN**: returns `1`
- **CbV**: diverges

Term:

`(\x. x + x) expensive`

- **CbN**: may recompute `expensive`
- **CbV**: computes `expensive` before the call

So call-by-value is often stronger on reuse of work, but weaker on avoiding useless work.
