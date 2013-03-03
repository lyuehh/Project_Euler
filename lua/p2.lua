_ = require "underscore"

-- 递归版本
function fib(n)
  if n < 2 then
    return n
  else
    return fib(n-1) + fib(n-2)
  end
end

-- 迭代版本
function fib2(n)
  i = 0
  local first = 0
  local second = 0
  local add = 0
  while i <= n do
    if i == 0 then
      first = 1
      second = 0
    else
      add = first + second
      first = second
      second = add
    end
    i = i + 1
  end
  return add
end

print(_.reduce(_.select(_.select(_.map(_.range(0,40):to_array(),
  function(i) return fib2(i) end),
    function(i) return i < 4000000 end),
      function(i) return i % 2 == 0 end),0,
        function(memo, i) return memo + i end))
