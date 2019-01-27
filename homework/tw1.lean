-- Teamwork 1
-- Due: Friday 15 February by 2pm

variables A B C D : Prop

-- Exercise 1
example : A ∧ (A → B) → B :=
  assume h : A ∧ (A → B),
  have ha : A, from and.elim_left h,
  have hab : A → B, from and.elim_right h,
  show B, from hab ha 


-- Exercise 2
example : A → ¬ (¬ A ∧ B) := 
  assume h : A, 
  assume hc : ¬ A ∧ B,
  show false, from (and.elim_left hc) h

example  (h : false) : A := false.elim h

-- Exercise 3
example : ¬ (A ∧ B) → (A → ¬ B) :=
  assume hnab : ¬ (A ∧ B), 
  assume ha : A,
  assume hb : B, 
  show false, from
    have hab : A ∧ B, from and.intro ha hb,
    hnab hab


-- Exercise 4
example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D :=
  or.elim h₁
    (assume ha : A, or.inl (h₂ ha))
    (assume hb : B, or.inr (h₃ hb) )


-- Exercise 5
example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) :=
  assume h1 : A ∨ B, show false, from 
  or.elim h1
    (assume ha : A, (and.elim_left h) ha)
    (assume hb : B, (and.elim_right h) hb)

-- Exercise 6
example : ¬ (A ↔ ¬ A) := 
  assume h : A ↔ ¬ A, show false, from 
  have hna : ¬ A, from 
    (assume ha : A, show false, from
      have h' : ¬ A, from (iff.elim_left h) ha,
      h' ha),
  have ha : A, from (iff.elim_right h) hna,
  hna ha


