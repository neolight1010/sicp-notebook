(define (good-enough? guess x)
  (print "Guess: " guess)
  (print "X: " x "\n")
  (< (abs (- (* guess guess) x)) 0.001))

(define (average a b)
  (/ (+ a b) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter  1.0 x))

(print "Result: " (sqrt 5e-10))
