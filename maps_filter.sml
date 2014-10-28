fun map(f, x) =
  case x of
       [] => []
     | a::b => f(a)::map(f,b)

val x1 = map(fn x => x + 1, [2,3,4,5])


fun filter(f, x) =
  case x of
       [] => []
     | a::b => if f a
               then a::filter(f, b)
               else filter(f, b)

val x2 = filter(fn x => (x mod 2 = 0), [2,3,4,5,6,7,8])
