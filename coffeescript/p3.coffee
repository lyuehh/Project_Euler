num = 600851475143
res = 2
while res isnt num
  if num % res is 0
    num = num / res
  else
    res++

console.log res
