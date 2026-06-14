(import (srfi 216))

(define (filtered-accumulate combiner null-value term a next b pred?)
  (define (iter)
    (filtered-accumulate combiner null-value term (next a) next b pred?))
  
  (if (> a b)
      null-value
      (if (pred? a)
        (combiner
          (term a)
          (iter))
        (iter))))

; fast prime

(define (fast-prime? n)
  (fast-prime-iter? n 1000))

(define (fast-prime-iter? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime-iter? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square a)
  (* a a))

; sum-square-primes-in-range
(define (sum-square-primes-in-range a b)
  (filtered-accumulate + 0 square a inc b fast-prime?))

(define (inc a) (+ a 1))

; product-relatively-prime
(define (product-relatively-prime n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))

  (filtered-accumulate * 1 id 1 inc (- n 1) relatively-prime?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (id a)
  a)

; test
(print (sum-square-primes-in-range 10 29)) ; 11^2 + 13^2 + 17^2 + 19^2 + 23^2 + 29^2 = 2310
(print (product-relatively-prime 15)) ; 1 * 2 * 4 * 7 * 8 * 11 * 13 * 14 = 896896
