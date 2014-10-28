fun sorted = fn x => fn y => fn z => z >= y andalso y>=x

val t1 = (((sorted 7) 9) 10)
