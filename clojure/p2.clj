;;lazy..
(defn lazy-seq-fibo
  ([]
    (concat [0 1] (lazy-seq-fibo 0 1)))
  ([a b]
    (let [n (+ a b)]
      (lazy-seq
        (cons n (lazy-seq-fibo b n))))))

;;(print (drop 1 (take 10 (lazy-seq-fibo))))
(println (reduce + (filter even?
  (take-while (fn [x] (< x 4000000)) (lazy-seq-fibo)))))

;; 另一种简洁的方案
(defn fibo []
    (map first (iterate (fn [[a b]] [b (+ a b)]) [0 1])))

;(println (reduce + (for [n (fibo) :when (even? n) :while (> 4000000 n)] n)))
