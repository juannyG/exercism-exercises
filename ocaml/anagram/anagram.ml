let anagrams target candidates =
  let rec f l acc =
    match l with
    | [] -> acc
    | hd :: tl ->
      let lower_t = String.lowercase_ascii target in
      if String.lowercase_ascii hd = lower_t then f tl acc
      else
        let is_anag w =
          let s_as_char_l s = List.init (String.length s) (String.get s) in
          List.equal (fun ai bi -> ai = bi) (List.sort compare (s_as_char_l w)) (List.sort compare (s_as_char_l lower_t))
        in
        if is_anag (String.lowercase_ascii hd) then f tl (hd :: acc)
        else f tl acc
  in List.rev (f candidates [])
