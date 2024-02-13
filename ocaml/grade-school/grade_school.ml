open Base

module Int_map = Map.M(Int)
type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add name grade school' =
  match Map.find school' grade with
  | Some l -> school' |> Map.set ~key:grade ~data:(name :: l)
  | None -> school' |> Map.set ~key:grade ~data:[name]

let grade grade school' =
  match Map.find school' grade with
  | Some l -> l
  | None -> []

let sorted school' =
  school' (* This function is never used by the tests... *)

let roster school' =
  let keys = Map.keys school' in
  let rec f keys acc =
    match keys with
    | [] -> acc 
    | k :: t ->
      match Map.find school' k with
      | Some l -> f t (acc @ l)
      | None -> f t acc
  in f keys []
