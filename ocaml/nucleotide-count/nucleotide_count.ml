open Base

let empty = Map.empty (module Char)

let c_valid c =
  match c with
    | 'A' -> true
    | 'C' -> true
    | 'G' -> true
    | 'T' -> true
    | _ -> false

let count_nucleotide s c =
  if not (c_valid c) then Result.Error c
  else
    let rec count s_list accum =
      match s_list with
      | [] -> Result.Ok accum
      | hd :: tl ->
        if not (c_valid hd) then Result.Error hd
        else if (Char.equal hd c) then count tl (accum + 1)
        else count tl accum
    in count (String.to_list s) 0

let count_nucleotides s =
  let rec count s_list m =
    match s_list with
    | [] -> Result.Ok m
    | hd :: tl ->
      if not (c_valid hd) then Result.Error hd
      else if Map.mem m hd then count tl m
      else
        let x res = match res with
          | Result.Ok num -> count tl (Map.set ~key:hd ~data:num m)
          | Result.Error c -> Result.Error c (* If we match an error, return it - this happens when invalid char encountered in the middle of nucleotide  *)
        in x (count_nucleotide s hd)
  in count (String.to_list s) empty
