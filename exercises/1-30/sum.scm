(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter 1 0))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (cube a)
  (* a a a))

(define (inc a)
  (+ a 1))

(print (sum-cubes 1 10)) ; 3025
