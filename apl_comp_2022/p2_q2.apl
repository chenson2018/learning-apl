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


