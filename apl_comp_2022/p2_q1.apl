⍝ Task 1

 r_idx←{
     ⍝ Find the indicies for a single run
     ⍝ ⍺: length of result
     ⍝ ⍵: numeric vector of length 2 with start index/length
     
     f←¯1+(1⌷⍵)+⍳2⌷⍵ ⍝ create the full run
     (⍺≥f)/f         ⍝ filter out indicies exceeding length
 }

 runs←{
     f←⍺ r_idx¨↓⍵       ⍝ find all indicies to fill
     ∨⌿↑⍺{(1@⍵)(⍺/0)}¨f ⍝ build a matrix and reduce cols with ∨
 }

 ⍝ Task 3

  subspaces←{
     ⍝ maximum value of subspaces
     mat←⍵
     m←⌈/,⍵

     ⍝ get indicies for the subspaces
     indicies←{⍸mat=⍵}¨⍳m

     ⍝ find top left and bottom right
     starts←(⌊/)¨indicies
     ends←(⌈/)¨indicies

     ↑↑starts{,/⍺,(⍴⍵)⍴1+⍵-⍺}¨ends
 }

subspaces 0 2 2 0 1 1 1 1 0 3

⊢space←↑(⊢⍴⍨⊢,⊢)¨3 2 1
subspaces space

⍴subspaces 5 4 3 2⍴0

⊢space←((3 3⍴5),(2 2⍴2)⍪1)⍪(2 2⍴4),2 3⍴3
subspaces space
