⍝ See https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Disparate_variation

c←6 7                                                                                   ⍝ dimensions of a calendar
d←(10⍴5⍴31 30),(31 28)                                                                  ⍝ days/months starting with March 
z←{Y←(2⊃⍵)-(1⊃⍵)>10⋄y←100|Y⋄c←(Y-100|Y)÷100⋄7|1+⌊((2.6×(1⊃⍵))-0.2)+y+⌊(y÷4)+⌊(c÷4)-2×c} ⍝ get padding at begining of month 
m←{c⍴((1⊃⍵)⍴0),(⍳2⊃⍵),(((×/c)-+/⍵)⍴0)}                                                  ⍝ create a single month from (padding, n_days)
r←{m (z ⍵) ((1⊃⍵)⌷d)}                                                                   ⍝ create a month from (month year)
y←{r¨((11 12),⍳10),¨⍵}                                                                  ⍝ create an entire year

⍝ Example:
⎕←t←y 1799    ⍝ 1799 monthly calendar
⎕←s←+/t       ⍝ add together the stack of dates
⎕←p←⌈/,⊃+/t   ⍝ this is the max value of stacked dates
⎕←i←⍸p=(⊃+/t) ⍝ here is the index of max value
