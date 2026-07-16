(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (display "trying: ")
    (display guess)
    (newline)

    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (avg a b)
  (/ (+ a b) 2))

(print "*** # original (no damping) ***")
(print (fixed-point (lambda (x) (/ (log 1000) (log x))) 10))

(newline)

(print "*** with average damping ***")
(print (fixed-point (lambda (x) (avg x (/ (log 1000) (log x)))) 10))
