fun fold(f,acc,xs) =
  case xs of 
       [] => acc
     | a::b => fold(f, f(a,acc), b)
