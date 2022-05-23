⍝ Task 1

 encode_85←{
     encoding←⍺
     bytes←⍵

     ⍝ append 0 byte until multiple of 4
     pad←4{⍵,(⍺|(⍺-⍴⍵))⍴0}bytes

     ⍝ convert each byte to 8 bit binary
     binary←(8⍴2)⊤pad

     ⍝ group as 32 bits
     bit_32←↓(((⊃⍴pad)÷4)32)⍴⍉binary

     ⍝ convert to base 85
     base_85←{(5⍴85)⊤(32⍴2)⊥⍵}¨bit_32

     ⍝ pass as index to encoding
     encoded_full←encoding[⊃1+,/base_85]

     ⍝ truncate padding
     ((⍴encoded_full)-((⍴pad)-⍴bytes))⍴encoded_full
 }


 decode_85←{
     encoding←⍺
     chars←⍵[⍸⍵∊⍺]

     ⍝ append last char in encoding until multiple of 5
     pad←5{⍵,(⍺|(⍺-⍴⍵))⍴(⊃⌽encoding)}chars

     ⍝ find indices in encoding
     idx←¯1+encoding⍳pad

     ⍝ group as base 85
     base_85←↓(((⊃⍴pad)÷5)5)⍴idx

     ⍝ convert to 32 bit value
     bit_32←{(5⍴85)⊥⍵}¨base_85

     ⍝ convert to 8 bit
     binary←↓((4×(⊃⍴bit_32))8)⍴⊃,/{(32⍴2)⊤⍵}¨bit_32

     ascii_idx←{(8⍴2)⊥⍵}¨binary

     ((⍴ascii_idx)-((⍴pad)-⍴chars))⍴ascii_idx
 }



 Base85←{
    ⍝ encode or decode based on the input data type
    ⍝ I am new to APL, so not sure if this is the most robust test
    is_chars←(⎕DR ⍵)∊(80 82 160 320)

    is_chars:⍺ decode_85 ⍵
   ~is_chars:⍺ encode_85 ⍵
 }



Original←⎕UCS 32+⍳85
Z85←'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-:+=^!/*?&<>()[]{}@%$#'

Original Base85 ⎕UCS 'Hello World'
Z85 Base85 ⎕UCS 'Hello World'
Original Base85 0 0 0 0 0 0
Original Base85 8⍴'!'
'Hello World'≡⎕UCS Z85 Base85 Z85 Base85 ⎕UCS 'Hello World'
Z85 (Base85⍣2 ≡ ⊢) ⎕UCS 'Hello'
⎕UCS Original Base85 '7!W 3WD ⍴ eC1 ⌈ Y:eU'
