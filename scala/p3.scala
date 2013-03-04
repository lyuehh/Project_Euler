var num = 600851475143L
var res = 2
while(res != num) {
  if(num % res == 0) {
    num = num / res
  } else {
    res += 1
  }
}
println(res)
