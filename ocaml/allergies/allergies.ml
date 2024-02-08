type allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats

let allergy = function
  | Eggs -> 1
  | Peanuts -> 2
  | Shellfish -> 4
  | Strawberries -> 8
  | Tomatoes -> 16
  | Chocolate -> 32
  | Pollen -> 64
  | Cats -> 128


let allergic_to n item =
  Int.logand (allergy item) n > 0

let allergies n =
  let f e =
    match allergic_to n e with
    | true -> Some e
    | false -> None
  in List.filter_map f [Eggs; Peanuts; Shellfish; Strawberries; Tomatoes; Chocolate; Pollen; Cats]
