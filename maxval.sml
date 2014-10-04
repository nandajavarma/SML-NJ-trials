fun countdown(x: int, y: int) = 
  if x = y
    then y::[]
  else
    x:: count(x-1, y)

fun countup(x: int, y: int) =
  if x = y
    then y::[]
  else
    x:: count(x+1, y)

fun max_of_nums(x: int list) =
  if null x
    then 0
  else if null (tl x)
    hd x
  else
    let
      val tail_val = max_of_nums(tl x)
    in
      if (hd x) > tail_val
      then (hd x)
      else tail_val
    end



