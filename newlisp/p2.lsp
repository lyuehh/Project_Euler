;; 递归版本
(define (fib n) (if (< n 2) n 
                  (+ (fib (- n 1)) (fib (- n 2)))))

;; 尾递归优化版本
(define (fib2 n) (fib2_iter 1 0 n))
(define (fib2_iter a b n) 
  (if (= n 0) b (fib2_iter (+ a b) a (- n 1))))

(println (apply + (filter (lambda (x) 
                            (= (% x 2) 0)) (filter (lambda (x) (< x 4000000)) 
                            (map (lambda (x) (fib2 x)) (sequence 1 40))))))
(exit)
