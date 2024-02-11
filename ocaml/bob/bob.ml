let all_caps l =
  let only_chars = List.filter_map (
      fun c -> match c with
        | 'A'..'Z'
        | 'a'..'z'-> Some c
        | _ -> None
    ) l in

  if List.length only_chars = 0 then false
  else
    List.equal (fun ai bi -> ai = bi) (
      List.filter_map (fun c ->
          match c with
          | 'a'..'z' -> None
          | _ -> Some c
        ) only_chars
    ) only_chars


let analyze l =
  let is_q = List.nth l (List.length l - 1) = '?' in
  if all_caps l then
    if is_q then "Calm down, I know what I'm doing!"
    else "Whoa, chill out!"
  else if is_q then "Sure." else "Whatever."


let response_for s =
  let s_list = List.init (String.length s) (String.get s) in
  let filtered_s_list = List.filter_map (
      fun c ->
        match c with
        | 'A'..'Z'
        | 'a'..'z'
        | '0'..'9'
        | '?' -> Some c
        | _ -> None
    ) s_list in
  if List.length filtered_s_list = 0 then "Fine. Be that way!"
  else analyze filtered_s_list
