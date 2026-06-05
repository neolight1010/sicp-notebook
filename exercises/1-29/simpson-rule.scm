(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  
  (* (/ (h) 3) (simpson-iter f a n n (h))))


(define (simpson-iter f a n k h)
  (define (y)
    (f (+ a (* k h))))

  (define (next)
    (simpson-iter f a n (- k 1) h))
  
  (cond
    ((= k n) (+ (y) (next)))
    ((= k 0) (y))
    ((even? k) (+ (* 2 (y)) (next)))
    (else (+ (* 4 (y)) (next)))))

(define (cube n)
  (* n n n))

(print (simpson cube 0 1.0 100))
(print (simpson cube 0 1.0 1000))

(print (simpson cube 0 20. 100))
