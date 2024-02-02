let square_of_sum x =
  let rec sum a =
    if a = 0 then a
    else
      a + sum (a - 1)
  in (sum x) * (sum x)

let sum_of_squares x =
  let rec sq_sum a =
    if a = 0 then a
    else
      (a * a) + sq_sum (a - 1)
  in sq_sum x

let difference_of_squares x =
    square_of_sum x - sum_of_squares x
