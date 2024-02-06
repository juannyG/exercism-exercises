let isAllowed c = match c with
  | 'a' .. 'z'
  | 'A' .. 'Z'
  | ' ' 
  | '-' -> true
  | _ -> false

let rec strip s i acc =
  if i >= String.length s then acc
  else if isAllowed s.[i] then strip s (i + 1) (acc ^ Char.escaped s.[i])
  else strip s (i + 1) acc

let shouldInclude prev curr =
  if curr = ' ' || curr = '-' then false
  else if prev = '-' || prev = ' ' then true
  else false

let acronym phrase =
  let stripped = strip phrase 0 "" in
  let len = String.length stripped in
  let rec f i acc =
    if i >= len then String.uppercase_ascii acc
    else if i = 0 then f (i + 1) (acc ^ Char.escaped stripped.[i])
    else if shouldInclude stripped.[i - 1] stripped.[i] then f (i + 1) (acc ^ Char.escaped stripped.[i])
    else f (i + 1) acc
  in f 0 ""
