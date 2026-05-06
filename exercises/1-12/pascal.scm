(define (f i j)
  (cond
    ((or (<= i 1) (<= j 1)) 1)
    ((= i j) 1)
    (else (+ (f (- i 1) (- j 1)) (f (- i 1) j)))))

(print (f 5 3)) ; should be 6
(print (f 8 4)) ; should be 35
(print (f 8 5)) ; should be 35
(print (f 8 6)) ; should be 21
(print (f 1 1)) ; should be 1
(print (f 6 6)) ; should be 1
(print (f 8 2)) ; should be 7
