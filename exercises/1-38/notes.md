# Exercise 1.38

The following procedure calculates $e$ using Euler's expansion and the
`cont-frac` procedure:

```scheme
(define (euler-number)
  (define (d i)
    (cond
      ((= (modulo (- i 3) 3) 0) 1)
      ((= (modulo (- i 3) 3) 1) 1)
      ((= (modulo (- i 3) 3) 2) (* (/ (+ i 1) 3) 2))))

  (define (euler-expansion)
    (cont-frac
    (lambda (_) 1)
    d
    50.))
  
  (+ (euler-expansion) 2.))
```

The constant `50` determines the precision of the approximation.
