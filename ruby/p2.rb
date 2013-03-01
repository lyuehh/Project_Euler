
# 递归版本,效率很差
def fib(n)
  if n < 2
    return n
  else
    return fib(n-1) + fib(n-2)
  end
end
# puts (1..Float::INFINITY).lazy.map{|n| fib(n) }.take_while{|n| n < 4000000}.select{|x| x % 2 == 0}.reduce{|i,a| i + a}

# 非递归版本
def fib2(n)
  (0..n).inject([1,0]) {|(a,b), _| [b, a+b]}[0]
end
# puts (1..Float::INFINITY).lazy.map{|n| fib2(n) }.take_while{|n| n < 4000000}.select{|x| x % 2 == 0}.reduce(:+)

# 结合上面,可以写个一行版本的
puts (1..Float::INFINITY).lazy.map{|n| (0..n).inject([1,0]) {|(a,b), _| [b, a+b]}[0] }.take_while{|n| n < 4000000}.select{|x| x % 2 == 0}.reduce(:+)

