 parse_time←{
     ⍝ convert a timestamp for attendees to a UNIX timestamp  
     ⍝ ⍵: timestamp as string

     ⍝ exit for registered non-attendees
     ⍵≡⊂'--':⊃⍵

     regex←'(\d+)/(\d+)/(\d+) (\d+):(\d+)'
     groups←'\3 \1 \2 \4 \5 0'

     20 ⎕DT⍎¨ regex ⎕S groups ⊢⊃⍵
 }

  attended_seconds←{
     ⍝ calculate the number of seconds an atendee was in a session
     ⍝ this works generally for different time representations, but floating point errors
     ⍝ may be introduced if not picking an integer representation
     ⍝ ⍵: numeric vector (session start, session end)
     ⍝ ⍺: numeric vector (attendee join, attendee leave)

     ⍺≡'----':0

     start←1⌷⍵
     end←2⌷⍵
     join←1⌷⍺
     leave←2⌷⍺

     ⍝ cases of no intersection
     ⍝                |-----------session-----------|
     ⍝ |--attendance--|                             |--attendance--|

     leave≤start:0
     join≥end:0

     ⍝ case of full intersection
     ⍝                |-----------session-----------|
     ⍝       |-------------------attendance-------------------|
     (join≤start)∧(leave≥end):end-start

     ⍝ schedule fully contains attendance
     ⍝                |-----------session-----------|
     ⍝                       |--attendance--|
     (start≤join)∧(leave≤end):(leave-join)

     ⍝ join early, leave early
     ⍝                |-----------session-----------|
     ⍝          |--attendance--|
     (join≤start)∧(leave≤end):(leave-start)

     ⍝ join late, leave late
     ⍝                |-----------session-----------|
     ⍝                                        |--attendance--|
     (join≥start)∧(leave≥end):(end-join)
 }

  Attended←{
     attendees←⍺
     schedule←⍵
     
     ⍝ sort attendees alphabetically and append timestamp columns
     attendees_alpha←attendees[⍋attendees[;1];]
     attendees_alpha_ts←attendees_alpha,,/(parse_time⊂)¨attendees_alpha[;2 3]

     ⍝ add timestamps to schedule
     schedule_ts←schedule,,/(parse_time⊂)¨schedule[;3 4]


     ⍝ group by name
     grouped←attendees_alpha_ts[;1]{⍺ ⍵}⌸attendees_alpha_ts[;5]

     ⍝ here we have to sum together the time attended for each session
     ⍝ this is to account for the case of multiple joins/leaves:
     ⍝            |----------------session----------------|
     ⍝              |--attendance--|     |--attendance--|
     map←↑{(grouped[⍵;2]){0.5≤(+/⍺ attended_seconds¨(⊂⍵))÷(--/⍵)}¨schedule_ts[;5]}¨(⍳⊃⍴grouped)

     map
 }

⍝ Task 1

attendees←⊃⎕CSV 'data/Attendees.csv' '' ⍬ 1
schedule ←⊃⎕CSV 'data/Schedule.csv'  '' ⍬ 1

map←attendees Attended schedule

(⎕JSON ⊃⎕NGET 'data/sessionTotals.json' )≡+⌿map
(⎕JSON ⊃⎕NGET 'data/attendeeTotals.json')≡+/map
