(define (abs-difference x y)
  (abs (- x y)))

(define (good-enough? guess prev-guess)
  (print "Guess: " guess)
  (print "Prev guess: " prev-guess)
  (print "Diff: " (abs-difference guess prev-guess) "\n")
  (<= (abs-difference guess prev-guess) (* guess 0.001)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
    guess
    (cube-root-iter (improve guess x) guess x)))

(define (cube-root x)
  (if (= x 0)
      0
      (cube-root-iter  1.0 0.0 x)))

(print "Result: " (cube-root 1959295893))
