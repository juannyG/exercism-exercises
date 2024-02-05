let reverse_string s =
  let rec rev new_s i =
    if i < 0 then new_s
    else rev (new_s ^ String.make 1 s.[i]) (i - 1)
  in rev "" (String.length s - 1)
