fun swap(one: int*int*int) =
  (#2 one, #3 one, #1 one)

val counter = 0

fun count(my_list: string list) =
  if null my_list then 0
  else 
    counter + 1 + count(tl my_list)

fun countup(start: int, ends: int) =
  if start = ends
  then ends::[]
  else
   start:: countup(start +1, ends)


fun is_older(first_date: int*int*int, second_date: int*int*int) = 
  if #1 second_date > #1 first_date
  then true
  else if #1 second_date < #1 first_date
  then false
  else
    if #2 second_date = #2 first_date andalso #3 second_date = #3 first_date
    then false
    else
    is_older(swap(first_date), swap(second_date))
    
fun number_in_month(list_of_dates: (int*int*int) list, month: int) =
  if null list_of_dates
  then 0
  else if #2 (hd list_of_dates) = month
  then counter + 1 + number_in_month(tl list_of_dates, month)
  else 
    number_in_month(tl list_of_dates, month)
  
fun number_in_months(list_of_dates: (int*int*int) list, months: int list) =
  if null months
  then 0
  else
    number_in_month(list_of_dates, hd months) +
    number_in_months(list_of_dates, tl months) 

fun dates_in_month(list_of_dates: (int*int*int) list, month: int) =
  if null list_of_dates
  then []
  else if #2 (hd list_of_dates) = month
  then hd list_of_dates:: dates_in_month(tl list_of_dates, month)
  else
    dates_in_month(tl list_of_dates, month)

fun dates_in_months(list_of_dates: (int*int*int) list, months: int list) =
  if null months
  then []
  else
    dates_in_month(list_of_dates, hd months)@
    dates_in_months(list_of_dates, tl months)

fun get_nth(my_list: string list, n: int) =
  if null my_list
  then "Not found"
  else if n = 1
  then hd my_list
  else
    get_nth(tl my_list, n - 1)

val list_of_months = [ "January ", "February ", "March ", "April ",
"May ", "June ", "July ", "August ", "September ", "October ", "November ", "December "]

fun date_to_string(date_int: int*int*int) =
  get_nth(list_of_months, #2 date_int) ^ Int.toString (#3 date_int) ^ ", " ^
  Int.toString (#1 date_int)

fun number_before_reaching_sum(sum: int, my_list: int list) = 
  if sum <= hd my_list
  then 0
  else
    1 + number_before_reaching_sum(sum - (hd my_list), tl my_list)

val days_in_each_month = [31,28,31,30,31,30,31,31,30,31,30,31]

fun what_month(num: int) = 
  number_before_reaching_sum(num, days_in_each_month) + 1


fun month_range(day1: int, day2: int) = 
  if day1 > day2
  then []
  else if day1 = day2
  then what_month(day2)::[]
  else
    what_month(day1)::month_range(day1+1, day2)

fun oldest(dates: (int*int*int) list) =
  if null dates
  then NONE
  else 
    let val tl_al = oldest(tl dates)
    in
      if isSome tl_al andalso is_older(valOf tl_al, hd dates)
      then tl_al
      else SOME (hd dates)
    end

(* Challenge question- 1 *)

fun check_presence(num: int, my_list: int list) =
  if null my_list
  then false
  else if num = hd my_list
  then true
  else
    check_presence(num, tl my_list)

fun get_unique_months(months: int list) =
  if null months
  then []
  else
    if check_presence(hd months, tl months)
    then get_unique_months(tl months)
    else
      hd months:: get_unique_months(tl months)

fun number_in_months_challenge(list_of_dates: (int * int * int) list, months:
int list) = 
    number_in_months(list_of_dates, get_unique_months(months))

fun dates_in_months_challenge(list_of_dates: (int * int * int) list, months:
int list) = 
    dates_in_months(list_of_dates, get_unique_months(months))


fun leap_check(year: int) =
  if year mod 4 = 0 andalso year mod 100 <> 0
  then true 
  else false

fun year_check(year: int) =
  if year > 0
  then true
  else false

fun month_check(month: int) =
  if month > 0 andalso month < 13
  then true
  else false

fun get_nth_int(my_list: int list, n: int) =
  if null my_list
  then 0
  else if n = 1
  then hd my_list
  else
    get_nth_int(tl my_list, n - 1)

fun date_leap_correct_check(date: int) =
  if date > 0 andalso date < 30
  then true 
  else false

fun date_correctness_check(date: int, month: int) =
  if date < 0 orelse (date > get_nth_int(days_in_each_month, month))
  then false 
  else true

fun date_check(date: int, month: int, year: int) =
  if leap_check(year) andalso month = 2
  then date_leap_correct_check(date)
  else date_correctness_check(date, month)

fun reasonable_date(date: int*int*int) =
  if year_check(#1 date) andalso month_check(#2 date)
  then
    date_check(#3 date, #2 date, #1 date)
  else false

;
