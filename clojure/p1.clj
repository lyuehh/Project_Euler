(println (reduce + (filter (fn [x] (or (== (mod x 3) 0) (== (mod x 5) 0))) (range 1000))))
