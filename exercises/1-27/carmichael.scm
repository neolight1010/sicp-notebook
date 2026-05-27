(import (srfi 216))

(define (is-congruent-throughout? n)
  (is-congruent-throughout-iter n n))

(define (is-congruent-throughout-iter a n)
  (if (= a 0)
      #t
      (and (is-congruent? a n) (is-congruent-throughout-iter (- a 1) n))))

(define (is-congruent? a n)
  (= (remainder a n) (expmod a n n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))


(define (square n)
  (* n n))

(print "primes (should be #t):")
(print (is-congruent-throughout? 0))
(print (is-congruent-throughout? 1))
(print (is-congruent-throughout? 2))
(print (is-congruent-throughout? 3))
(print (is-congruent-throughout? 5))
(print (is-congruent-throughout? 7))
(print (is-congruent-throughout? 13))
(print (is-congruent-throughout? 173))
(print (is-congruent-throughout? 1087))

(print "non-primes (should be #f):")
(print (is-congruent-throughout? 246))
(print (is-congruent-throughout? 549))
(print (is-congruent-throughout? 164))
(print (is-congruent-throughout? 250))
(print (is-congruent-throughout? 244))

(print "carmichael (should be #t):")
(print (is-congruent-throughout? 561))
(print (is-congruent-throughout? 1105))
(print (is-congruent-throughout? 1729))
(print (is-congruent-throughout? 2465))
(print (is-congruent-throughout? 2821))
(print (is-congruent-throughout? 6601))

