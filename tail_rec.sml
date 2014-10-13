(* Factorial *)

fun fact xs =
  let fun accu(x, acc) =
      case x of
           0 => acc
         | _ => accu(x-1, acc*x)
  in
    accu(xs,1)
  end


  (* Summ of elements in a list *)

fun list_sum xs =
  let fun sum(x, acc) =
    case x of
         [] => acc
       | head::tail => sum(tail, head + acc)
  in
    sum(xs, 0)
  end

  (* list reversal *)

fun list_reversal xs =
  let fun rever(x, y) =
    case x of
         [] => y
       | head::tail => rever(tail, head::y)
  in 
    rever(xs, [])
  end
