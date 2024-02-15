type base = int

let are_digits_valid ~from ~digits =
  let rec f = function
    | [] -> true
    | h :: t ->
      if h >= 0 && h <= (from - 1) then (true && f t)
      else false
  in f digits

let num_to_list n base =
  let rec f i acc =
    match i > 0 with
    | false -> acc
    | true ->
      f (i / base) ((i mod base) :: acc)
  in f n []

let convert_to_dec ~from ~digits =
    let fl_from = float_of_int from in
    let rec f n l acc =
      match l with
      | [] -> acc
      | h :: t ->
        let x = int_of_float ((float_of_int h) *. (fl_from ** float_of_int n)) in
        f (n - 1) t (x + acc)
    in
    f (List.length digits - 1) digits 0

let convert_bases ~from ~digits ~target =
  if target < 2 || from < 2 then None
  else if not (are_digits_valid ~from:from ~digits:digits) then None
  else
    let as_dec = convert_to_dec ~from:from ~digits:digits in
    if as_dec = 0 then Some [0]
    else Some (num_to_list as_dec target)
