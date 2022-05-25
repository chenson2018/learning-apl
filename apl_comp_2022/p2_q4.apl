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
     ⌽{⍺(⊃⍴⍵)}⌸votes
 }

⎕←b←3 Ballot 150 ⍝ generate 150 voter rankings for 3 candidates
⎕←b2←¯3 Ballot 150
1 Ballot 150

⍝ Task 2

min_nonzero←{{⍺=0:⍵⋄⍵=0:⍺⋄⍺⌊⍵}/⍵}

 tally←{
     ⍝ ⍵: ballot     
     ⍝ for each vector on the right, find the hightest
     ⍝ rank vote for a candidate that has not been eliminated
     highest_vote←min_nonzero¨⍵[;2]
     votes←(⍉↑highest_vote=⍵[;2])+.×(⍪⍵[;1])
     mat←(⍳⊃⍴votes),votes
     mat[⍸0≠mat[;2];]
 }

 iter←{
     ⍝ one iteration of IRV eliminate
     ⍝ ⍵: (ballot result (tally ballot result))

     table←⊃⍵
     places←⊃⌽⍵

     ⍝ find candidate with lowest votes (including ties)
     min←min_nonzero places[;2]
     elim←places[⍸min=places[;2];1]

     ⍝ rewrite the table and re-tally          
     new_table←↑table[;1]{(⍺ ⍵)}¨{(0@(elim))⍵}¨table[;2]
     (new_table(tally new_table))
 }

