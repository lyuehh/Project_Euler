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

