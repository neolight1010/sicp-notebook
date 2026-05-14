(define (double a)
  (* 2 a))

(define (halve a)
  (/ a 2))

(define (product-iter a b c)
  (cond
    ((= b 0) 0)
    ((= b 1) (+ a c))
    ((even? b) (product-iter (double a) (halve b) c))
    (else (product-iter a (- b 1) (+ a c)))))

(define (product a b)
  (product-iter a b 0))

(print (product 5 0)) ; 0
(print (product 0 5)) ; 0
(print (product 5 1)) ; 5
(print (product 1 5)) ; 5
(print (product 5 8)) ; 40
(print (product 9 12)) ; 108
(print (product 292019 9369)) ; 2735926011
