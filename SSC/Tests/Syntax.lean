import SSC.Syntax

namespace SSC.Tests

open Term

-- Test variable free variables
example : fv (var 5) = [5] := by rfl

-- Test application free variables
example : fv (app (var 1) (var 2)) = [1, 2] := by rfl

-- Test lambda free variables
example : fv (lam 0 (var 0)) = [] := by rfl
example : fv (lam 0 (var 1)) = [1] := by rfl

-- Test explicit substitution free variables: fv(t[x ↦ u]) = (fv(t) \ {x}) ∪ fv(u)
example : fv (es (var 0) 0 (var 1)) = [1] := by rfl
example : fv (es (app (var 0) (var 2)) 0 (var 1)) = [2, 1] := by rfl
example : fv (es (var 2) 0 (var 1)) = [2, 1] := by rfl

-- Shallow free variables
example : shfv (var 5) = [5] := by rfl
example : shfv (lam 0 (var 1)) = [] := by rfl
example : shfv (es (var 0) 0 (var 1)) = [1] := by rfl -- wait, es t x u = (shfv t).erase x ++ shfv u. (shfv (var 0)).erase 0 = [], ++ [1] = [1]

end SSC.Tests
