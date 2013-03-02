
// 递归版本
fib := method(n,
  if(n<2, n, fib(n-1) + fib(n-2))
)

// 迭代版本
fib2 := method(n,
  first := 0
  second := 0
  all := 0
  for(i, 0, n,
    if(i==0,
        first := 1
        second := 0,
        all = first + second
        first = second
        second = all
      )
    )
    return all
)

// 没有lazy
Range
1 to(40) asList  map(i, v, fib2(v)) select(i, v, v < 4000000) select(i, v, v % 2 == 0) sum println
