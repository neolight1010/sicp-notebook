(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))

  (define (y k)
    (f (+ a (* k (h)))))

  (define (term k)
    (cond
      ((= k 0) (y 0))
      ((= k n) (y n))
      ((even? k) (* 2 (y k)))
      (else (* 4 (y k)))))

  (* (/ (h) 3) (sum term a inc n)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc a) (+ a 1))

; tests

(define (cube n)
  (* n n n))

(define (weird x)
  (+ (* x (- x 2)) (- x 5)))

(print (simpson cube 0 1.0 100)) ; 0.25
(print (simpson cube 0 1.0 1000)) ; 0.25
(print (simpson cube 0 20. 100)) ; 40000

(print (simpson weird 0 20. 100)) ; ~2366.7
