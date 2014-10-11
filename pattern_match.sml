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
