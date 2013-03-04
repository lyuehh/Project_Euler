num := 600851475143
res := 2
while(res != num,
  if(num % res == 0,
    num = num / res,
    res = res + 1
  )
)
res println

