
// 注释
var fib:Stream[Int] = Stream.cons(1, 
  Stream.cons(2, fib.zip(fib.tail).map{case(x,y) => x + y}))
println(fib.takeWhile{_ <= 4000000}.filter(_ % 2 == 0).foldLeft(0){_ + _})
