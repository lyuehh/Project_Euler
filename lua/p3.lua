local num = 600851475143
local res = 2
while res ~= num do
  if num % res == 0 then
    num = num / res
  else
    res = res + 1
  end
end
print(res)

