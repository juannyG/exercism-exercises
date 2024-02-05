type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna dnaList =
  let reMap d =
  match d with
  | `G -> `C
  | `C -> `G
  | `T -> `A
  | `A -> `U
  in
  List.map reMap dnaList
