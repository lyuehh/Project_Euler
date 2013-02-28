function q1() {
  var arr = [];
  for(var i=1;i<1000;i++) {
    arr.push(i);
  }

  var ret = arr.filter(function(item) {
    return item % 3 === 0 || item % 5 === 0;
  }).reduce(function(item, memo) {
    return item + memo;
  }, 0);
  console.log(ret);
}
q1();
