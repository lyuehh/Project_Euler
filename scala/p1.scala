println(Stream.range(0,1000)
  .filter{n => n % 3 == 0 || n % 5 == 0}.foldLeft(0){_ + _})
