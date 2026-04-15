# Evaluation Strategies in the Lambda Calculus

This folder contains short educational notes on three major evaluation strategies:

- **Call-by-Name (CbN)**
- **Call-by-Value (CbV)**
- **Call-by-Need (CbNeed)**

These strategies are essential background for understanding the broader theoretical setting of this repository.

## Why evaluation strategy matters

In the lambda calculus, the term

`f a`

does not determine by itself **when** the argument `a` should be evaluated.

That choice affects:

- whether unused arguments are evaluated at all
- whether repeated computations are duplicated
- whether results are shared
- and, in some cases, whether a program terminates

So evaluation strategy is not just an implementation detail.  
It is part of the semantics of computation.

## The three main strategies

### Call-by-Name
Arguments are not evaluated before function application.  
They are only evaluated if and when they are needed.

### Call-by-Value
Arguments are evaluated before function application.

### Call-by-Need
Arguments are evaluated only when needed, but their result is then shared so that the same work is not repeated.

## One-line intuition

- **CbN**: evaluate only if needed
- **CbV**: evaluate first, then pass the value
- **CbNeed**: evaluate only if needed, and at most once

## Why these notes are here

This repository is not only about Lean code.  
It is also meant to be understandable as a small educational and research-oriented project.

For that reason, these notes explain the conceptual setting around the formalization.

## Files

- [`call-by-name.md`](./call-by-name.md)
- [`call-by-value.md`](./call-by-value.md)
- [`call-by-need.md`](./call-by-need.md)
- [`comparison.md`](./comparison.md)
