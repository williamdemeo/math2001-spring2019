-- Teamwork 1
-- Due: Friday 15 February by 2pm

-- Instructions. Replace each "sorry" with a proof of the given statement.

variables A B C D : Prop

-- Exercise 1
example : A ∧ (A → B) → B := sorry

-- Exercise 2
example : A → ¬ (¬ A ∧ B) := sorry

example  (h : false) : A := sorry

-- Exercise 3
example : ¬ (A ∧ B) → (A → ¬ B) := sorry

-- Exercise 4
example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D := sorry

-- Exercise 5
example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) := sorry

-- Exercise 6
example : ¬ (A ↔ ¬ A) := sorry


