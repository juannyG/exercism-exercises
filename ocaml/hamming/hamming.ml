open List

type nucleotide = A | C | G | T

(*
let nucleotide_to_string n =
  if n == A then "A"
  else if n == C then "C"
  else if n == G then "G"
  else "T"
*)

let rec _verified_hamming d1 d2 accum =
  match d1 with
  | [] -> accum
  | d1 ->

  let d1_h = hd d1 in
  let d2_h = hd d2 in
  (* Printf.printf "%s =? %s\n" (nucleotide_to_string d1_h) (nucleotide_to_string d2_h); *)
  if d1_h != d2_h
  then _verified_hamming (tl d1) (tl d2) (accum + 1)
  else _verified_hamming (tl d1) (tl d2) (accum)

let hamming_distance dna1 dna2 =
  let dna1_len = length dna1 in
  let dna2_len = length dna2 in
  (* Printf.printf "\n"; *)
  if dna1_len = dna2_len
  then Result.Ok (_verified_hamming dna1 dna2 0)
  else if dna1_len = 0
  then Result.Error "left strand must not be empty"
  else if dna2_len = 0
  then Result.Error "right strand must not be empty"
  else Result.Error "left and right strands must be of equal length"
