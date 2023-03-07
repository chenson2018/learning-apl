⍝ Task 1
rna←('U'@{'T'=⍵})

⍝ Task 2
revc←{⍵≡'':⍵⋄a←'ACGT'⋄b←'TGCA'⋄ ⌽{⍵⊃b}¨a⍸⍵}


