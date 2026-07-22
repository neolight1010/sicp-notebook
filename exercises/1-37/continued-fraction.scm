; recursive
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-iter (+ i 1))))))
  
  (cont-frac-iter 1))

(print "recursive:")
(print (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12))

(newline)

; iterative
(define (cont-frac n d k)
  (define (cont-frac-iter i q)
    (if (= i 1)
        q
        (let ((next-q (/ (n (- i 1)) (+ (d (- i 1)) q))))
          (cont-frac-iter (- i 1) next-q))))
  
  (cont-frac-iter k (/ (n k) (d k))))

(print "iterative:")
(print (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12))

; 4 decimal places is 0.6180

; k=11 yields 0.618055555555556, which is rounded to 0.6181
; k=12 yields 0.618025751072961, which is rounded to 0.6180
