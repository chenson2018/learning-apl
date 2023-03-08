⍝ Dirty Task 1

l←4 9⍴⊃,/(((⊂'R-')@18) ('-'@(⍸(⎕A∊'IOQ'))) ((⊃⍕)¨⎕A,⍳9))

w17←(⌽1+⍳7),10 0,⌽1+⍳8
w16←(⌽1+⍳7),10,⌽1+⍳8

split17←((8⍴1),0,(8⍴1))
split16←(8⍴1),(1+8⍴1)

check_from_num←{⍵<10:⊃⍕⍵⋄'X'}
sixteen_to_check←{check_from_num 11|+/w16×score¨⍵}
score←{⊃⌽⊃⍸⍵⍷l}

vin←{~∧/⍵∊{'0',⍵/⍨~⍵∊'IOQ-'},l:¯1⋄16=≢⍵:⊃,/⌽1⌽(split16⊆⍵),sixteen_to_check ⍵⋄17=≢⍵:(9⊃⍵)=sixteen_to_check ⊃,/split17⊆⍵⋄¯1}


