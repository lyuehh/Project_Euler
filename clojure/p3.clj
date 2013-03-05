;http://clojure-euler.wikispaces.com/Problem+003
(defn prime? [n]
   (zero? (count (filter #(zero? (rem n %)) (range 3 n 2)))))

(defn ret [n]
  (first
      (filter #(and (zero? (rem n %))
                        (prime? %))
                   (range (int (Math/sqrt n)) 0 -1))))

(println (ret 600851475143))
