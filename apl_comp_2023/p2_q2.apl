⍝ Task 1

⍝ weights, excluding center position (9)
w←w,10 9,w←⌽1+⍳7

⍝ a helper constant for splitting VINs
s←8⍴1

⍝ convert a number to a character or 'X'
check_from_num←{⍵<10:⊃⍕⍵⋄'X'}

⍝ score an individual letter
l←4 9⍴'ABCDEFGH-JKLMN-P-R-STUVWXYZ',(⊃⍕)¨⍳9
score←{⊃⌽⊃⍸⍵⍷l}

⍝ given six chars
check←{check_from_num 11|+/w×score¨⍵}

vin←{
    ⍝ check for invalid characters	
    ~∧/⍵∊{'0',⍵/⍨~⍵∊'IOQ-'},l:¯1

    ⍝ for 16 chars, calculate and add check 
    16=≢⍵:⊃,/⌽1⌽(⍵⊆⍨s,2×s),check ⍵

    ⍝ for 17 chars, verify check digit
    17=≢⍵:(9⊃⍵)=check ⊃,/(s,0,s)⊆⍵

    ⍝ return if invalid number of chars
    ¯1
}
