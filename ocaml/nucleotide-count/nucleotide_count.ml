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
  let t = Map.set ~key:'A' ~data:1 empty in
  Result.Ok t
