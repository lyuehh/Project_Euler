(define (f? x) (or (= (% x 3) 0) (= (% x 5) 0)))

(print (filter f? (sequence 1 100)))
(exit)
