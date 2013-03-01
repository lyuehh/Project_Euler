fib = (n) ->
  if n < 2 then n else fib(n-1) + fib(n-2)

fib2 = (n) ->
  for i in [0..n]
    if i is 0
      first = 1
      second = 0
    else
      add = first + second
      first = second
      second = add
  return add

ret = [1..40].map((n) ->
  return fib2(n)
).filter((n) ->
  return n < 4000000
).filter((n) ->
  return n % 2 is 0
).reduce((memo, i) ->
  return memo + i
)
console.log ret
