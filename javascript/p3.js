var num = 600851475143;
var res = 2;
while(res != num) {
  if(num % res === 0) {
    num = num / res;
  } else {
    res++;
  }
}
console.log(res);

