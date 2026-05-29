(import (srfi 216))

(define (fast-prime? n)
  (if (even? n)
      (fast-prime-iter? n 1 (/ n 2))
      (fast-prime-iter? n 1 (/ (- n 1) 2))))

(define (fast-prime-iter? n to-test times)
  (cond ((= times 0) true)
        ((fermat-test n to-test) (fast-prime-iter? n (+ to-test 1) (- times 1)))
        (else false)))

(define (fermat-test n m)
  (not (= (expmod m n n) 0)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (checked-remainder (checked-square (expmod base (/ exp 2) m) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (checked-remainder n-squared-checked m)
  (if (= n-squared-checked 0)
      0
      (remainder n-squared-checked m)))

(define (checked-square n m)
  (if (is-non-trivial-root? n m)
      0
      (square n)))

(define (is-non-trivial-root? n m)
  (and (not (= n 1)) (not (= n (- m 1))) (= (remainder (square n) m) 1)))

(define (square a)
  (* a a))

(print "primes (should be #t):")
; (print (fast-prime? 0))
; (print (fast-prime? 1))
(print (fast-prime? 2))
(print (fast-prime? 3))
(print (fast-prime? 5))
(print (fast-prime? 7))
(print (fast-prime? 13))
(print (fast-prime? 173))
(print (fast-prime? 1087))
(print (fast-prime? 7919))
(print (fast-prime? 193939))
(print (fast-prime? 24571))

(print "non-primes (should be #f):")
(print (fast-prime? 246))
(print (fast-prime? 549))
(print (fast-prime? 164))
(print (fast-prime? 250))
(print (fast-prime? 244))
(print (fast-prime? 26988))

(print "carmichael (should be #f):")
(print (fast-prime? 561))
(print (fast-prime? 1105))
(print (fast-prime? 1729))
(print (fast-prime? 2465))
(print (fast-prime? 2821))
(print (fast-prime? 6601))
(print (fast-prime? 8911))
(print (fast-prime? 41041))
(print (fast-prime? 62745))
