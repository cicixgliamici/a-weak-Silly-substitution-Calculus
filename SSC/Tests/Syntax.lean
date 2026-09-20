import SSC.Syntax

namespace SSC.Tests

open Term

-- Free-variable sets contain exactly the unbound names.
example : fv (var 5) = [5] := by rfl
example : 1 ∈ fv (app (var 1) (var 2)) := by simp
example : 2 ∈ fv (app (var 1) (var 2)) := by simp
example : fv (lam 0 (var 0)) = [] := by rfl
example : fv (lam 0 (var 1)) = [1] := by rfl
example : fv (es (var 0) 0 (var 1)) = [1] := by rfl
example : fv (es (app (var 0) (var 2)) 0 (var 1)) = [2, 1] := by rfl
example : fv (es (var 2) 0 (var 1)) = [2, 1] := by rfl

-- Every bound occurrence is removed, fixing the former single-erase bug.
example : fv (lam 0 (app (var 0) (var 0))) = [] := by rfl

-- Set union removes duplicates.
example : fv (app (var 1) (var 1)) = [1] := by rfl

-- Shallow free variables ignore everything below a lambda.
example : shfv (var 5) = [5] := by rfl
example : shfv (lam 0 (var 1)) = [] := by rfl
example : shfv (es (var 0) 0 (var 1)) = [1] := by rfl

-- Capture-avoiding substitution alpha-renames a conflicting binder.
example : subst (lam 1 (var 0)) 0 (var 1) = lam 2 (var 1) := by rfl

-- A binder shadows the variable being substituted.
example : subst (lam 0 (var 0)) 0 (var 1) = lam 0 (var 0) := by rfl

-- An explicit-substitution binder scopes only over its target.
example :
    subst (es (var 0) 0 (var 0)) 0 (var 2) = es (var 0) 0 (var 2) := by
  rfl

end SSC.Tests
