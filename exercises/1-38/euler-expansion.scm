(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-iter (+ i 1))))))
  
  (cont-frac-iter 1))

(define (euler-number)
  (define (d i)
    (cond
      ((= (modulo (- i 3) 3) 0) 1)
      ((= (modulo (- i 3) 3) 1) 1)
      ((= (modulo (- i 3) 3) 2) (* (/ (+ i 1) 3) 2))))

  (define (euler-expansion)
    (cont-frac
    (lambda (_) 1)
    d
    50.))
  
  (+ (euler-expansion) 2.))

(print (euler-number))
