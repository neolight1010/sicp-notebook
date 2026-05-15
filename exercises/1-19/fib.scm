(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; my p
                   (+ (* 2 p q) (* q q)) ; my q
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(print (fib 0)) ; 0
(print (fib 1)) ; 1
(print (fib 2)) ; 1
(print (fib 3)) ; 2
(print (fib 4)) ; 3
(print (fib 5)) ; 5
(print (fib 6)) ; 8
(print (fib 7)) ; 13
(print (fib 8)) ; 21
(print (fib 9)) ; 34
(print (fib 10)) ; 55
(print (fib 50)) ; 12586269025
