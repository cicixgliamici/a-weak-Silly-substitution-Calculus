# Comparing Call-by-Name, Call-by-Value, and Call-by-Need

## Overview table

| Strategy | When is the argument evaluated? | Are unused arguments evaluated? | Is repeated work shared? |
|---|---|---:|---:|
| Call-by-Name | Only when needed | No | No |
| Call-by-Value | Before the call | Yes | Yes, operationally, because the argument is evaluated first |
| Call-by-Need | Only when needed | No | Yes |

## The core trade-off

The most important trade-off is between:

- **erasure**: avoiding work that will never be used
- **duplication**: avoiding repeated evaluation of the same computation

### Call-by-Name
- good at erasure
- bad at duplication

### Call-by-Value
- bad at erasure
- good at duplication

### Call-by-Need
- tries to combine the strengths of both

## Canonical example 1

Consider:

`(\x. 1) Ω`

where `Ω` is a diverging term.

### Under Call-by-Name
The argument is not evaluated unless needed.  
Since `x` is never used, the result is simply:

`1`

### Under Call-by-Value
The argument is evaluated before the function call.  
So evaluation tries to reduce `Ω`, which diverges.

### Under Call-by-Need
The argument is still evaluated only if needed.  
Since `x` is never used, the result is again:

`1`

This example shows the role of **erasure**.

## Canonical example 2

Consider:

`(\x. x + x) expensive`

### Under Call-by-Name
The term `expensive` may be evaluated twice.

### Under Call-by-Value
The term `expensive` is evaluated before the call, so the function receives a value.

### Under Call-by-Need
The term `expensive` is evaluated only when first needed, and the result is then shared.

This example shows the role of **duplication** and **sharing**.

## Practical summary

### Call-by-Name
A clean theoretical baseline.  
Useful for understanding lazy behavior without sharing.

### Call-by-Value
The standard eager model in many programming settings.  
Operationally intuitive and strong on reuse of computed values.

### Call-by-Need
The central model of lazy sharing.  
Avoids useless work and avoids recomputation.

## Why this matters for this repository

The formal code in this repository lives in a broader semantic landscape shaped by these evaluation strategies.

Understanding their differences helps explain why explicit substitutions, weak reduction, and related calculi are mathematically interesting.
