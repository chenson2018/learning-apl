⍝ Task 1
⍝ Using https://dfns.dyalog.com/c_foldl.htm
foldl←{⎕ML←1⋄↑⍺⍺⍨/(⌽⍵),⊂⍺}
reshape←{dims←|⍺⋄base←dims⍴⍵⋄rev←⍸,⍺<0⋄base {⌽[⍵]⍺} foldl ,rev}

10 reshape ⍳4
¯4 4 reshape ⎕A
¯4 ¯4 reshape ⎕A
2 ¯2 ¯3 4 reshape ⍳48
2 ¯2 reshape'Adam' 'Brian' 'Michael' 'Morten'
⍬ reshape 5 3 1

⍝ Task 2

 reshape2←{
     ⍝ split into regular dims and special
     int_sep←{mask←⍵=⌊⍵ ⋄ ((⍵[⍸mask])(⍵[⍸~mask]))}
     sep←int_sep,⍺

     ints←⊃sep
     type←⊃⊃⌽sep

     ⍝ exit early if no special
     0=type:⍺ reshape ⍵

     ⍝ otherwise, we need to find the missing dimension length

     ⍝ total elements we have to reshape
     n←×/⍴⍵

     ⍝ partial product of reshape dims
     part_dim←|×/ints

     ⍝ find the (absolute value) of the missing dimension

     type_calc←{
         0.5=|type:⌊⍵÷⍺
         +/(1.5 2.5)=|type:⌈⍵÷⍺
     }

     ⍝ this is the missing dimension to replace the type
     missing←(×type)×part_dim type_calc n

     ⍝ our full set of dims
     full_dim←(missing@(,⍸⍺≠⌊⍺))⍺

     ⍝ if type (-2.5) we want to append to the data a bit
     data←type{2.5≠|type:⍵ ⋄ (,⍵),(((×/|full_dim)-n)⍴(⊃0⍴⍵))}⍵

     full_dim reshape data
 }

0.5 4 reshape2 ⍳10
4 0.5 reshape2 ⍳10
1.5 4 reshape2 ⍳10
2.5 4 reshape2 ⍳10
¯4 ¯2.5 reshape2 13↑⎕A
¯3 ¯2.5 reshape2 'brian' 'adam' 'morten' 'michael'
⍴⎕←⍬ reshape2 'brian' 'adam' 'morten' 'micheal'
2.5 3 4 reshape2 ⍳21
2 2.5 3 4 reshape2 ⍳26
¯2 2.5 3 ¯4 reshape2 ⍳26

