⍝ Find the indicies for a single run
⍝ ⍺: length of result
⍝ ⍵: numeric vector of length 2 with start index/length

 r_idx←{
     f←¯1+(1⌷⍵)+⍳2⌷⍵ ⍝ create the full run
     (⍺≥f)/f         ⍝ filter out indicies exceeding length
 }

 runs←{
     f←⍺ r_idx¨↓⍵       ⍝ find all indicies to fill
     ∨⌿↑⍺{(1@⍵)(⍺/0)}¨f ⍝ build a matrix and reduce cols with ∨
 }
