
// 递归版本,效率很差
function fib(n) {
  if(n < 2) {
    return n;
  } else {
    return fib(n-1) + fib(n-2);
  }
}

// 非递归版本
function fib2(n) {
  var first, second, add;
  for(var i=0;i<n;i++) {
    if(i === 0) {
      first = 1;
      second = 0;
    }
    add = first + second;
    first = second;
    second = add;
  }
  return add;
}

// 没有lazy特性,取1到40
function p2() {
  var arr = [];
  for(var i=1;i<40;i++) {
    arr.push(i);
  }
  var ret = arr.map(function(n) {
    return fib2(n);
  }).filter(function(n) {
    return n < 4000000;
  }).filter(function(n) {
    return n % 2 === 0;
  }).reduce(function(memo, n) {
    return memo + n;
  }, 0);
  return ret;
}
console.log(p2());
