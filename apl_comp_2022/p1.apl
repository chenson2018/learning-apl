⍝ Question 1
q1←{+⌿(⊃⍴,⍵)4⍴⍵∘.='ACGT'}

⍝ Question 2
q2←{+/⍺≠⍵}

⍝ Question 3

⍝ Question 4
q4←{0=+/⍵:0⋄⌈/+/↑⊆⍨,⍵}

⍝ Question 5
q5←{⌽↑(⍳⍵){'⎕'@(⍳⍺)⊢⍵⍴' '}¨⍵}

⍝ Question 6
q6←{n←0⌈¯1+2×⍵⋄m←(⍳n)⌊⌽⍳n⋄m∘.⌊m}

⍝ Question 7
q7←{⊃,/{↓(⍴⍵)⍴((+/⍵)÷⍴⍵)}⌸,⍵}

⍝ Question 8
q8←{a←,⍺⋄w←,⍵⋄n←⊃¯1+w⍳a[⍋w⍳a]⋄((n↑w)(n↓w))}

⍝ Question 9
q9←{p←(⍺⍴1⌷,⍵),⍵,(⍺⍴1⌷⌽,⍵)⋄n←(1+⍺×2)⋄(n{(+/⍺,⍵)}/p)÷n}

⍝ Question 10
q10←{s←⍺⋄⌽⊃{⍺,s,⍵}/((⍴,⍵)⍴3/⍳⍴,⍵)⊆(⌽,⍵)}

