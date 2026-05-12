(define (square n)
  (* n n))

(define (exp-iter b n a)
  (cond
    ((= n 0) 1)
    ((= n 1) (* b a))
    ((even? n) (exp-iter (square b) (/ n 2) a))
    (else (exp-iter b (- n 1) (* b a)))))

(define (exp b n)
  (exp-iter b n 1))

(print (exp 3 0)) ; 1
(print (exp 5 1)) ; 5
(print (exp 7 7)) ; 823543
(print (exp 9 3)) ; 729
(print (exp 2 14)) ; 16384
(print (exp 3 11)) ; 177147
(print (exp 4 17)) ; 1717986918
