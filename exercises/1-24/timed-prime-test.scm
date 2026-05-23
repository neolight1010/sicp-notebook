(import (srfi 216))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (print n " *** " elapsed-time))



; fast-prime
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

; my part

(define (search-for-primes min max)
  (define (iterate)
    (timed-prime-test min)
    (if
      (even? min)
      (search-for-primes (+ min 1) max)
      (search-for-primes (+ min 2) max)))
  
  (if (> min max)
      (print "DONE")
      (iterate)))


; (search-for-primes 1000 1020)
; (search-for-primes 10000 10038)
; (search-for-primes 100000 100044)
; (search-for-primes 1000000 1000038)
(search-for-primes 10000000 10000103)
