import SSC.Decompose
import SSC.Strategy

namespace SSC.Tests

open Term

-- Test Weak Contexts
example : plugW WCtx.hole (var 0) = var 0 := by rfl
example : plugW (WCtx.appL WCtx.hole (var 1)) (var 0) = app (var 0) (var 1) := by rfl
example : plugW (WCtx.esL WCtx.hole 0 (var 1)) (var 2) = es (var 2) 0 (var 1) := by rfl

-- Test Substitution Contexts
example : plugS SCtx.hole (var 0) = var 0 := by rfl
example : plugS (SCtx.es SCtx.hole 0 (var 1)) (var 2) = es (var 2) 0 (var 1) := by rfl

-- Test Silly Contexts
example : plugA ACtx.hole (var 0) = var 0 := by rfl
example : plugN NCtx.hole (var 0) = var 0 := by rfl
example : plugY (YCtx.mk ACtx.hole NCtx.hole) (var 0) = var 0 := by rfl

-- YCtx composing ACtx and NCtx
example : plugY (YCtx.mk ACtx.hole (NCtx.appL NCtx.hole (var 1))) (var 0) = app (var 0) (var 1) := by rfl

end SSC.Tests
