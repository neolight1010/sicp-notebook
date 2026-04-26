(define (abs-difference x y)
  (abs (- x y)))

(define (good-enough? guess prev-guess)
  (print "Guess: " guess)
  (print "Prev guess: " prev-guess)
  (print "Diff: " (abs-difference guess prev-guess) "\n")
  (<= (abs-difference guess prev-guess) (* guess 0.001)))

(define (average a b)
  (/ (+ a b) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (if (= x 0)
      0
      (sqrt-iter  1.0 0.0 x)))

(print "Result: " (sqrt 1959295893))
