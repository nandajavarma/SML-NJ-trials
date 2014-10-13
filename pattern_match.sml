fun zip list_triple =
  case list_triple of
       ([],[],[]) => []
     | (h1::t1,h2::t2,h3::t3) => (h1,h2,h3)::zip(t1,t2,t3)
     | _ => []
     

fun unzip tuple_list =
  case tuple_list of
       [] => ([],[],[])
     | (a,b,c)::t => let val (l1,l2,l3) = unzip(t)
                      in
                         (a::l1,b::l2,c::l3)
                     end
                     
fun nondecreasing xs =
  case xs of
       [] => true
     | x::[] => true
     | head::(neck::rest) => if head >= neck andalso nondecreasing (neck::rest)
                             then true
                             else false


datatype sgn = P | N | Z

fun multisign (x1, x2) =
  let fun sign x = if x = 0 then Z else if x > 0 then P else N
  in
    case (sign x1, sign x2) of
         (_,Z) => Z
       | (Z, _) => Z
       | (P, P) => P
       | (N, N) => P
       | _ => N
  end


fun len xs =
  case xs of
       [] => 0
     | _::xs' => 1 + len xs'
