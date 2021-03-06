⍝ This code generates a standard calendar (listed Sunday through Saturday with six rows)
⍝ Zeroes are placed where a calendar would have blank spots
⍝ After this, I add together a stack of dates and find the maximum sum/index
⍝ Also see: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Disparate_variation

c←6 7                                                                   ⍝ dimensions of a calendar
d←(10⍴5⍴31 30),(31 28)                                                  ⍝ days per month starting with March 
z←{Y←⍵-⍺>10⋄y←100|Y⋄c←(Y-y)÷100⋄7|1+⌊((2.6×⍺)-0.2)+y+⌊(y÷4)+⌊(c÷4)-2×c} ⍝ get padding at begining of month: month z year
m←{c⍴(⍺⍴0),(⍳⍵),(((×/c)-⍺+⍵)⍴0)}                                          ⍝ create a single month with: padding m n_days
r←{(⍺ z ⍵) m (⍺⌷d)+((0≠100|⍵)∨(0=400|⍵))∧(0=4|⍵)∧(⍺=12)}                ⍝ create a month with: month r year
y←{((11 12),⍳10)r¨⍵}                                                    ⍝ create an entire year

⍝ Example:
⎕←t←y 1799 ⍝ 1799 monthly calendar
⎕←s←⊃+/t   ⍝ add together the stack of dates
⎕←p←⌈/,s   ⍝ this is the max value of stacked dates
⎕←i←⍸p=s   ⍝ here is the index of max value
