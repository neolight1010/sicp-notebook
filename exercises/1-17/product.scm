(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (product a b)
  (cond
    ((= b 0) 0)
    ((= b 1) a)
    ((even? b) (product (double a) (halve b)))
    (else (+ a (product a (- b 1))))))

(print (product 3 0)) ; 0
(print (product 3 1)) ; 3
(print (product 0 3)) ; 0
(print (product 1 3)) ; 3
(print (product 7 15)) ; 105
(print (product 15 7)) ; 105
(print (product 14 4)) ; 56
(print (product 9 8)) ; 72
(print (product 1549 2998)) ; 4643902
