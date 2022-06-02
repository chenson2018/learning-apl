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


⍝ Task 2

 fill←{
     mat←⍺⍴0
     n_dims←1⌈⊃⍴⍺
     dims←⍺

     starts←↓⍵[;⍳n_dims]
     sizes←↓⍵[;n_dims+⍳n_dims]

     idx_range←{
         ranges←⍺{(⍺-1)+⍳⍵}¨⍵
         ,⊃(∘.,)/ranges
     }

     ⍝ all indicies regardless of exceeding shape
     fills←starts idx_range¨sizes

     ⍝ filter by shape
     mask←{{0=+/⍵>dims}¨⍵}¨fills
     fills←mask/¨fills

     ⍝ fill shape template and combine
     ⊃⌈/(⍳⊃⍴⍵){(⍺@⍵)mat}¨fills
 }

10 fill 1 2⍴3 4
15 fill 2 2⍴3 6 5 7

⊢spaces←5 4⍴∊2/¨(⍳5),¨(⌽¯1+2×⍳5)
9 9 fill spaces

4 4 4 fill 3 6⍴6/1 2 3

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
