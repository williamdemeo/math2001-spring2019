-- Math 2001 Teamwork 4 (Optional)

-- You may submit individual solutions to this assignment for extra credit.

-- You may work on a team, but you must submit your own tw4-lastname.lean file if you want it to be graded and counted.

-- Due Date: Fri 3 May 2019

-- Below you will be asked to prove some facts about natural numbers from Sections 17.4 and 17.5.

-- First, here are some examples. (You can use these theorems in your own proofs).

open nat

variables m n : ℕ
example : m + 0 = m := add_zero m
example : m + succ n = succ (m + n) := add_succ m n

-- Similarly, we have the defining equations for the predecessor function and multiplication:
#check @pred_zero
#check @pred_succ
#check @mul_zero
#check @mul_succ

-- Here are five propositions proved in 17.4:
namespace hidden

  theorem succ_pred (n : ℕ) : n ≠ 0 → succ (pred n) = n :=
  nat.rec_on n
    (assume H : 0 ≠ 0,
      show succ (pred 0) = 0, from absurd rfl H)
    (assume n,
      assume ih,
      assume H : succ n ≠ 0,
      show succ (pred (succ n)) = succ n, 
        by rewrite pred_succ)

  theorem zero_add (n : nat) : 0 + n = n :=
  nat.rec_on n
    (show 0 + 0 = 0, from rfl)
    (assume n,
      assume ih : 0 + n = n,
      show 0 + succ n = succ n, from calc
        0 + succ n = succ (0 + n) : rfl
               ... = succ n : by rw ih)

  theorem succ_add (m n : nat) : succ m + n = succ (m + n) :=
  nat.rec_on n
    (show succ m + 0 = succ (m + 0), from rfl)
    (assume n,
      assume ih : succ m + n = succ (m + n),
      show succ m + succ n = succ (m + succ n), from calc
        succ m + succ n = succ (succ m + n) : rfl
                    ... = succ (succ (m + n)) : by rw ih
                    ... = succ (m + succ n) : rfl)

  theorem add_assoc (m n k : nat) : m + n + k = m + (n + k) :=
  nat.rec_on k
    (show m + n + 0 = m + (n + 0), by rw [add_zero, add_zero])
    (assume k, 
      assume ih : m + n + k = m + (n + k),
      show m + n + succ k = m + (n + (succ k)), from calc
        m + n + succ k = succ (m + n + k)   : by rw add_succ
                   ... = succ (m + (n + k)) : by rw ih
                   ... = m + (n + succ k)   : by rw add_succ)

  theorem add_comm (m n : nat) : m + n = n + m :=
  nat.rec_on n
    (show m + 0 = 0 + m, by rewrite [add_zero, zero_add])
    (assume n,
      assume ih : m + n = n + m,
      show m + succ n = succ n + m, from calc
        m + succ n = succ (m + n) : by rw add_succ
               ... = succ (n + m) : by rw ih
               ... = succ n + m   : by rw succ_add)



  --EXERCISES--

  --1. Prove the following identities from 17.4 by replacing each `sorry` with a proof.

  --1.a.
  theorem mul_distr : ∀ m n k : nat, m * (n + k) = m * n + m * k := sorry

  --1.b.
  example : ∀ n : nat, 0 * n = 0 := sorry

  --1.c.
  example : ∀ n : nat, 1 * n = n := sorry

  --1.d.
  example : ∀ m n k : nat, (m * n) * k = m * (n * k) := sorry

  --1.e.
  example : ∀ m n : nat, m * n= n * m := sorry



  --2. Prove the remaining identities from 17.5 by replacing each `sorry` with a proof.
open nat
  --2.a.
  example : ∀ m n k : nat, n ≤ m → n + k ≤ m + k := sorry

  --2.b.
  example : ∀ m n k : nat, n + k ≤ m + k → n ≤ m := sorry

  --2.c.
  example : ∀ m n k : nat, n ≤ m → n * k ≤ m * k := sorry

  --2.d.
  example : ∀ m n k : nat, m ≥ n → m = n ∨ m ≥ n+1 := sorry

  --2.e.
  example : ∀ n : nat, 0 ≤ n := sorry


end hidden

