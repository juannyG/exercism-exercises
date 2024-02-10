open Base

type bst =
  | Empty
  | Node of int * bst * bst (* data * left * right *)

let empty = Empty

let value t =
  match t with
  | Empty -> Result.Error "not found"
  | Node (n, _, _) -> Result.Ok n

let left t =
  match t with
  | Empty -> Result.Error "not found"
  | Node (_, l, _) -> Result.Ok l

let right t =
  match t with
  | Empty -> Result.Error "not found"
  | Node (_, _, r) -> Result.Ok r

let insert n t =
  let rec f sub_t =
    match sub_t with
    | Empty -> Node (n, Empty, Empty)
    | Node (v, l, r) ->
      if n <= v then Node (v, f l, r)
      else Node (v, l, f r)
  in f t

let to_list t =
  let rec f sub_t acc =
    match sub_t with
    | Empty -> []
    | Node (v, l, r) ->
      (f l acc) @ [v] @ (f r acc)
  in f t []
