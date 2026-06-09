(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
        (term a)
        (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (pi n)
  (define (f n)
    (/ (* 4. n n) (- (* 4. n n) 1)))
  
  (* 2 (product f 1 inc n)))

(define (inc a) (+ a 1))

(print (pi 1000))
