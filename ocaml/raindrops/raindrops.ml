let pling n =
  if n mod 3 = 0 then "Pling" else ""

let plang n =
  if n mod 5 = 0 then "Plang" else ""

let plong n =
  if n mod 7 = 0 then "Plong" else ""

let raindrop n =
  let s = String.concat "" [pling n; plang n; plong n] in
  if s = "" then string_of_int n else s
