-- Math 2001 Teamwork 2
-- ====================

-- Exercises: LaP 9.5. 1--8
-- ------------------------

-- Due: 22 March 2019 by 1pm

-- 1. Fill in the ``sorry``.

section
  variable A : Type
  variable f : A → A
  variable P : A → Prop
  variable  h : ∀ x, P x → P (f x)

  -- Show the following:
  example : ∀ y, P y → P (f (f y)) := 
  assume y : A,
  assume h₁ : P y, show P (f (f y)), from
  have h' : P y → P (f y), from h y,
  have h₂ : P (f y), from h' h₁,
  h (f y) h₂
end

-- 2. Fill in the ``sorry``.

section
  variable U : Type
  variables A B : U → Prop

  example : (∀ x, A x ∧ B x) → ∀ x, A x := sorry
end

-- 3. Fill in the ``sorry``.

section
  variable U : Type
  variables A B C : U → Prop

  variable h1 : ∀ x, A x ∨ B x
  variable h2 : ∀ x, A x → C x
  variable h3 : ∀ x, B x → C x

  example : ∀ x, C x := sorry
end


-- 4. Fill in the ``sorry``'s below, to prove the barber paradox.

open classical   -- not needed, but you can use it

-- This is an exercise from Chapter 4. Use it as an axiom here.
axiom not_iff_not_self (P : Prop) : ¬ (P ↔ ¬ P)

example (Q : Prop) : ¬ (Q ↔ ¬ Q) :=
not_iff_not_self Q

section
  variable Person : Type
  variable shaves : Person → Person → Prop
  variable barber : Person
  variable h : ∀ x, shaves barber x ↔ ¬ shaves x x

  -- Show the following:
  example : false := 
  have hnsbb : ¬ shaves barber barber, from 
  assume hb : shaves barber barber, show false, from
    have h' : shaves barber barber → ¬ shaves barber barber, from iff.elim_left (h barber),
    have nsbb : ¬ shaves barber barber, from h' hb,
    nsbb hb,
  have h'' : ¬ shaves barber barber → shaves barber barber, from iff.elim_right (h barber),
  have hsbb : shaves barber barber, from h'' hnsbb,
   hnsbb hsbb
end

-- 5. Fill in the ``sorry``.

 section
   variable U : Type
   variables A B : U → Prop

   example : (∃ x, A x) → ∃ x, A x ∨ B x := 
   assume h : ∃ x, A x, show ∃ x, A x ∨ B x, from
   exists.elim h
   (assume y : U, assume h' : A y, 
   have h'' : A y ∨ B y, from or.inl h',
   exists.intro y h'')
 end

-- 6. Fill in the ``sorry``.

section
  variable U : Type
  variables A B : U → Prop

  variable h1 : ∀ x, A x → B x
  variable h2 : ∃ x, A x

  example : ∃ x, B x := sorry

end

-- 7. Fill in the ``sorry``.

section
 variable  U : Type
 variables A B C : U → Prop

 example (h1 : ∃ x, A x ∧ B x) (h2 : ∀ x, B x → C x) :
     ∃ x, A x ∧ C x := exists.elim h1 
     (assume y, assume h: A y ∧ B y,
     have h' : A y ∧ C y, from 
     have ha : A y, from and.elim_left h,
     have hb : B y, from and.elim_right h,
     have hbc : B y → C y, from h2 y,
     have hc : C y, from hbc hb,
     and.intro ha hc, -- from ⟨ha, hc⟩,
     exists.intro y h')
end

-- 8. Complete these proofs.

section
  variable  U : Type
  variables A B C : U → Prop

  theorem first_theorem : (¬ ∃ x, A x) → ∀ x, ¬ A x := 
  assume h : ¬ ∃ x, A x, show ∀ x, ¬ A x, from
  assume y : U, show ¬ A y, from 
  assume h' : A y, show false, from 
  have h'' : ∃ x, A x, from exists.intro y h',
  h h''

#check first_theorem
#print first_theorem

  example : (∀ x, ¬ A x) → ¬ ∃ x, A x := sorry
end

-- THE REST ARE EXTRA CREDIT!

-- (Answers to these must be exactly right to earn bonus points; no partial credit here.)

-- 9. Fill in the ``sorry``.
section
  variable  U : Type
  variables R : U → U → Prop

  example : (∃ x, ∀ y, R x y) → ∀ y, ∃ x, R x y := 
  assume h : ∃ x, ∀ y, R x y, show ∀ y, ∃ x, R x y,
  from 
  exists.elim h 
  (assume z, assume h' : ∀ y, R z y,
  assume w, show ∃ x, R x w, from 
  have h'' : R z w, from h' w,
  exists.intro z h'')
end


 -- 10. The following exercise shows that in the presence of reflexivity, the rules for symmetry and transitivity are equivalent to a single rule.

theorem foo {A : Type} {a b c : A} : a = b → c = b → a = c := sorry

-- notice that you can now use foo as a rule. The curly braces mean that
-- you do not have to give A, a, b, or c

section
  variable A : Type
  variables a b c : A

  example (h1 : a = b) (h2 : c = b) : a = c := foo h1 h2
end

section
  variable {A : Type}
  variables {a b c : A}

  -- replace the sorry with a proof, using foo and rfl, without using eq.symm.
  theorem my_symm (h : b = a) : a = b := sorry

  -- now use foo, rfl, and my_symm to prove transitivity
  theorem my_trans (h1 : a = b) (h2 : b = c) : a = c := sorry
end

-- 11. Replace each ``sorry`` below by the correct axiom from the list.

    -- these are the axioms for a commutative ring

#check @add_assoc
#check @add_comm
#check @add_zero
#check @zero_add
#check @mul_assoc
#check @mul_comm
#check @mul_one
#check @one_mul
#check @left_distrib
#check @right_distrib
#check @add_left_neg
#check @add_right_neg
#check @sub_eq_add_neg

variables x y z : int

theorem t1 : x - x = 0 :=
calc
x - x = x + -x : by rw sub_eq_add_neg
    ... = 0      : by rw add_right_neg

theorem t2 (h : x + y = x + z) : y = z :=
calc
y     = 0 + y        : by rw zero_add
    ... = (-x + x) + y : by rw add_left_neg
    ... = -x + (x + y) : by rw add_assoc
    ... = -x + (x + z) : by rw h
    ... = (-x + x) + z : by rw add_assoc
    ... = 0 + z        : by rw add_left_neg
    ... = z            : by rw zero_add

theorem t3 (h : x + y = z + y) : x = z :=
calc
x     = x + 0        : sorry
    ... = x + (y + -y) : sorry
    ... = (x + y) + -y : sorry
    ... = (z + y) + -y : by rw h
    ... = z + (y + -y) : sorry
    ... = z + 0        : sorry
    ... = z            : sorry

theorem t4 (h : x + y = 0) : x = -y :=
calc
x     = x + 0        : by rw add_zero
    ... = x + (y + -y) : by rw add_right_neg
    ... = (x + y) + -y : by rw add_assoc
    ... = 0 + -y       : by rw h
    ... = -y           : by rw zero_add

theorem t5 : x * 0 = 0 :=
have h1 : x * 0 + x * 0 = x * 0 + 0, from
calc
    x * 0 + x * 0 = x * (0 + 0) : sorry
            ... = x * 0       : sorry
            ... = x * 0 + 0   : sorry,
show x * 0 = 0, from t2 _ _ _ h1

theorem t6 : x * (-y) = -(x * y) :=
have h1 : x * (-y) + x * y = 0, from
calc
    x * (-y) + x * y = x * (-y + y) : sorry
                ... = x * 0        : sorry
                ... = 0            : by rw t5 x,
show x * (-y) = -(x * y), from t4 _ _ h1

theorem t7 : x + x = 2 * x :=
calc
x + x = 1 * x + 1 * x : by rw one_mul
    ... = (1 + 1) * x   : sorry
    ... = 2 * x         : rfl

