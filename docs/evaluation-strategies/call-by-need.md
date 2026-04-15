# Call-by-Need

## Core idea

In **call-by-need (CbNeed)**, an argument is evaluated **only when it is actually needed**, just as in call-by-name.

However, once it is evaluated, its result is **shared**, so the same computation is not repeated.

So call-by-need tries to combine the best parts of:

- **call-by-name**: do not evaluate unused arguments
- **call-by-value**: do not recompute the same result many times

## Informal example

Consider:

`(\x. x + x) expensive`

Under call-by-name, the term `expensive` may be evaluated twice.

Under call-by-need, the first use of `x` triggers evaluation of `expensive`, and the resulting value is then shared for the second use.

So the computation is performed at most once.

## Strength

Call-by-need is often described as combining:

- **wise erasure** from call-by-name
- **wise duplication** from call-by-value

This is why it is such an important strategy in the theory of functional computation.

## Why it is theoretically important

A major theoretical idea behind call-by-need is that it can often be seen as a more efficient operational presentation of behavior that is observationally close to call-by-name.

So it is not just a practical compromise.  
It is a deep semantic and operational idea.

## Practical intuition

Call-by-need is the key idea behind **lazy evaluation with sharing**.

The operational picture is:

- do not evaluate arguments immediately
- evaluate them only on demand
- once evaluated, remember the result

This avoids both:
- useless work
- repeated work

## Summary

### Main advantage
- avoids evaluating unused arguments
- avoids recomputing needed arguments

### Main drawback
- implementation is more subtle than plain call-by-name or plain call-by-value

### Best one-line intuition
- "Evaluate only when needed, and at most once."

## Quick comparison

Term:

`(\x. 1) Ω`

- **CbN**: returns `1`
- **CbV**: diverges
- **CbNeed**: returns `1`

Term:

`(\x. x + x) expensive`

- **CbN**: may compute `expensive` twice
- **CbNeed**: computes it once and shares the result

So call-by-need captures the central idea of laziness plus sharing.
