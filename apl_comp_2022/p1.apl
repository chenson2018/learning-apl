⍝ Question 1
q1←{+⌿(⊃⍴,⍵)4⍴⍵∘.='ACGT'}

q1 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
q1 ''
q1 'G'

⍝ Question 2
q2←{+/⍺≠⍵}

'GAGCCTACTAACGGGAT' q2 'CATCGTAATGACGGCCT'
'A' q2 'T'
'' q2 ''
q2⍨'CATCGTAATGACGGCCT'

⍝ Question 3

⍝ Question 4

⍝ Question 5
q5←{⌽↑(⍳⍵){'⎕'@(⍳⍺)⊢⍵⍴' '}¨⍵}
q5 10
q5 0

⍝ Question 6

q6←{n←0⌈¯1+2×⍵⋄m←(⍳n)⌊⌽⍳n⋄m∘.⌊m}

q6 3
q6 5
q6 1
q6 0

⍝ Question 7

⍝ Question 8

⍝ Question 9

⍝ Question 10

