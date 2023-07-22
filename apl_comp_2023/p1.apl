⍝ Question 1
q1←{⍵/⍨⍵≥⌈\⍵}

⍝ Question 2
q2←(⌽(⍷⍥⌽))

⍝ Question 3
q3←{⍵≡'':⍵⋄⍺{⍵⊃⍺⌽l}¨⍵⍸⍨l←' ',⎕A}

⍝ Question 4
q4←{r←⊃⊃,/⍺(>((⍸,)¨)<)⍵⋄2=r:¯1⋄r}

⍝ Question 5
q5←{r←⍺(⌊⍥≢)⍵⋄a←+/(r↑⍺)≤(r↑⍵)⋄a,(r-a)}

⍝ Question 6
q6←{↑(⊃⌽⍺){⍵⊆⍨⍵≠⍺}¨⍵⊆⍨⍵≠⊃⍺}

⍝ Question 7
q7←{↑⍵ 1÷⊂1∨⍵}

⍝ Question 8
q8←{b c←{1⎕DT⊂⍵}¨⍺ ⍵⋄3↑⊃¯1⎕DT b+s⌷⍨⊃⍋s←i×⌈(c-b)÷i←644 759 924}

⍝ Question 9
q9←{d←≢⍴⍵ ⋄ (⍴⍵)⍴∊{⊃,/⌽¨((≢⍵)⍴1 0)⊂⍵}¨⊂[d]⍵}

⍝ Question 10
q10←
