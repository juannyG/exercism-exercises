type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let earth =
  1.  /. 60. /. 60. /. 24. /. 365.

let relative_to_earth p =
  match p with
  | Mercury -> 0.2408467
  | Venus -> 0.61519726
  | Earth -> 1.0
  | Mars -> 1.8808158
  | Jupiter ->11.862615
  | Saturn -> 29.447498
  | Neptune -> 164.79132
  | Uranus -> 84.016846

let age_on p s =
  (float_of_int s) *. earth /. (relative_to_earth p)
