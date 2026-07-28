(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-iter (+ i 1))))))
  
  (cont-frac-iter 1))

(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (* -1 x x)))
    (lambda (i) (+ (* (- i 1) 2) 1))
    k))

(print (tan-cf 2 50.)) ; -2.18503986
(print (tan-cf 1 50.)) ; 1.55740772
(print (tan-cf 3.141619 50.)) ; 0.0002635
(print (tan-cf 5 50.)) ; -3.380515

