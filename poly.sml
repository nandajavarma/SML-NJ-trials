fun n_times(f, n, x) =
  if n = 0
  then x
  else
    f (n_times(f, n-1,x))

fun increment x = x + 1
fun double x = x * 2

fun times_until_zero (f,x) =
    if x = 0 then 0 else 1 + times_until_zero(f,f x)

fun thrice_n_times (n, x) =
  n_times(fn x => x * 3, n, x)
