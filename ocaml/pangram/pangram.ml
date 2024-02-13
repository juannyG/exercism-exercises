let is_pangram s =
  let lowered = String.lowercase_ascii s in
  let c_list = List.init (String.length lowered) (String.get lowered) in
  let rec f c' acc =
    match c' with
    | [] -> acc
    | c :: t ->
      match c with
      | 'a'..'z' -> match List.find_opt (fun v -> v = c) acc with
        | Some _ -> f t acc
        | None -> f t (c :: acc)
      | _ -> f t acc
  in List.length (f c_list []) = 26
