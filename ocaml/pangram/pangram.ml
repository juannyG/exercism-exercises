let is_char c =
  match c with
  | 'a'..'z' -> true
  | _ -> false

let is_pangram s =
  let lowered = String.lowercase_ascii s in
  let c_list = List.init (String.length lowered) (String.get lowered) in
  let filtered_c_list = List.filter is_char c_list in
  let rec f c' acc =
    match c' with
    | [] -> acc
    | c :: t ->
      match List.find_opt (fun v -> v = c) acc with
      | Some _ -> f t acc
      | None -> f t (c :: acc)
  in List.length (f filtered_c_list []) = 26
