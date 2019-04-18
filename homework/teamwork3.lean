import data.set

--1. Fill in the ``sorry``'s.

  section
  open set
    variable U : Type
    variables A B C : set U

    example : ∀ x, x ∈ A ∩ C → x ∈ A ∪ B := sorry

    example : ∀ x, x ∈ -(A ∪ B) → x ∈ -A := sorry
  end

--2. Fill in the ``sorry``.


  section
  open set
    variable {U : Type}

    /- defining "disjoint" -/

    def disj (A B : set U) : Prop := ∀ ⦃x⦄, x ∈ A → x ∈ B → false

    example (A B : set U) (h : ∀ x, ¬ (x ∈ A ∧ x ∈ B)) : 
      disj A B :=
      assume x,
      assume h1 : x ∈ A,
      assume h2 : x ∈ B,
      have h3 : x ∈ A ∧ x ∈ B, from and.intro h1 h2,
      show false, from h x h3

    -- Notice that we do not have to mention x when applying 
    --   h : disj A B
    example (A B : set U) (h1 : disj A B) (x : U) (h2 : x ∈ A) 
      (h3 : x ∈ B) : false := h1 h2 h3

    -- The same is true of ⊆
    example (A B : set U) (x : U) (h : A ⊆ B) (h1 : x ∈ A) : x ∈ B := h h1

    example (A B C D : set U) (h1 : disj A B) (h2 : C ⊆ A) 
        (h3 : D ⊆ B) : disj C D := sorry
  end


--3. Prove the following facts about indexed unions and intersections, 
--   using the theorems ``Inter.intro``, ``Inter.elim``, ``Union.intro``, 
--   and ``Union.elim`` listed above. 

  section
  open set
    variables {I U : Type}
    variables {A B : I → set U}

    theorem Inter.intro {x : U} (h : ∀ i, x ∈ A i) : x ∈ ⋂ i, A i :=
    by simp; assumption

    @[elab_simple]
    theorem Inter.elim {x : U} (h : x ∈ ⋂ i, A i) (i : I) : x ∈ A i :=
    by simp at h; apply h

    theorem Union.intro {x : U} (i : I) (h : x ∈ A i) : x ∈ ⋃ i, A i :=
    by {simp, existsi i, exact h}

    theorem Union.elim {b : Prop} {x : U}
    (h₁ : x ∈ ⋃ i, A i) (h₂ : ∀ (i : I), x ∈ A i → b) : b :=
    by {simp at h₁, cases h₁ with i h, exact h₂ i h}

  end

section
  open set
  variables {I U : Type}
  variables (A : I → set U) (B : I → set U) (C : set U)

  example : (⋂ i, A i) ∩ (⋂ i, B i) ⊆ (⋂ i, A i ∩ B i) := sorry

  example : C ∩ (⋃i, A i) ⊆ ⋃i, C ∩ A i := sorry
end

--4. Prove the following fact about power sets. 
--   You can use the theorems ``subset.trans`` and ``subset.refl``.

section
  open set
  variable  {U : Type}
  variables A B C : set U

  -- For this exercise these two facts are useful.
  example (h1 : A ⊆ B) (h2 : B ⊆ C) : A ⊆ C := subset.trans h1 h2

  example : A ⊆ A := subset.refl A

  example (h : A ⊆ B) : powerset A ⊆ powerset B := sorry

  example (h : powerset A ⊆ powerset B) : A ⊆ B := sorry
end
