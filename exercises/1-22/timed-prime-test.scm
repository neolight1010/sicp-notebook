(import (srfi 216))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (print n " *** " elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

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
