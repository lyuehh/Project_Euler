module Main where

-- 递归版本
fib n = if n < 2 then n else fib(n-1) + fib(n-2)

-- 尾递归版本
fib2_iter (x, y, 0) = (x, y, 0)
fib2_iter (x, y, z) = fib2_iter(y, x + y, z - 1)

fib2_ret (x, y, z) = x

fib2 x = fib2_ret(fib2_iter(0, 1, x))

-- 惰性求值
myRange start step = start:(myRange (start + step) step)

-- 我的版本...
main = print(sum [x | x <- takeWhile (< 4000000) (map (\x -> fib2(x)) [x | x <- (myRange 1 1)]), even x])

-- haskell 社区wiki 简洁版本, r即为结果
r = sum [ x | x <- takeWhile (<= 4000000) fibs, even x]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
-- main = print(r)
