⍝ Task 1


⍝ Very basic helper function see source at links below
⍝ https://software.codidact.com/posts/278547
⍝ https://dfns.dyalog.com/c_pmat.htm

 pmat←{⎕ML←1            ⍝ Permutation matrix of ⍳⍵.
    {                   ⍝ perms of ⍳⍵:
        1≥⍴⍵:↑,↓⍵       ⍝ short vector: done.
        ↑⍪/⍵,∘∇¨⍵∘~¨⍵   ⍝ items prefix sub-perms of remainder.
    }⍳⍵                 ⍝ permutations of identity perm.
 }

 permute←{⍵[pmat⊃⍴⍵]} 

 Ballot←{
     n_candidates←|⍺

     ⍝ check if we should require a full ballot
     idx←{
         ⍵=|⍵:n_candidates
         ⍵≠|⍵:⍳n_candidates
     }

     ⍝ generate all possible orderings
     opt←∪⊃⍪/(permute¨↓↑⍳¨⍳n_candidates)[idx ⍺]

     ⍝ select ⍺ of these at random
     votes←opt[?(⍵⍴⊃⍴opt);]

     ⍝ group by
     g←⌽{(⍺)(⍴⍵)}⌸votes
     (⍉(1(⊃⍴g))⍴⊃,/g[;1]),g[;2]
 }

⎕←b←3 Ballot 150 ⍝ generate 150 voter rankings for 3 candidates
⎕←b2←¯3 Ballot 150
1 Ballot 150
