# Checked Reduction Examples

These examples follow the Lean relations currently defined in `SSC.Reduction`. In
particular, an exponential step replaces one occurrence and retains the explicit
substitution.

Let

```text
I := λ1.1
```

## Identity applied to a value

Starting from

```text
(λ0.0) I
```

the multiplicative rule gives

```text
(λ0.0) I  ->m  0[0 <- I].
```

The exponential rule replaces the selected occurrence but retains the substitution:

```text
0[0 <- I]  ->e  I[0 <- I].
```

Since `I` is a value and `0` is not free in `I`, value garbage collection applies:

```text
I[0 <- I]  ->gcv  I.
```

Thus the checked shape of the complete trace is

```text
(λ0.0) I  ->  0[0 <- I]  ->  I[0 <- I]  ->  I.
```

## Linear replacement inside an application

Consider

```text
(0 2)[0 <- I].
```

The exponential rule can select the occurrence of `0` using the weak context `<.> 2`:

```text
(0 2)[0 <- I]  ->e  (I 2)[0 <- I].
```

This is not a propagation rule that copies the substitution onto both children. It is a
single-occurrence replacement, which is the relevant micro-step behavior.

Garbage collection can then remove the residual substitution:

```text
(I 2)[0 <- I]  ->gcv  I 2.
```

## Preserving a substitution context during garbage collection

Suppose the discarded value is surrounded by another explicit substitution:

```text
2[0 <- I[4 <- 9]].
```

Here `S = <.>[4 <- 9]`. The paper-faithful value-GC rule moves this context to the
surviving target instead of deleting it:

```text
2[0 <- S<I>]  ->gcv  S<2>

2[0 <- I[4 <- 9]]  ->gcv  2[4 <- 9].
```

This trace is included as a compile-time regression test. Preserving `S` matters because
its stored term need not be a value or terminating computation.

## Why a variable argument behaves differently

With a free variable `7`, Lean checks

```text
(λ0.0) 7  ->m  0[0 <- 7]  ->e  7[0 <- 7].
```

The last substitution is not removed by the current `gcv` rule because variables are not
values. This is intentional in the present semantics and is why documentation must not
shorten this trace to `(λ0.0) 7 ->* 7`.

## Capture avoidance at the meta-level

Operational explicit substitutions are syntax and are reduced by the rules above. The
separate Lean function `subst` performs capture-avoiding meta-substitution. For example,

```text
subst (λ1.0) 0 1 = λ2.1
```

The binder is renamed to fresh name `2` before replacement, preventing the inserted free
`1` from becoming captured.
