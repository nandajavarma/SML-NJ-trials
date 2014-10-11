datatype myType = Twoints of int * int
                | Str of string
                | Empty;

val a = Str "hi";
val b = Twoints(4+5,7*7);
val c = Empty
val d = Str;
val e = a;


datatype suit = Heart | Diamond | Club | Spade
datatype deck = King | Queen | Jack | Ace 
              | Num of int

datatype id = Studentnum of int
            | Name of string
                      * (string option)
                      * string

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp


fun eval e =
  case e of
     Constant i => i
   | Negate e2 => ~ (eval e2)
   | Add(e1,e2) => (eval e1) + (eval e2)
   | Multiply(e1,e2) => (eval e2) * (eval e2)

fun number_of_adds e =
  case e of
       Constant i => 0
     | Negate e2 => number_of_adds(e2)
     | Add(e1,e2) => 1 + number_of_adds(e1) + number_of_adds(e2)
     | Multiply(e1,e2) => number_of_adds(e1) + number_of_adds(e2)

fun max_constant e =
  let fun max_of_two(e1 , e2) =
    let val m1 = max_constant e1
        val m2 = max_constant e2
    in 
      if m1 > m2 then m1 else m2
    end
  in 
    case e of
         Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1,e2) => max_of_two(e1,e2)
      | Multiply(e1,e2) => max_of_two(e1,e2)
  end
val test_expression = Add(Constant(4+5), Negate ( Constant(1) ));
val  nine = max_constant test_expression

type card = suit * deck;

val c1: card = (Diamond, Queen);
val c2: (suit * deck) = (Heart, Ace);
val c3 = (Spade, King);


(* pattern matching lists *)


fun sum_list xs =
  case xs of
       [] => 0
     | x::xs' => x + sum_list(xs')

fun append(xs, ys) =
  case xs of
       [] => ys
     | x::xs' => x :: append(xs',ys)
