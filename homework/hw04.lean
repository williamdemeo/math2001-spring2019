-- Math 2001 Homework 04 Lean Exercises

-- 5.3.6. 
-- Prove ¬ (A ∧ B) → ¬ A ∨ ¬ B by replacing the sorry's below by proofs.

open classical
variables {A B C : Prop}

lemma step1 (h₁ : ¬ (A ∧ B)) (h₂ : A) : ¬ A ∨ ¬ B :=
have ¬ B, from (assume b : B, have x:A ∧ B, from and.intro h₂ b, h₁ x),
show ¬ A ∨ ¬ B, from or.inr this

lemma step2 (h₁ : ¬ (A ∧ B)) (h₂ : ¬ (¬ A ∨ ¬ B)) : false :=
have ¬ A, from
  assume A,
  have ¬ A ∨ ¬ B, from step1 h₁ ‹A›,
  show false, from h₂ ‹¬ A ∨ ¬ B›,
show false, from sorry

theorem step3 (h : ¬ (A ∧ B)) : ¬ A ∨ ¬ B :=
by_contradiction
  (assume h' : ¬ (¬ A ∨ ¬ B),
  show false, from step2 h h')



-- 5.3.7. This exercise is optional (not required).
-- open classical
-- variables {A B C : Prop}

-- example (h : ¬ B → ¬ A) : A → B := sorry

-- example (h : A → B) : ¬ A ∨ B := 
-- sorry
