let transform start =
  let rec f l acc =
    match l with
    | [] -> acc
    | hd :: tl ->
      let n = fst hd in
      let clist = snd hd in
      let rec f' l' acc' =
        match l' with
        | [] -> acc'
        | h :: t ->
          f' t (((Char.lowercase_ascii h), n) :: acc')
      in f tl (f' clist acc) (* recurse on the tl and the result of the f' recursions! *)
  in List.sort (fun (k1, _) (k2, _) -> compare k1 k2) (f start [])
