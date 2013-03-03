(println (apply + 
                (filter (lambda (x) 
                          (or (= (% x 3) 0) (= (% x 5) 0) )) 
                        (sequence 1 999))))
(exit)
