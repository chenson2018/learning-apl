⍝ Question 1
q1←{+⌿(⊃⍴,⍵)4⍴⍵∘.='ACGT'}

⍝ Question 2
q2←{+/⍺≠⍵}

⍝ Question 3

⍝ Question 4

⍝ Question 5
q5←{⌽↑(⍳⍵){'⎕'@(⍳⍺)⊢⍵⍴' '}¨⍵}

⍝ Question 6
q6←{n←0⌈¯1+2×⍵⋄m←(⍳n)⌊⌽⍳n⋄m∘.⌊m}

⍝ Question 7
q7←{1=≢⍵:,1⋄⊃,/{↓(⍴⍵)⍴((+/⍵)÷⍴⍵)}⌸⍵}

⍝ Question 8
q8←{a←,⍺⋄w←,⍵⋄n←⊃¯1+w⍳a[⍋w⍳a]⋄((n↑w)(n↓w))}

⍝ Question 9

⍝ Question 10

